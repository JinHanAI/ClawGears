#!/bin/bash
# =============================================================================
# OpenClaw Security Audit - History Tracker
# =============================================================================
# Description: Track audit history and enable comparison over time
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

# Configuration
HISTORY_DIR="$(dirname "$0")/../history"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
TODAY=$(date +%Y-%m-%d)

# =============================================================================
# Helper Functions
# =============================================================================

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✅]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[⚠️]${NC} $1"
}

print_error() {
    echo -e "${RED}[❌]${NC} $1"
}

# =============================================================================
# History Functions
# =============================================================================

save_audit_result() {
    local result_file="$HISTORY_DIR/audit_$TIMESTAMP.json"

    # Collect audit data
    local audit_data=$(cat <<EOF
{
    "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
    "date": "$TODAY",
    "checks": {
        "network_exposure": $(check_network_exposure_json),
        "token_security": $(check_token_security_json),
        "deny_commands": $(check_deny_commands_json),
        "fda_permission": $(check_fda_json),
        "firewall": $(check_firewall_json),
        "filevault": $(check_filevault_json),
        "sip": $(check_sip_json)
    },
    "summary": {
        "passed": $PASSED,
        "failed": $FAILED,
        "warnings": $WARNINGS
    }
}
EOF
)

    echo "$audit_data" > "$result_file"
    print_success "History saved: $result_file"
}

check_network_exposure_json() {
    local gateway_bind=$(lsof -i :18789 2>/dev/null | grep -c "LISTEN" || echo "0")

    if [ "$gateway_bind" -eq 0 ]; then
        echo '{"status": "skip", "message": "Gateway not running"}'
    elif lsof -i :18789 2>/dev/null | grep -q "0.0.0.0"; then
        echo '{"status": "fail", "message": "Gateway exposed to network"}'
    else
        echo '{"status": "pass", "message": "Gateway securely bound"}'
    fi
}

check_token_security_json() {
    local config_path="$HOME/.openclaw/openclaw.json"

    if [ ! -f "$config_path" ]; then
        echo '{"status": "skip", "message": "Config not found"}'
        return
    fi

    python3 -c "
import json
with open('$config_path') as f:
    cfg = json.load(f)
    token = cfg.get('gateway', {}).get('auth', {}).get('token', '')
    mode = cfg.get('gateway', {}).get('mode', 'unknown')
    if len(token) < 40:
        print('{\"status\": \"fail\", \"message\": \"Token too short\"}')
    elif mode != 'local':
        print('{\"status\": \"warn\", \"message\": \"Mode not local\"}')
    else:
        print('{\"status\": \"pass\", \"message\": \"Token OK\"}')
" 2>/dev/null || echo '{"status": "error", "message": "Failed to check"}'
}

check_deny_commands_json() {
    local config_path="$HOME/.openclaw/openclaw.json"

    if [ ! -f "$config_path" ]; then
        echo '{"status": "skip", "message": "Config not found"}'
        return
    fi

    python3 -c "
import json
with open('$config_path') as f:
    cfg = json.load(f)
    deny = cfg.get('gateway', {}).get('nodes', {}).get('denyCommands', [])
    critical = ['camera.snap', 'camera.clip', 'screen.record', 'contacts.add']
    missing = [c for c in critical if c not in deny]
    if missing:
        print('{\"status\": \"fail\", \"message\": \"Missing: ' + ', '.join(missing) + '\"}')
    else:
        print('{\"status\": \"pass\", \"message\": \"All critical commands denied\"}')
" 2>/dev/null || echo '{"status": "error", "message": "Failed to check"}'
}

check_fda_json() {
    python3 -c "
import sqlite3
try:
    conn = sqlite3.connect('/Library/Application Support/com.apple.TCC/TCC.db')
    cursor = conn.cursor()
    cursor.execute('SELECT auth_value FROM access WHERE client LIKE \"%node%\" AND service=\"kTCCServiceSystemPolicyAllFiles\"')
    r = cursor.fetchone()
    conn.close()
    if r and r[0]==2:
        print('{\"status\": \"fail\", \"message\": \"FDA granted\"}')
    else:
        print('{\"status\": \"pass\", \"message\": \"FDA not granted\"}')
except:
    print('{\"status\": \"skip\", \"message\": \"Cannot check\"}')
" 2>/dev/null
}

check_firewall_json() {
    local fw_status=$(/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate 2>/dev/null)

    if echo "$fw_status" | grep -q "enabled"; then
        echo '{"status": "pass", "message": "Firewall enabled"}'
    else
        echo '{"status": "fail", "message": "Firewall disabled"}'
    fi
}

