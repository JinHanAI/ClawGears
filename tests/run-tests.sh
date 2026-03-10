#!/bin/bash
# =============================================================================
# OpenClaw Security Audit - Test Runner
# =============================================================================
# Description: Run all BATS tests for the project
# Author: Victor.Chen
# Version: 1.0.0
# Created: 2026-03-10
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Colors for output
RED='\033[0;31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
NC='\033[0m'

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# =============================================================================
# Check Prerequisites
# =============================================================================

check_bats() {
    if ! command -v bats &> /dev/null; then
        print_error "BATS (Bash Automated Testing System) is not installed"
        echo ""
        echo "Install BATS with one of the following methods:"
        echo ""
        echo "  macOS (Homebrew):"
        echo "    brew install bats-core"
        echo ""
        echo "  Ubuntu/Debian:"
        echo "    sudo apt-get install bats"
        echo ""
        echo "  From source:"
        echo "    git clone https://github.com/bats-core/bats-core.git"
        echo "    cd bats-core && ./install.sh /usr/local"
        echo ""
        exit 1
    fi
}

# =============================================================================
# Run Tests
# =============================================================================

run_all_tests() {
    print_info "Running all tests..."
    echo ""

    local total_passed=0
    local total_failed=0
    local test_files=("$SCRIPT_DIR"/*.bats)

    for test_file in "${test_files[@]}"; do
        if [ -f "$test_file" ]; then
            local test_name=$(basename "$test_file" .bats)
            print_info "Running: $test_name"
            echo "----------------------------------------"

            if bats "$test_file"; then
                ((total_passed++))
                print_success "$test_name passed"
            else
                ((total_failed++))
                print_error "$test_name failed"
            fi
            echo ""
        fi
    done

    # Summary
    echo "========================================"
    echo "  Test Summary"
    echo "========================================"
    echo ""
    echo "Test files passed: $total_passed"
    echo "Test files failed: $total_failed"
    echo ""

    if [ $total_failed -gt 0 ]; then
        print_error "Some tests failed"
        exit 1
    else
        print_success "All tests passed!"
        exit 0
    fi
}

run_specific_test() {
    local test_name="$1"
    local test_file="$SCRIPT_DIR/${test_name}.bats"

    if [ ! -f "$test_file" ]; then
        print_error "Test file not found: $test_file"
        echo ""
        echo "Available tests:"
        ls -1 "$SCRIPT_DIR"/*.bats 2>/dev/null | xargs -n1 basename | sed 's/.bats$//'
        exit 1
    fi

    print_info "Running: $test_name"
    echo "----------------------------------------"
    bats "$test_file"
}

# =============================================================================
# Main
# =============================================================================

show_usage() {
    echo "Usage: $0 [OPTIONS] [TEST_NAME]"
    echo ""
    echo "Options:"
    echo "  -h, --help      Show this help message"
    echo "  -l, --list      List available tests"
    echo "  -a, --all       Run all tests (default)"
    echo ""
    echo "Examples:"
    echo "  $0                    # Run all tests"
    echo "  $0 quick-check        # Run specific test file"
    echo "  $0 --list             # List available tests"
}

# Parse arguments
case "${1:-}" in
    -h|--help)
        show_usage
        exit 0
        ;;
    -l|--list)
        echo "Available tests:"
        ls -1 "$SCRIPT_DIR"/*.bats 2>/dev/null | xargs -n1 basename | sed 's/.bats$//'
        exit 0
        ;;
    -a|--all|"")
        check_bats
        run_all_tests
        ;;
    *)
        check_bats
        run_specific_test "$1"
        ;;
esac
