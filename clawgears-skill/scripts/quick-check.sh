#!/bin/bash
# =============================================================================
# OpenClaw Security Audit - Quick Check Mode
# =============================================================================
# Description: Quick security check for critical items only
# Author: Winnie.C
# Version: 1.0.0
# Created: 2026-03-10
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
NC='\033[0m'

# =============================================================================
# Helper Functions
# =============================================================================

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✅ PASS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[⚠️ WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[❌ FAIL]${NC} $1"
}

print_skip() {
    echo -e "${BLUE}[⏭ SKIP]${NC} $1"
}

# =============================================================================
# Quick Check Functions (Critical Items Only)
# =============================================================================

check_network_exposure() {
    echo -n "1. Network Exposure: "

    # Check Gateway port binding
    local gateway_bind=$(lsof -i :18789 2>/dev/null | grep -c "LISTEN" || true)

    if [ -z "$gateway_bind" ]; then
        print_skip "Gateway not running"
        return 0
    fi

    if echo "$gateway_bind" | grep -q "0.0.0.0"; then
        print_error "Gateway bound to 0.0.0.0 (EXPOSED!)"
        return 1
    fi

    if echo "$gateway_bind" | grep -q "127.0.0.1\|localhost"; then
        print_success "Gateway securely bound to localhost"
        return 0
    else
        print_warning "Gateway binding: $gateway_bind"
        return 2
    fi
}

check_token_security() {
    echo -n "2. Token Security: "

    local config_path="$HOME/.openclaw/openclaw.json"

    if [ ! -f "$config_path" ]; then
        print_skip "Config file not found"
        return 0
    fi

    local token_info=$(python3 -c "
import json
try:
    with open('$config_path') as f:
        cfg = json.load(f)
        token = cfg.get('gateway', {}).get('auth', {}).get('token', '')
        mode = cfg.get('gateway', {}).get('mode', 'unknown')
        print(f'{len(token)}|{mode}')
except:
    print('error|error')
" 2>/dev/null)

    local token_length=$(echo "$token_info" | cut -d'|' -f1)
    local mode=$(echo "$token_info" | cut -d'|' -f2)

    if [ "$token_length" = "error" ]; then
        print_error "Failed to read config"
        return 1
    fi

    if [ "$token_length" -lt 40 ]; then
        print_error "Token too short ($token_length chars, need >= 40)"
        return 1
    fi

    if [ "$mode" != "local" ]; then
        print_warning "Mode is '$mode' (should be 'local')"
        return 2
    fi

    print_success "Token OK ($token_length chars), mode: $mode"
    return 0
}

check_deny_commands() {
    echo -n "3. Command Injection: "

    local config_path="$HOME/.openclaw/openclaw.json"

    if [ ! -f "$config_path" ]; then
        print_skip "Config file not found"
        return 0
    fi

    local deny_list=$(python3 -c "
import json
try:
    with open('$config_path') as f:
        cfg = json.load(f)
        deny = cfg.get('gateway', {}).get('nodes', {}).get('denyCommands', [])
        print('|'.join(deny) if deny else '')
except:
    print('')
" 2>/dev/null)

    local critical_deny=("camera.snap" "camera.clip" "screen.record" "contacts.add")
    local missing=0

    for cmd in "${critical_deny[@]}"; do
        if ! echo "|$deny_list|" | grep -q "$cmd"; then
            if [ $missing -eq 0 ]; then
                print_error "Missing: $cmd"
            else
                echo "                     Missing: $cmd"
            fi
            ((missing++))
        fi
    done

    if [ $missing -gt 0 ]; then
        echo "                     (Total: $missing critical commands not denied)"
        return 1
    fi

    print_success "All critical commands denied"
    return 0
}

check_fda_permission() {
    echo -n "4. Full Disk Access: "

    local fda_status=$(python3 -c "
import sqlite3
try:
    conn = sqlite3.connect('/Library/Application Support/com.apple.TCC/TCC.db')
    cursor = conn.cursor()
    cursor.execute('SELECT auth_value FROM access WHERE client LIKE \"%node%\" AND service=\"kTCCServiceSystemPolicyAllFiles\"')
    r = cursor.fetchone()
    print('granted' if r and r[0]==2 else 'not_granted')
    conn.close()
except:
    print('unknown')
" 2>/dev/null)

    case $fda_status in
        "granted")
            print_error "FDA is GRANTED (PRIVACY RISK!)"
            return 1
            ;;
        "not_granted")
            print_success "FDA not granted"
            return 0
            ;;
        *)
            print_warning "Cannot check FDA status"
            return 2
            ;;
    esac
}

check_firewall() {
    echo -n "5. Firewall Status: "

    local fw_status=$(/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate 2>/dev/null)

    if [ "$fw_status" = "enabled" ]; then
        print_success "Firewall is enabled"
        return 0
    elif [ "$fw_status" = "disabled" ]; then
        print_error "Firewall is DISABLED"
        return 1
    else
        print_warning "Cannot determine firewall status"
        return 2
    fi
}

# =============================================================================
# Main
# =============================================================================

echo "========================================"
echo "  OpenClaw Quick Security Check"
echo "========================================"
echo ""
echo "Checking 5 critical security items..."
echo ""

ERRORS=0
WARNINGS=0

# Run all checks
check_network_exposure
RESULT=$?
if [ $RESULT -eq 1 ]; then ((ERRORS++))
elif [ $RESULT -eq 2 ]; then ((WARNINGS++)); fi

check_token_security
RESULT=$?
if [ $RESULT -eq 1 ]; then ((ERRORS++))
elif [ $RESULT -eq 2 ]; then ((WARNINGS++)); fi

check_deny_commands
RESULT=$?
if [ $RESULT -eq 1 ]; then ((ERRORS++))
elif [ $RESULT -eq 2 ]; then ((WARNINGS++)); fi

check_fda_permission
RESULT=$?
if [ $RESULT -eq 1 ]; then ((ERRORS++))
elif [ $RESULT -eq 2 ]; then ((WARNINGS++)); fi

check_firewall
RESULT=$?
if [ $RESULT -eq 1 ]; then ((ERRORS++))
elif [ $RESULT -eq 2 ]; then ((WARNINGS++)); fi

# Summary
echo ""
echo "========================================"
echo "  Quick Check Summary"
echo "========================================"
echo ""

if [ $ERRORS -gt 0 ]; then
    print_error "Found $ERRORS critical issue(s)"
    echo ""
    echo "Run full audit for details: ./scripts/generate-report.sh --format html"
    exit 1
elif [ $WARNINGS -gt 0 ]; then
    print_warning "Found $WARNINGS warning(s)"
    echo ""
    echo "Run full audit for details: ./scripts/generate-report.sh --format html"
    exit 0
else
    print_success "All checks passed!"
    exit 0
fi