check_filevault_json() {
    local fv_status=$(fdesetup -status 2>/dev/null)

    if echo "$fv_status" | grep -q "On"; then
        echo '{"status": "pass", "message": "FileVault enabled"}'
    else
        echo '{"status": "fail", "message": "FileVault disabled"}'
    fi
}

check_sip_json() {
    local sip_status=$(csrutil status 2>/dev/null)

    if echo "$sip_status" | grep -q "enabled"; then
        echo '{"status": "pass", "message": "SIP enabled"}'
    else
        echo '{"status": "fail", "message": "SIP disabled"}'
    fi
}

# =============================================================================
# History Analysis Functions
# =============================================================================

show_history() {
    echo "========================================"
    echo "  Audit History"
    echo "========================================"
    echo ""

    local files=$(ls -t "$HISTORY_DIR"/audit_*.json 2>/dev/null | head -10)

    if [ -z "$files" ]; then
        print_info "No audit history found"
        return
    fi

    echo "Recent audits:"
    echo ""

    for file in $files; do
        local date=$(python3 -c "import json; print(json.load(open('$file'))['date'])" 2>/dev/null)
        local summary=$(python3 -c "
import json
data = json.load(open('$file'))
s = data.get('summary', {})
print(f\"✅ {s.get('passed', 0)} | ❌ {s.get('failed', 0)} | ⚠️ {s.get('warnings', 0)}\")
" 2>/dev/null)

        echo "  📅 $date | $summary"
    done

    echo ""
}

compare_audits() {
    local file1="$1"
    local file2="$2"

    if [ ! -f "$file1" ] || [ ! -f "$file2" ]; then
        print_error "Both files must exist"
        return 1
    fi

    echo "========================================"
    echo "  Audit Comparison"
    echo "========================================"
    echo ""

    python3 -c "
import json
from datetime import datetime

with open('$file1') as f:
    data1 = json.load(f)
with open('$file2') as f:
    data2 = json.load(f)

print(f'Audit 1: {data1[\"date\"]}')
print(f'Audit 2: {data2[\"date\"]}')
print('')

checks = ['network_exposure', 'token_security', 'deny_commands', 'fda_permission', 'firewall', 'filevault', 'sip']

for check in checks:
    c1 = data1['checks'].get(check, {}).get('status', 'unknown')
    c2 = data2['checks'].get(check, {}).get('status', 'unknown')

    if c1 != c2:
        print(f'🔄 {check}: {c1} → {c2}')
    else:
        print(f'➡️ {check}: {c1} (unchanged)')
" 2>/dev/null

    echo ""
}

show_trends() {
    echo "========================================"
    echo "  Security Trends"
    echo "========================================"
    echo ""

    local files=$(ls -t "$HISTORY_DIR"/audit_*.json 2>/dev/null | tail -7)

    if [ -z "$files" ]; then
        print_info "Not enough history for trends"
        return
    fi

    python3 -c "
import json
import os
from datetime import datetime

files = '''$files'''.strip().split('\n')
data = []

for f in files:
    if f:
        with open(f) as file:
            d = json.load(file)
            data.append({
                'date': d['date'],
                'passed': d['summary']['passed'],
                'failed': d['summary']['failed'],
                'warnings': d['summary']['warnings']
            })

print('Date       | ✅ Pass | ❌ Fail | ⚠️ Warn')
print('-' * 45)
for d in data:
    print(f\"{d['date']} |    {d['passed']}    |    {d['failed']}    |    {d['warnings']}\")
" 2>/dev/null

    echo ""
}

# =============================================================================
# Main
# =============================================================================

show_usage() {
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  save        Save current audit result to history"
    echo "  show        Show recent audit history"
    echo "  compare     Compare two audit results"
    echo "  trends      Show security trends over time"
    echo "  help        Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 save"
    echo "  $0 show"
    echo "  $0 trends"
    echo "  $0 compare history/audit_20260301.json history/audit_20260310.json"
}

case "$1" in
    save)
        PASSED=0
        FAILED=0
        WARNINGS=0
        save_audit_result
        ;;
    show)
        show_history
        ;;
    compare)
        if [ -z "$2" ] || [ -z "$3" ]; then
            print_error "Usage: $0 compare <file1> <file2>"
            exit 1
        fi
        compare_audits "$2" "$3"
        ;;
    trends)
        show_trends
        ;;
    help|--help|-h)
        show_usage
        ;;
    *)
        show_usage
        ;;
esac
