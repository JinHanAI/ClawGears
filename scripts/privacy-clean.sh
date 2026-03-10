#!/bin/bash
# =============================================================================
# OpenClaw Security Audit - Privacy Clean Script
# =============================================================================
# Description: Clean privacy information before open source release
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
    echo -e "${GREEN}[✅]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[⚠️]${NC} $1"
}

# =============================================================================
# Clean Functions
# =============================================================================

clean_readme() {
    print_info "Cleaning README.md..."

    # Replace specific user paths with generic paths
    sed -i '' 's|~/.openclaw|~/.openclaw|g' README.md
    sed -i '' 's|/Users/Winnie\.C/.openclaw|~/.openclaw|g' README.md

    print_success "README.md cleaned"
}

clean_readme_en() {
    print_info "Cleaning README.en.md..."

    # Already uses generic paths, just verify
    if grep -q "/Users/" README.en.md; then
        sed -i '' 's|/Users/[^/]*|~|g' README.en.md
        print_success "README.en.md cleaned"
    else
        print_success "README.en.md already clean"
    fi
}

clean_scripts() {
    print_info "Cleaning shell scripts..."

    for script in scripts/*.sh; do
        # Replace specific paths
        sed -i '' 's|~/|~/|g' "$script"
        sed -i '' 's|/Users/Winnie\.C/|~/|g' "$script"
    done

    print_success "Scripts cleaned"
}

clean_history() {
    print_info "Cleaning history files..."

    # Remove any history files that might contain IP addresses
    if [ -d "history" ]; then
        rm -rf history/*.json
        print_success "History files removed"
    fi
}

clean_ci_cd() {
    print_info "Cleaning CI/CD files..."

    for file in .github/workflows/*.yml; do
        # Replace specific paths
        sed -i '' 's|~/|~/|g' "$file"
        sed -i '' 's|/Users/Winnie\.C/|~/|g' "$file"
    done

    print_success "CI/CD files cleaned"
}

clean_omc_state() {
    print_info "Cleaning OMC state files..."

    if [ -d ".omc" ]; then
        rm -rf .omc
        print_success "OMC state files removed"
    fi
}

verify_clean() {
    print_info "Verifying privacy cleanup..."

    local issues=0

    # Check for remaining privacy issues (exclude this script itself)
    if grep -rq "Winnie\.C\|Victor\|/Users/victor\|178\.239" --include="*.sh" --include="*.md" --include="*.json" --include="*.yml" . --exclude-dir="./scripts/privacy-clean.sh" 2>/dev/null; then
        print_warning "Found potential privacy issues"
        grep -r "Winnie\.C\|Victor\|/Users/victor\|178\.239" --include="*.sh" --include="*.md" --include="*.json" --include="*.yml" --exclude-dir="./scripts/privacy-clean.sh" .
        ((issues++))
    else
        print_success "No privacy issues found"
    fi

    return $issues
}

# =============================================================================
# Main
# =============================================================================

echo "========================================"
echo "  Privacy Clean for Open Source"
echo "========================================"
echo ""

# Run all clean functions
clean_readme
clean_readme_en
clean_scripts
clean_history
clean_ci_cd
clean_omc_state

echo ""

# Verify
issues=$(verify_clean)

echo ""
echo "========================================"
echo "  Clean Summary"
echo "========================================"
echo ""

if [ $issues -eq 0 ]; then
    print_success "All privacy information cleaned!"
    echo ""
    echo "✅ Ready for open source release"
else
    print_warning "Some issues may remain. Please review manually."
fi
