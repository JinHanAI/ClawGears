#!/usr/bin/env bats

assert_safe_source() {
    run bash -c '
        script=$1
        cd "$2"
        set -- --caller-argument
        before=$-
        source "$script"
        [ "$1" = --caller-argument ]
        [ "$-" = "$before" ]
        printf "source returned\n"
    ' _ "$BATS_TEST_DIRNAME/../scripts/$1" "$BATS_TEST_TMPDIR"
    [ "$status" -eq 0 ]
    [ "$output" = "source returned" ]
    [ -z "$(ls -A "$BATS_TEST_TMPDIR")" ]
}

@test "quick-check can be sourced without running checks or changing the caller" {
    assert_safe_source quick-check.sh
}

@test "ip-leak-check can be sourced without running checks or exiting the caller" {
    assert_safe_source ip-leak-check.sh
}

@test "generate-report can be sourced without generating a report" {
    assert_safe_source generate-report.sh
}
