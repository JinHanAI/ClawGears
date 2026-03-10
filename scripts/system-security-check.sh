#!/bin/bash
# =============================================================================
# OpenClaw Security Audit - System Security Checks
# =============================================================================
# Description: macOS system-level security checks (Firewall, FileVault, SIP)
# Author: Chen Zong
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
# System Security Checks
# =============================================================================

check_firewall() {
    echo "========================================"
    echo "  1. Firewall Check"
    echo "========================================"
    echo ""

    # Global firewall state
    local global_state=$(/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate 2>/dev/null)
    echo "Global State: $global_state"

    # Check if firewall is enabled
    if [ "$global_state" = "Firewall is enabled. (State = 1)" ]; then
        print_success "Firewall is enabled"
    else
        print_error "Firewall is disabled"
        echo ""
        echo "Recommendation: Enable firewall with:"
        echo "  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on"
    fi

    echo ""

    # Check stealth mode
    local stealth_mode=$(/usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode 2>/dev/null)
    echo "Stealth Mode: $stealth_mode"

    if [ "$stealth_mode" = "Stealth mode enabled" ]; then
        print_success "Stealth mode is enabled"
    else
        print_warning "Stealth mode is disabled"
        echo "Recommendation: Enable stealth mode with:"
        echo "  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on"
    fi

    echo ""

    # List allowed apps
    echo "Allowed Applications:"
    /usr/libexec/ApplicationFirewall/socketfilterfw --listapps 2>/dev/null | head -20

    echo ""
}

check_filevault() {
    echo "========================================"
    echo "  2. FileVault Encryption Check"
    echo "========================================"
    echo ""

    # Check FileVault status
    local fv_status=$(fdesetup -status 2>/dev/null)

    echo "FileVault Status: $fv_status"

    if echo "$fv_status" | grep -q "FileVault is On"; then
        print_success "FileVault encryption is enabled"

        # Check if using secure key
        local fv_info=$(diskutil info / 2>/dev/null | grep -A5 "FileVault")
        echo ""
        echo "Encryption Details:"
        echo "$fv_info"
    else
        print_error "FileVault is NOT enabled"
        echo ""
        echo "⚠️ CRITICAL: Your disk is not encrypted!"
        echo "If your Mac is stolen, all data will be accessible."
        echo ""
        echo "Recommendation: Enable FileVault with:"
        echo "  System Preferences > Security & Privacy > FileVault > Turn On FileVault"
    fi

    echo ""
}

check_sip() {
    echo "========================================"
    echo "  3. SIP (System Integrity Protection) Check"
    echo "========================================"
    echo ""

    # Check SIP status
    local sip_status=$(csrutil status 2>/dev/null)

    echo "SIP Status: $sip_status"

    if echo "$sip_status" | grep -q "enabled"; then
        print_success "SIP is enabled"

        # Check specific protections
        echo ""
        echo "Protection Details:"
        csrutil status 2>/dev/null | grep -E "(enabled|disabled)" | while read line; do
            echo "  $line"
        done
    else
        print_error "SIP is DISABLED"
        echo ""
        echo "⚠️ CRITICAL: System Integrity Protection is disabled!"
        echo "This leaves your system vulnerable to malware."
        echo ""
        echo "Recommendation: Re-enable SIP by:"
        echo "  1. Restart Mac in Recovery Mode (Cmd+R)"
        echo "  2. Open Terminal"
        echo "  3. Run: csrutil enable"
        echo "  4. Restart"
    fi

    echo ""
}

