#!/usr/bin/env bats
load test_helper

setup() {
    setup_fixture
    source "$PROJECT_ROOT/scripts/ip-leak-check.sh"
    HISTORY_DIR="$FIXTURE_DIR/history"
    curl() {
        case "$*" in
            *api.ipify.org*) echo '203.0.113.10' ;;
            *'/api/check?'*) echo '{"exposed":false}' ;;
            *) return 1 ;;
        esac
    }
    lsof() { return 0; }
}

@test "IP CLI help accepts both help flags without probing" {
    for flag in -h --help; do
        run bash "$PROJECT_ROOT/scripts/ip-leak-check.sh" "$flag"
        [ "$status" -eq 0 ]; [[ "$output" == *Usage:* ]]
    done
}

@test "IP main accepts a specific synthetic address" {
    run main --ip 203.0.113.10
    [ "$status" -eq 0 ]
    [[ "$output" == *203.0.113.10* && "$output" == *'Leak Check Summary'* ]]
    [ -f "$HISTORY_DIR/leak-check-$TIMESTAMP.json" ]
}

@test "IP main accepts the ports flag with mocked probes" {
    run main --ports
    [ "$status" -eq 0 ]; [[ "$output" == *'Checking Port Exposure'* ]]
}

@test "IP main runs all checks using fixtures" {
    run main --all
    [ "$status" -eq 0 ]
    [[ "$output" == *Censys* && "$output" == *Shodan* && "$output" == *'Checking Port Exposure'* ]]
}

@test "IP script is executable and has valid Bash syntax" {
    [ -x "$PROJECT_ROOT/scripts/ip-leak-check.sh" ]
    bash -n "$PROJECT_ROOT/scripts/ip-leak-check.sh"
}

@test "public IP discovery returns the mocked address" {
    run get_public_ip
    [ "$status" -eq 0 ]; [ "$output" = 203.0.113.10 ]
}

@test "public IP discovery falls back after a failed provider" {
    curl() { [[ "$*" == *icanhazip.com* ]] && echo '198.51.100.10'; }
    export -f curl
    run bash -e -c 'source "$1"; get_public_ip' _ "$PROJECT_ROOT/scripts/ip-leak-check.sh"
    [ "$status" -eq 0 ]; [ "$output" = 198.51.100.10 ]
}

@test "public IP discovery reports unknown when every provider fails" {
    curl() { return 1; }
    export -f curl
    run bash -e -c 'source "$1"; get_public_ip' _ "$PROJECT_ROOT/scripts/ip-leak-check.sh"
    [ "$status" -eq 0 ]; [ "$output" = unknown ]
}

@test "port check accepts no listeners" {
    run check_port_exposure
    [ "$status" -eq 0 ]
}

@test "port check rejects wildcard listeners" {
    lsof() { echo 'node 123 user 15u IPv4 device 0t0 TCP *:18789 (LISTEN)'; }
    run check_port_exposure
    [ "$status" -eq 1 ]; [[ "$output" == *'EXPOSED PORTS'* ]]
}

@test "port check accepts loopback listeners" {
    lsof() { echo 'node 123 user 15u IPv4 device 0t0 TCP 127.0.0.1:18789 (LISTEN)'; }
    run check_port_exposure
    [ "$status" -eq 0 ]; [[ "$output" == *'safely bound'* ]]
}

@test "saved result is parseable JSON in the test directory" {
    run save_leak_check_result 203.0.113.10 0
    [ "$status" -eq 0 ]
    python3 -c 'import json,sys; x=json.load(open(sys.argv[1])); assert x["public_ip"]=="203.0.113.10"; assert x["exposed"]==0; assert x["timestamp"]; assert x["ports_checked"]==[18789,8080,3000,5000]' "$HISTORY_DIR/leak-check-$TIMESTAMP.json"
}

@test "IP main saves history and exits nonzero when exposure is detected" {
    run bash -e -c '
        source "$1"
        HISTORY_DIR=$2
        check_allegro_exposure() { return 1; }
        main --ip 203.0.113.10
    ' _ "$PROJECT_ROOT/scripts/ip-leak-check.sh" "$HISTORY_DIR"
    [ "$status" -eq 1 ]
    [[ "$output" == *'Found 1 exposure(s)'* && "$output" == *'Leak Check Summary'* ]]
    files=("$HISTORY_DIR/"*.json)
    [ "${#files[@]}" -eq 1 ]
    python3 -c 'import json,sys; assert json.load(open(sys.argv[1]))["exposed"]==1' "${files[0]}"
}

@test "IP CLI rejects an unknown option" {
    run bash "$PROJECT_ROOT/scripts/ip-leak-check.sh" --invalid
    [ "$status" -eq 1 ]
}
