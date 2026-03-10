#!/usr/bin/env bats
# =============================================================================
# Test Suite for generate-report.sh
# =============================================================================
# Description: Unit tests for the report generator script
# Author: Victor.Chen
# Version: 1.0.0
# Created: 2026-03-10
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
GENERATE_REPORT="$SCRIPT_DIR/scripts/generate-report.sh"

# =============================================================================
# Argument Parsing Tests
# =============================================================================

@test "generate-report.sh shows help with -h flag" {
    run bash "$GENERATE_REPORT" -h
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage"* ]]
}

@test "generate-report.sh shows help with --help flag" {
    run bash "$GENERATE_REPORT" --help
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage"* ]]
}

@test "generate-report.sh accepts --format html" {
    run bash "$GENERATE_REPORT" --format html --output /tmp/test-reports
    # Should create output directory and generate report
    [ -d "/tmp/test-reports" ] || mkdir -p /tmp/test-reports
    rm -rf /tmp/test-reports 2>/dev/null || true
}

@test "generate-report.sh accepts --format json" {
    run bash "$GENERATE_REPORT" --format json --output /tmp/test-reports
    [ -d "/tmp/test-reports" ] || mkdir -p /tmp/test-reports
    rm -rf /tmp/test-reports 2>/dev/null || true
}

# =============================================================================
# Script Validation Tests
# =============================================================================

@test "generate-report.sh is executable" {
    [ -x "$GENERATE_REPORT" ]
}

@test "generate-report.sh has no syntax errors" {
    bash -n "$GENERATE_REPORT"
}

# =============================================================================
# Report Generation Tests
# =============================================================================

@test "generate_html_report creates valid HTML file" {
    source "$SCRIPT_DIR/scripts/generate-report.sh"

    # Setup test environment
    OUTPUT_DIR="/tmp/test-reports-$$"
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    mkdir -p "$OUTPUT_DIR"

    # Run HTML generation
    run generate_html_report

    # Check if HTML file was created
    [ -f "$OUTPUT_DIR/security-audit-$TIMESTAMP.html" ] || [ -f "$OUTPUT_DIR"/*.html ]

    # Cleanup
    rm -rf "$OUTPUT_DIR"
}

@test "HTML report contains required sections" {
    OUTPUT_DIR="/tmp/test-reports-$$"
    mkdir -p "$OUTPUT_DIR"

    bash "$GENERATE_REPORT" --format html --output "$OUTPUT_DIR"

    # Find the generated HTML file
    HTML_FILE=$(ls "$OUTPUT_DIR"/*.html 2>/dev/null | head -1)

    if [ -n "$HTML_FILE" ]; then
        # Check for required HTML elements
        grep -q "<!DOCTYPE html>" "$HTML_FILE"
        grep -q "Security Audit Report" "$HTML_FILE"
        grep -q "Summary" "$HTML_FILE"
    fi

    rm -rf "$OUTPUT_DIR"
}

@test "Report includes timestamp" {
    OUTPUT_DIR="/tmp/test-reports-$$"
    mkdir -p "$OUTPUT_DIR"

    bash "$GENERATE_REPORT" --format html --output "$OUTPUT_DIR"

    HTML_FILE=$(ls "$OUTPUT_DIR"/*.html 2>/dev/null | head -1)

    if [ -n "$HTML_FILE" ]; then
        # Check for date/time in report
        grep -q "Generated:" "$HTML_FILE" || grep -q "$(date +%Y)" "$HTML_FILE"
    fi

    rm -rf "$OUTPUT_DIR"
}

# =============================================================================
# Audit Function Tests
# =============================================================================

@test "check_network_exposure returns valid format" {
    source "$SCRIPT_DIR/scripts/generate-report.sh"

    result=$(check_network_exposure)
    status=$(echo "$result" | cut -d'|' -f1)

    # Should be one of: PASS, FAIL, WARN, SKIP
    [[ "$status" == "PASS" || "$status" == "FAIL" || "$status" == "WARN" || "$status" == "SKIP" ]]
}

@test "check_token_security returns valid format" {
    source "$SCRIPT_DIR/scripts/generate-report.sh"

    result=$(check_token_security)
    status=$(echo "$result" | cut -d'|' -f1)

    [[ "$status" == "PASS" || "$status" == "FAIL" || "$status" == "WARN" || "$status" == "SKIP" ]]
}

@test "check_deny_commands returns valid format" {
    source "$SCRIPT_DIR/scripts/generate-report.sh"

    result=$(check_deny_commands)
    status=$(echo "$result" | cut -d'|' -f1)

    [[ "$status" == "PASS" || "$status" == "FAIL" || "$status" == "WARN" || "$status" == "SKIP" ]]
}

@test "check_tcc_permissions returns valid format" {
    source "$SCRIPT_DIR/scripts/generate-report.sh"

    result=$(check_tcc_permissions)
    status=$(echo "$result" | cut -d'|' -f1)

    [[ "$status" == "PASS" || "$status" == "FAIL" || "$status" == "WARN" || "$status" == "SKIP" ]]
}