check_gatekeeper() {
    echo "========================================"
    echo "  4. Gatekeeper Check"
    echo "========================================"
    echo ""

    # Check Gatekeeper status
    local gk_status=$(spctl --status 2>/dev/null)

    echo "Gatekeeper Status: $g_status"

    if echo "$gk_status" | grep -q "assessments enabled"; then
        print_success "Gatekeeper is enabled"
    else
        print_warning "Gatekeeper assessments are disabled"
        echo ""
        echo "Recommendation: Enable Gatekeeper with:"
        echo "  sudo spctl --master-enable"
    fi

    echo ""

    # Check for quarantined apps
    echo "Recent Quarantine Events:"
    xattr -l ~/Downloads/* 2>/dev/null | grep -A2 "com.apple.quarantine" | head -10

    echo ""
}

check_secure_boot() {
    echo "========================================"
    echo "  5. Secure Boot Check (Apple Silicon)"
    echo "========================================"
    echo ""

    # Check if Apple Silicon
    local chip_type=$(sysctl -n machdep.cpu.brand_string 2>/dev/null)

    if echo "$chip_type" | grep -q "Apple"; then
        echo "Chip: $chip_type"

        # Check secure boot policy
        local sb_policy=$(systemsetup -getsecureboot 2>/dev/null)

        if [ -n "$sb_policy" ]; then
            echo "Secure Boot Policy: $sb_policy"

            if echo "$sb_policy" | grep -qi "full"; then
                print_success "Full Security enabled"
            elif echo "$sb_policy" | grep -qi "reduced"; then
                print_warning "Reduced Security"
            else
                print_warning "Permissive Security"
            fi
        else
            print_info "Secure boot status not available"
        fi
    else
        print_info "Intel-based Mac - Secure Boot not applicable"
    fi

    echo ""
}

# =============================================================================
# Main
# =============================================================================

show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --all           Run all system security checks"
    echo "  --firewall      Check firewall status"
    echo "  --filevault     Check FileVault encryption"
    echo "  --sip           Check System Integrity Protection"
    echo "  --gatekeeper    Check Gatekeeper status"
    echo "  --secure-boot   Check Secure Boot (Apple Silicon)"
    echo "  -h, --help      Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --all"
    echo "  $0 --firewall --filevault"
}

# Parse arguments
RUN_ALL=false
RUN_FIREWALL=false
RUN_FILEVAULT=false
RUN_SIP=false
RUN_GATEKEEPER=false
RUN_SECURE_BOOT=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --all)
            RUN_ALL=true
            shift
            ;;
        --firewall)
            RUN_FIREWALL=true
            shift
            ;;
        --filevault)
            RUN_FILEVAULT=true
            shift
            ;;
        --sip)
            RUN_SIP=true
            shift
            ;;
        --gatekeeper)
            RUN_GATEKEEPER=true
            shift
            ;;
        --secure-boot)
            RUN_SECURE_BOOT=true
            shift
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
done

# If no specific checks selected, run all
if [ "$RUN_FIREWALL" = false ] && [ "$RUN_FILEVAULT" = false ] && [ "$RUN_SIP" = false ] && [ "$RUN_GATEKEEPER" = false ] && [ "$RUN_SECURE_BOOT" = false ]; then
    RUN_ALL=true
fi

echo "========================================"
echo "  macOS System Security Check"
echo "========================================"
echo ""

ERRORS=0

if [ "$RUN_ALL" = true ] || [ "$RUN_FIREWALL" = true ]; then
    check_firewall
fi

if [ "$RUN_ALL" = true ] || [ "$RUN_FILEVAULT" = true ]; then
    check_filevault
fi

if [ "$RUN_ALL" = true ] || [ "$RUN_SIP" = true ]; then
    check_sip
fi

if [ "$RUN_ALL" = true ] || [ "$RUN_GATEKEEPER" = true ]; then
    check_gatekeeper
fi

if [ "$RUN_ALL" = true ] || [ "$RUN_SECURE_BOOT" = true ]; then
    check_secure_boot
fi

# Summary
echo "========================================"
echo "  System Security Summary"
echo "========================================"
echo ""

print_success "System security check complete"
echo ""
echo "Run full OpenClaw audit: ./scripts/generate-report.sh --format html"
