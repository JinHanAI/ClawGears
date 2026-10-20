#!/usr/bin/env bats
load test_helper

setup() {
    setup_fixture
    source "$PROJECT_ROOT/scripts/generate-report.sh"
}

@test "report CLI accepts both help flags without generating files" {
    for flag in -h --help; do
        run bash "$PROJECT_ROOT/scripts/generate-report.sh" "$flag"
        [ "$status" -eq 0 ]; [[ "$output" == *Usage:* ]]
    done
}

@test "HTML generation creates a complete report under errexit" {
    run fixture_report html "$FIXTURE_DIR/reports"
    [ "$status" -eq 0 ]
    files=("$FIXTURE_DIR/reports/"*.html)
    [ "${#files[@]}" -eq 1 ]; [ -s "${files[0]}" ]
    grep -q '<!DOCTYPE html>' "${files[0]}"
    grep -q 'Security Audit Report' "${files[0]}"
    grep -q 'Summary' "${files[0]}"
    grep -q 'network exposure' "${files[0]}"
    grep -q 'token security' "${files[0]}"
    [[ "$output" != *sed:* ]]
    grep -q '</html>' "${files[0]}"
    grep -q 'Generated:' "${files[0]}"
}

@test "JSON generation creates a parseable report with eight fixture checks" {
    run fixture_report json "$FIXTURE_DIR/reports"
    [ "$status" -eq 0 ]
    files=("$FIXTURE_DIR/reports/"*.json)
    [ "${#files[@]}" -eq 1 ]
    python3 -c 'import json,sys; r=json.load(open(sys.argv[1])); assert r["timestamp"]; assert len(r["checks"])==8; assert r["summary"]=={"total":8,"passed":8,"failed":0,"warnings":0,"skipped":0}' "${files[0]}"
}

@test "report script is executable and has valid Bash syntax" {
    [ -x "$PROJECT_ROOT/scripts/generate-report.sh" ]
    bash -n "$PROJECT_ROOT/scripts/generate-report.sh"
}

@test "report network function handles mocked empty probes" {
    lsof() { return 0; }
    tailscale() { return 1; }
    run check_network_exposure
    [ "$status" -eq 0 ]; [[ "$output" == PASS\|* ]]
}

@test "report token function handles a missing fixture config" {
    run check_token_security "$TEST_CONFIG"
    [ "$status" -eq 0 ]; [[ "$output" == SKIP\|* ]]
}

@test "report deny commands function handles a missing fixture config" {
    run check_deny_commands "$TEST_CONFIG"
    [ "$status" -eq 0 ]; [[ "$output" == SKIP\|* ]]
}

@test "report permission function uses a mocked database result" {
    python3() { echo not_granted; }
    run check_tcc_permissions
    [ "$status" -eq 0 ]; [[ "$output" == PASS\|* ]]
}

@test "report CLI rejects an unknown option" {
    run bash "$PROJECT_ROOT/scripts/generate-report.sh" --invalid
    [ "$status" -eq 1 ]
}
