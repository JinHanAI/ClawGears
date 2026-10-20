#!/usr/bin/env bats
load test_helper

setup() {
    setup_fixture
    source "$PROJECT_ROOT/scripts/quick-check.sh"
}

@test "print helpers preserve the current Chinese labels" {
    run print_info 'Example'
    [ "$status" -eq 0 ]; [[ "$output" == *INFO* && "$output" == *Example* ]]
    run print_success 'Example'
    [ "$status" -eq 0 ]; [[ "$output" == *通过* ]]
    run print_warning 'Example'
    [ "$status" -eq 0 ]; [[ "$output" == *警告* ]]
    run print_error 'Example'
    [ "$status" -eq 0 ]; [[ "$output" == *风险* ]]
    run print_skip 'Example'
    [ "$status" -eq 0 ]; [[ "$output" == *跳过* ]]
}

@test "network check handles an absent Gateway" {
    lsof() { return 0; }
    run check_network_exposure
    [ "$status" -eq 0 ]; [[ "$output" == *'Gateway 未运行'* ]]
}

@test "network check rejects a public binding" {
    lsof() { echo 'node 123 user 15u IPv4 device 0t0 TCP 0.0.0.0:18789 (LISTEN)'; }
    run check_network_exposure
    [ "$status" -eq 1 ]; [[ "$output" == *暴露在公网* ]]
}

@test "network check accepts a loopback binding" {
    lsof() { echo 'node 123 user 15u IPv4 device 0t0 TCP 127.0.0.1:18789 (LISTEN)'; }
    run check_network_exposure
    [ "$status" -eq 0 ]; [[ "$output" == *安全绑定在本地* ]]
}

@test "token check handles a missing fixture config" {
    run check_token_security "$TEST_CONFIG"
    [ "$status" -eq 0 ]; [[ "$output" == *配置文件不存在* ]]
}

@test "token check rejects a short fixture token" {
    echo '{"gateway":{"auth":{"token":"short-example"},"mode":"local"}}' > "$TEST_CONFIG"
    run check_token_security "$TEST_CONFIG"
    [ "$status" -eq 1 ]; [[ "$output" == *Token\ 太短* ]]
}

@test "token check accepts a strong synthetic token and a quoted config path" {
    TEST_CONFIG="$FIXTURE_DIR/config's fixture.json"
    python3 -c 'import json,sys; json.dump({"gateway":{"auth":{"token":"x"*64},"mode":"local"}},open(sys.argv[1],"w"))' "$TEST_CONFIG"
    run check_token_security "$TEST_CONFIG"
    [ "$status" -eq 0 ]; [[ "$output" == *Token\ 强度足够* ]]
}

@test "token check rejects malformed fixture JSON" {
    echo '{invalid' > "$TEST_CONFIG"
    run check_token_security "$TEST_CONFIG"
    [ "$status" -eq 1 ]; [[ "$output" == *无法读取配置* ]]
}

@test "deny commands handles a missing fixture config" {
    run check_deny_commands "$TEST_CONFIG"
    [ "$status" -eq 0 ]; [[ "$output" == *配置文件不存在* ]]
}

@test "deny commands reports missing critical commands" {
    echo '{"gateway":{"nodes":{"denyCommands":[]}}}' > "$TEST_CONFIG"
    run check_deny_commands "$TEST_CONFIG"
    [ "$status" -eq 1 ]; [[ "$output" == *敏感命令未被阻止* ]]
}

@test "deny commands accepts every command required by the checker" {
    echo '{"gateway":{"nodes":{"denyCommands":["screencapture","camera.snap","camera.clip","screen.record","osascript"]}}}' > "$TEST_CONFIG"
    run check_deny_commands "$TEST_CONFIG"
    [ "$status" -eq 0 ]; [[ "$output" == *所有敏感命令已阻止* ]]
}

@test "firewall check reads an enabled fixture instead of the host" {
    get_firewall_status() { echo 'Firewall is enabled. (State = 1)'; }
    run check_firewall
    [ "$status" -eq 0 ]; [[ "$output" == *防火墙已开启* ]]
}

@test "disabled firewall retains its optional warning status" {
    get_firewall_status() { echo 'Firewall is disabled. (State = 0)'; }
    run check_firewall
    [ "$status" -eq 2 ]; [[ "$output" == *防火墙未开启* ]]
}

@test "quick main finishes its summary after nonzero check results under errexit" {
    export PROJECT_ROOT
    run bash -e -c '
        source "$PROJECT_ROOT/scripts/quick-check.sh"
        check_network_exposure() { echo network; return 1; }
        check_token_security() { echo token; return 1; }
        check_deny_commands() { echo commands; return 1; }
        check_fda_permission() { echo permissions; return 2; }
        check_firewall() { echo firewall; return 2; }
        main
    '
    [ "$status" -eq 0 ]
    [[ "$output" == *firewall* && "$output" == *检查摘要* && "$output" == *2\ 个高风险项* ]]
}

@test "quick script is executable and has valid Bash syntax" {
    [ -x "$PROJECT_ROOT/scripts/quick-check.sh" ]
    bash -n "$PROJECT_ROOT/scripts/quick-check.sh"
}

@test "quick CLI help exits successfully without running checks" {
    run bash "$PROJECT_ROOT/scripts/quick-check.sh" -h
    [ "$status" -eq 0 ]; [[ "$output" == *Usage:* && "$output" != *检查摘要* ]]
}

@test "quick CLI rejects unknown options" {
    run bash "$PROJECT_ROOT/scripts/quick-check.sh" --invalid
    [ "$status" -eq 1 ]; [[ "$output" == *'Unknown option'* ]]
}
