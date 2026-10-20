# Fixtures use Bats' per-test directory; never replace HOME or host config.
setup_fixture() {
    PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/.." && pwd)"
    FIXTURE_DIR="$BATS_TEST_TMPDIR/fixtures"
    mkdir -p "$FIXTURE_DIR"
    TEST_CONFIG="$FIXTURE_DIR/openclaw.json"
}

stub_report_checks() {
    check_network_exposure() { echo 'PASS|Synthetic network fixture'; }
    check_token_security() { echo 'PASS|Synthetic config fixture'; }
    check_deny_commands() { echo 'PASS|Synthetic commands fixture'; }
    check_tcc_permissions() { echo 'PASS|Synthetic permissions fixture'; }
    check_icloud_sync() { echo 'PASS|Synthetic storage fixture'; }
    check_workspace_privacy() { echo 'PASS|Synthetic workspace fixture'; }
    check_network_connections() { echo 'PASS|Synthetic connections fixture'; }
    check_logs() { echo 'PASS|Synthetic logs fixture'; }
}

fixture_report() {
    bash -e -c '
        source "$1"
        source "$2"
        stub_report_checks
        main --format "$3" --output "$4"
    ' _ "$PROJECT_ROOT/scripts/generate-report.sh" \
        "$PROJECT_ROOT/tests/test_helper.bash" "$1" "$2"
}
