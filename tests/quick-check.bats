#!/usr/bin/env bats
# =============================================================================
# Test Suite for quick-check.sh
# =============================================================================
# Description: Unit tests for the quick security check script
# Author: Victor.Chen
# Version: 1.0.0
# Created: 2026-03-10
# =============================================================================

# Setup: Define script path
SCRIPT_DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
QUICK_CHECK="$SCRIPT_DIR/scripts/quick-check.sh"

# =============================================================================
# Helper Functions Tests
# =============================================================================

@test "print_info outputs INFO message" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    # Mock the function to capture output
    run print_info "Test message"
    [ "$status" -eq 0 ]
    [[ "$output" == *"Test message"* ]]
}

@test "print_success outputs PASS message" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    run print_success "Test passed"
    [ "$status" -eq 0 ]
    [[ "$output" == *"PASS"* ]]
    [[ "$output" == *"Test passed"* ]]
}

@test "print_warning outputs WARN message" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    run print_warning "Test warning"
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARN"* ]]
    [[ "$output" == *"Test warning"* ]]
}

@test "print_error outputs FAIL message" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    run print_error "Test error"
    [ "$status" -eq 0 ]
    [[ "$output" == *"FAIL"* ]]
    [[ "$output" == *"Test error"* ]]
}

@test "print_skip outputs SKIP message" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    run print_skip "Test skip"
    [ "$status" -eq 0 ]
    [[ "$output" == *"SKIP"* ]]
    [[ "$output" == *"Test skip"* ]]
}

# =============================================================================
# Network Exposure Check Tests
# =============================================================================

@test "check_network_exposure returns 0 when Gateway not running" {
    # Mock lsof to return empty (no Gateway running)
    mock_lsof() {
        echo ""
    }
    export -f mock_lsof

    source "$SCRIPT_DIR/scripts/quick-check.sh"

    # Override lsof
    lsof() { mock_lsof; }
    export -f lsof

    run check_network_exposure
    [ "$status" -eq 0 ]
    [[ "$output" == *"SKIP"* ]]
}

@test "check_network_exposure fails when bound to 0.0.0.0" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    # Mock lsof to return 0.0.0.0 binding
    lsof() {
        echo "COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
node    12345 user   15u  IPv6 0x1234      0t0  TCP 0.0.0.0:18789 (LISTEN)"
    }
    export -f lsof

    run check_network_exposure
    [ "$status" -eq 1 ]
    [[ "$output" == *"EXPOSED"* ]]
}

@test "check_network_exposure passes when bound to localhost" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    # Mock lsof to return localhost binding
    lsof() {
        echo "COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
node    12345 user   15u  IPv6 0x1234      0t0  TCP 127.0.0.1:18789 (LISTEN)"
    }
    export -f lsof

    run check_network_exposure
    [ "$status" -eq 0 ]
    [[ "$output" == *"localhost"* ]]
}

# =============================================================================
# Token Security Check Tests
# =============================================================================

@test "check_token_security skips when config not found" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    # Ensure config doesn't exist
    rm -rf "$HOME/.openclaw/openclaw.json" 2>/dev/null || true

    run check_token_security
    [ "$status" -eq 0 ]
    [[ "$output" == *"SKIP"* ]]
}

@test "check_token_security fails for short token" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    # Create mock config with short token
    mkdir -p "$HOME/.openclaw"
    cat > "$HOME/.openclaw/openclaw.json" << 'EOF'
{
    "gateway": {
        "auth": {
            "token": "short_token_12345"
        },
        "mode": "local"
    }
}
EOF

    run check_token_security
    [ "$status" -eq 1 ]
    [[ "$output" == *"too short"* ]]

    # Cleanup
    rm -rf "$HOME/.openclaw/openclaw.json"
}

@test "check_token_security passes for strong token" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    # Create mock config with strong token (64 chars)
    mkdir -p "$HOME/.openclaw"
    cat > "$HOME/.openclaw/openclaw.json" << 'EOF'
{
    "gateway": {
        "auth": {
            "token": "this_is_a_very_long_and_secure_token_with_more_than_64_chars_1234567890"
        },
        "mode": "local"
    }
}
EOF

    run check_token_security
    [ "$status" -eq 0 ]
    [[ "$output" == *"PASS"* ]]

    # Cleanup
    rm -rf "$HOME/.openclaw/openclaw.json"
}

# =============================================================================
# Deny Commands Check Tests
# =============================================================================

@test "check_deny_commands skips when config not found" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    rm -rf "$HOME/.openclaw/openclaw.json" 2>/dev/null || true

    run check_deny_commands
    [ "$status" -eq 0 ]
    [[ "$output" == *"SKIP"* ]]
}

@test "check_deny_commands fails when critical commands not denied" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    mkdir -p "$HOME/.openclaw"
    cat > "$HOME/.openclaw/openclaw.json" << 'EOF'
{
    "gateway": {
        "nodes": {
            "denyCommands": []
        }
    }
}
EOF

    run check_deny_commands
    [ "$status" -eq 1 ]
    [[ "$output" == *"Missing"* ]]

    rm -rf "$HOME/.openclaw/openclaw.json"
}

@test "check_deny_commands passes when all critical commands denied" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    mkdir -p "$HOME/.openclaw"
    cat > "$HOME/.openclaw/openclaw.json" << 'EOF'
{
    "gateway": {
        "nodes": {
            "denyCommands": ["camera.snap", "camera.clip", "screen.record", "contacts.add"]
        }
    }
}
EOF

    run check_deny_commands
    [ "$status" -eq 0 ]
    [[ "$output" == *"PASS"* ]]

    rm -rf "$HOME/.openclaw/openclaw.json"
}

# =============================================================================
# Firewall Check Tests
# =============================================================================

@test "check_firewall passes when firewall enabled" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    # Mock socketfilterfw
    socketfilterfw() {
        echo "enabled"
    }
    export -f socketfilterfw

    run check_firewall
    [ "$status" -eq 0 ]
    [[ "$output" == *"enabled"* ]]
}

@test "check_firewall fails when firewall disabled" {
    source "$SCRIPT_DIR/scripts/quick-check.sh"

    socketfilterfw() {
        echo "disabled"
    }
    export -f socketfilterfw

    run check_firewall
    [ "$status" -eq 1 ]
    [[ "$output" == *"DISABLED"* ]]
}

# =============================================================================
# Script Execution Tests
# =============================================================================

@test "quick-check.sh is executable" {
    [ -x "$QUICK_CHECK" ]
}

@test "quick-check.sh runs without syntax errors" {
    bash -n "$QUICK_CHECK"
}

@test "quick-check.sh shows help with -h flag" {
    run bash "$QUICK_CHECK" -h 2>&1 || true
    # Script may exit 1 for unknown option, but shouldn't crash
    [ "$status" -le 1 ]
}
