#!/bin/bash
# =============================================================================
# ClawGears - Interactive Menu Interface
# =============================================================================
# Description: User-friendly menu interface for ClawGears security audit tool
# Author: Victor.Chen
# Version: 1.2.0
# Created: 2026-03-10
# =============================================================================

set -e

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
CYAN='\033[36m'
MAGENTA='\033[35m'
NC='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'

# =============================================================================
# ASCII Art & Banner
# =============================================================================

show_banner() {
    clear
    echo -e "${CYAN}"
    echo "   ██████╗██╗     ██╗     ███████╗ ██████╗ ██████╗ ███████╗██╗   ██╗"
    echo "  ██╔════╝██║     ██║     ██╔════╝██╔═══██╗██╔══██╗██╔════╝╚██╗ ██╔╝"
    echo "  ██║     ██║     ██║     █████╗  ██║   ██║██║  ██║█████╗   ╚████╔╝ "
    echo "  ██║     ██║     ██║     ██╔══╝  ██║   ██║██║  ██║██╔══╝    ╚██╔╝  "
    echo "  ╚███╗   ███████╗███████╗███████╗╚██████╔╝╚██████╔╝██║  ██║   ██║   "
    echo "   ╚══╝   ╚══════╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝   ╚═╝   "
    echo -e "${NC}"
    echo ""
    echo -e "${BOLD}  ClawGears - OpenClaw Security Audit${NC}"
    echo -e "${DIM}  Protect Your Mac, Guard Your Privacy${NC}"
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# =============================================================================
# Menu Functions
# =============================================================================

show_main_menu() {
    echo ""
    echo -e "${BOLD}What would you like to do?${NC}"
    echo ""
    echo -e "  ${GREEN}[1]${NC} Quick Security Check     ${DIM}(5 critical items, ~5 sec)${NC}"
    echo -e "  ${GREEN}[2]${NC} Full Security Audit     ${DIM}(All checks, detailed report)${NC}"
    echo -e "  ${GREEN}[3]${NC} Check IP Leak          ${DIM}(allegro.earth, Censys, Shodan)${NC}"
    echo -e "  ${GREEN}[4]${NC} Interactive Fix        ${DIM}(Auto-fix security issues)${NC}"
    echo -e "  ${GREEN}[5]${NC} Generate Report       ${DIM}(HTML/JSON format)${NC}"
    echo -e "  ${GREEN}[6]${NC} System Security       ${DIM}(Firewall, FileVault, SIP)${NC}"
    echo ""
    echo -e "  ${YELLOW}[H]${NC} Help & Documentation"
    echo -e "  ${YELLOW}[Q]${NC} Quit"
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

show_help() {
    clear
    show_banner
    echo ""
    echo -e "${BOLD}📖 ClawGears Help${NC}"
    echo ""
    echo -e "${CYAN}Quick Start:${NC}"
    echo "  Run this script and select an option from the menu."
    echo ""
    echo -e "${CYAN}Options:${NC}"
    echo "  ${GREEN}1. Quick Check${NC}    - Fast security scan (5 items)"
    echo "  ${GREEN}2. Full Audit${NC}     - Complete security audit"
    echo "  ${GREEN}3. IP Leak${NC}       - Check if your IP is exposed"
    echo "  ${GREEN}4. Fix Issues${NC}     - Interactive security fixer"
    echo "  ${GREEN}5. Report${NC}        - Generate audit report"
    echo "  ${GREEN}6. System${NC}        - System security check"
    echo ""
    echo -e "${CYAN}Direct Commands:${NC}"
    echo "  ./scripts/quick-check.sh           - Quick check"
    echo "  ./scripts/generate-report.sh        - Generate report"
    echo "  ./scripts/ip-leak-check.sh         - IP leak check"
    echo "  ./scripts/interactive-fix.sh        - Interactive fix"
    echo ""
    echo -e "${CYAN}Documentation:${NC}"
    echo "  https://github.com/JinHanAI/ClawGears"
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# =============================================================================
# Action Functions
# =============================================================================

run_quick_check() {
    echo ""
    echo -e "${CYAN}▶ Running Quick Security Check...${NC}"
    echo ""
    bash "$SCRIPT_DIR/scripts/quick-check.sh"
}

run_full_audit() {
    echo ""
    echo -e "${CYAN}▶ Running Full Security Audit...${NC}"
    echo ""
    bash "$SCRIPT_DIR/scripts/generate-report.sh" --format html --output "$SCRIPT_DIR/history"
}

run_ip_leak_check() {
    echo ""
    echo -e "${CYAN}▶ Checking IP Leak...${NC}"
    echo ""
    bash "$SCRIPT_DIR/scripts/ip-leak-check.sh" --all
}

run_interactive_fix() {
    echo ""
    echo -e "${CYAN}▶ Starting Interactive Fix...${NC}"
    echo ""
    bash "$SCRIPT_DIR/scripts/interactive-fix.sh"
}

run_generate_report() {
    echo ""
    echo -e "${CYAN}▶ Generating Report...${NC}"
    echo ""

    echo -e "Select report format"
    echo -e "  ${GREEN}[1]${NC} HTML"
    echo -e "  ${GREEN}[2]${NC} JSON"
    echo ""
    read -p "Format [1/2]: " format_choice

    case $format_choice in
        2)
            bash "$SCRIPT_DIR/scripts/generate-report.sh" --format json --output "$SCRIPT_DIR/history"
            ;;
        *)
            bash "$SCRIPT_DIR/scripts/generate-report.sh" --format html --output "$SCRIPT_DIR/history"
            ;;
    esac
}

run_system_check() {
    echo ""
    echo -e "${CYAN}▶ Running System Security Check...${NC}"
    echo ""
    bash "$SCRIPT_DIR/scripts/system-security-check.sh"
}

# =============================================================================
# Main Menu Loop
# =============================================================================

main() {
    # Show banner
    show_banner

    # Main loop
    while true; do
        show_main_menu

        read -p "Enter your choice [1-6, H, Q]: " choice

        case $choice in
            1)
                run_quick_check
                echo ""
                read -p "Press Enter to continue..."
                ;;
            2)
                run_full_audit
                echo ""
                read -p "Press Enter to continue..."
                ;;
            3)
                run_ip_leak_check
                echo ""
                read -p "Press Enter to continue..."
                ;;
            4)
                run_interactive_fix
                echo ""
                read -p "Press Enter to continue..."
                ;;
            5)
                run_generate_report
                echo ""
                read -p "Press Enter to continue..."
                ;;
            6)
                run_system_check
                echo ""
                read -p "Press Enter to continue..."
                ;;
            [Hh]|[H])
                show_help
                ;;
            [Qq]|[Q])
                clear
                echo ""
                echo -e "${GREEN}Thanks for using ClawGears! 🦞${NC}"
                echo -e "${DIM}Protect Your Mac, Guard Your Privacy${NC}"
                echo ""
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid choice. Please try again.${NC}"
                ;;
        esac
    done
}

# Run main
main
