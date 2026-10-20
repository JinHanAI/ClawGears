#!/usr/bin/env bats
load test_helper

setup() {
    setup_fixture
    mkdir -p "$FIXTURE_DIR/bin"
    cat > "$FIXTURE_DIR/bin/bats" <<'STUB'
#!/bin/bash
echo "$1" >> "$BATS_STUB_LOG"
[[ "$(basename "$1")" != "${BATS_STUB_FAIL:-}" ]]
STUB
    chmod +x "$FIXTURE_DIR/bin/bats"
}

@test "runner completes every suite when all suites pass under errexit" {
    run env PATH="$FIXTURE_DIR/bin:$PATH" BATS_STUB_LOG="$FIXTURE_DIR/calls" \
        bash -e "$PROJECT_ROOT/tests/run-tests.sh"
    [ "$status" -eq 0 ]
    suites=("$PROJECT_ROOT/tests/"*.bats)
    [ "$(wc -l < "$FIXTURE_DIR/calls" | tr -d ' ')" -eq "${#suites[@]}" ]
    [[ "$output" == *'Test files failed: 0'* ]]
}

@test "runner continues after a failed suite and returns failure" {
    run env PATH="$FIXTURE_DIR/bin:$PATH" BATS_STUB_LOG="$FIXTURE_DIR/calls" BATS_STUB_FAIL=quick-check.bats \
        bash -e "$PROJECT_ROOT/tests/run-tests.sh"
    [ "$status" -eq 1 ]
    suites=("$PROJECT_ROOT/tests/"*.bats)
    [ "$(wc -l < "$FIXTURE_DIR/calls" | tr -d ' ')" -eq "${#suites[@]}" ]
    [[ "$output" == *'Test files failed: 1'* ]]
}

@test "hosted scheduled security audit stays absent" {
    files=("$PROJECT_ROOT/.github/workflows/"*)
    [ "${#files[@]}" -eq 1 ]
    [ "${files[0]}" = "$PROJECT_ROOT/.github/workflows/ci.yml" ]
    ! grep -Eq '^[[:space:]]*(schedule:|- cron:)' "${files[0]}"
}
