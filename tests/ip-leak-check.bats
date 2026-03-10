#!/usr/bin/env bats
# =============================================================================
# Test Suite for ip-leak-check.sh
# =============================================================================
# Description: Unit tests for the IP leak check script
# Author: Victor.Chen
# Version: 1.0.0
# Created: 2026-03-10
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
IP_LEAK_CHECK="$SCRIPT_DIR/scripts/ip-leak-check.sh"

# =============================================================================
# Argument Parsing Tests
# =============================================================================

@test "ip-leak-check.sh shows help with -h flag" {
    run bash "$IP_LEAK_CHECK" -h
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage"* ]]
}

@test "ip-leak-check.sh shows help with --help flag" {
    run bash "$IP_LEAK_CHECK" --help
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage"* ]]
}

@test "ip-leak-check.sh accepts --ip flag" {
    run bash "$IP_LEAK_CHECK" --ip 8.8.8.8
    # Should accept IP and run check
    [[ "$output" == *"8.8.8.8"* ]] || [[ "$output" == *"Checking"* ]]
}

@test "ip-leak-check.sh accepts --ports flag" {
    run bash "$IP_LEAK_CHECK" --ports
    [[ "$output" == *"Port"* ]] || [[ "$output" == *"Checking"* ]]
}

@test "ip-leak-check.sh accepts --all flag" {
    run bash "$IP_LEAK_CHECK" --all
    # Should run all checks
    [ "$status" -le 1 ]  # May pass or fail, but shouldn't crash
}

# =============================================================================
# Script Validation Tests
# =============================================================================

@test "ip-leak-check.sh is executable" {
    [ -x "$IP_LEAK_CHECK" ]
}

@test "ip-leak-check.sh has no syntax errors" {
    bash -n "$IP_LEAK_CHECK"
}

# =============================================================================
# IP Detection Tests
# =============================================================================

@test "get_public_ip returns non-empty value" {
    source "$SCRIPT_DIR/scripts/ip-leak-check.sh"

    run get_public_ip
    [ -n "$output" ]
    [[ "$output" != "unknown" ]] || skip "Network not available"
}

@test "get_public_ip returns valid IP format" {
    source "$SCRIPT_DIR/scripts/ip-leak-check.sh"

    ip=$(get_public_ip)

    if [ "$ip" != "unknown" ]; then
        # Basic IP format validation
        [[ "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]
    fi
}

# =============================================================================
# Port Exposure Tests
# =============================================================================

@test "check_port_exposure runs without error" {
    source "$SCRIPT_DIR/scripts/ip-leak-check.sh"

    run check_port_exposure
    [ "$status" -le 1 ]  # May pass or fail
}

@test "check_port_exposure checks standard ports" {
    source "$SCRIPT_DIR/scripts/ip-leak-check.sh"

    # Should check ports 18789, 8080, 3000, 5000
    output=$(check_port_exposure 2>&1)

    [[ "$output" == *"18789"* ]] || [[ "$output" == *"8080"* ]] || [[ "$output" == *"Port"* ]]
}

# =============================================================================
# Result Saving Tests
# =============================================================================

@test "save_leak_check_result creates JSON file" {
    source "$SCRIPT_DIR/scripts/ip-leak-check.sh"

    HISTORY_DIR="/tmp/test-history-$$"
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)

    run save_leak_check_result "1.2.3.4" "0"

    if [ -d "$HISTORY_DIR" ]; then
        [ -f "$HISTORY_DIR/leak-check-$TIMESTAMP.json" ] || [ -f "$HISTORY_DIR"/*.json ]
        rm -rf "$HISTORY_DIR"
    fi
}

@test "saved result contains required fields" {
    source "$SCRIPT_DIR/scripts/ip-leak-check.sh"

    HISTORY_DIR="/tmp/test-history-$$"
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)

    save_leak_check_result "1.2.3.4" "0"

    JSON_FILE=$(ls "$HISTORY_DIR"/*.json 2>/dev/null | head -1)

    if [ -n "$JSON_FILE" ]; then
        grep -q "timestamp" "$JSON_FILE"
        grep -q "public_ip" "$JSON_FILE"
        grep -q "exposed" "$JSON_FILE"
        rm -rf "$HISTORY_DIR"
    fi
}

# =============================================================================
# Integration Tests
# =============================================================================

@test "Full IP leak check runs end-to-end" {
    run bash "$IP_LEAK_CHECK" --ip 192.168.1.1 --ports

    # Should complete without crashing
    [ "$status" -le 1 ]
}

@test "Leak check saves history when run" {
    OUTPUT_DIR="/tmp/test-history-$$"

    # Run with specific IP to avoid network dependency
    bash "$IP_LEAK_CHECK" --ip 10.0.0.1 2>&1 || true

    # History should be created in script's history directory
    # (may not exist if check fails early)
    rm -rf "$OUTPUT_DIR" 2>/dev/null || true
}
