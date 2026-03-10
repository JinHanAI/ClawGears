#!/bin/bash
# =============================================================================
# OpenClaw Security Audit - Auto Fix Script
# =============================================================================
# Description: Automatically fix exposed Gateway configuration
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

# Configuration paths
OPENCLAW_CONFIG="$HOME/.openclaw/openclaw.json"
BACKUP_DIR="$HOME/.openclaw/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# =============================================================================
# Helper Functions
# =============================================================================

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# =============================================================================
# Backup Functions
# =============================================================================

backup_config() {
    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_DIR"
    fi
    cp "$OPENCLAW_CONFIG" "$BACKUP_DIR/openclaw.json.$TIMESTAMP"
    print_info "Backup created: $BACKUP_DIR/openclaw.json.$TIMESTAMP"
}

# =============================================================================
# Fix Functions
# =============================================================================

fix_gateway_bind() {
    print_info "Fixing Gateway bind address..."

    # Backup first
    backup_config

    # Use Python to update JSON config
    python3 -c "
import json
import sys

config_path = '$OPENCLAW_CONFIG'

try:
    with open(config_path, 'r') as f:
        config = json.load(f)
except Exception as e:
    print(f'Error reading config: {e}')
    sys.exit(1)

# Update gateway configuration
if 'gateway' not in config:
    config['gateway'] = {}

config['gateway']['bind'] = 'loopback'
config['gateway']['mode'] = 'local'

# Write back
with open(config_path, 'w') as f:
    json.dump(config, f, indent=2)

print('Gateway bind fixed to loopback')
"

    if [ $? -eq 0 ]; then
        print_success "Gateway bind fixed successfully"
        return 0
    else
        print_error "Failed to fix Gateway bind"
        return 1
    fi
}

fix_gateway_token() {
    print_info "Regenerating Gateway token..."

    # Backup first
    backup_config

    # Generate a new strong token (64 characters)
    NEW_TOKEN=$(openssl rand -hex 32)

    # Update config
    python3 -c "
import json
import sys

config_path = '$OPENCLAW_CONFIG'

try:
    with open(config_path, 'r') as f:
        config = json.load(f)
except Exception as e:
    print(f'Error reading config: {e}')
    sys.exit(1)

if 'gateway' not in config:
    config['gateway'] = {}
if 'auth' not in config['gateway']:
    config['gateway']['auth'] = {}

config['gateway']['auth']['token'] = '$NEW_TOKEN'

with open(config_path, 'w') as f:
    json.dump(config, f, indent=2)

print('New token generated (length: ' + str(len('$NEW_TOKEN')) + ')')
"

    if [ $? -eq 0 ]; then
        print_success "New token generated successfully"
        print_info "New token: ${NEW_TOKEN:0:8}...${NEW_TOKEN: -8}"
        return 0
    else
        print_error "Failed to generate new token"
        return 1
    fi
}

fix_deny_commands() {
    print_info "Adding dangerous commands to deny list..."

    # Backup first
    backup_config

    # Essential commands to deny for security
    ESSENTIAL_DENY=(
        "camera.snap",
        "camera.clip",
        "screen.record",
        "contacts.add",
        "reminders.add"
    )

    python3 -c "
import json
import sys

config_path = '$OPENCLAW_CONFIG'

try:
    with open(config_path, 'r') as f:
        config = json.load(f)
except Exception as e:
    print(f'Error reading config: {e}')
    sys.exit(1)

if 'gateway' not in config:
    config['gateway'] = {}
if 'nodes' not in config['gateway']:
    config['gateway']['nodes'] = {}

existing_deny = config['gateway']['nodes'].get('denyCommands', [])

# Merge and deduplicate
all_deny = list(set(existing_deny + [$ESSENTIAL_DENY]))

config['gateway']['nodes']['denyCommands'] = all_deny

with open(config_path, 'w') as f:
    json.dump(config, f, indent=2)

print('Updated denyCommands: ' + str(len(all_deny)) + ' commands')
"

    if [ $? -eq 0 ]; then
        print_success "Deny commands updated successfully"
        return 0
    else
        print_error "Failed to update deny commands"
        return 1
    fi
}

restart_gateway() {
    print_info "Restarting OpenClaw Gateway..."

    # Check if gateway is running
    if pgrep -f "openclaw-gateway" > /dev/null; then
        print_info "Stopping current gateway..."
        pkill -f "openclaw-gateway"
        sleep 2
    fi

    # Start gateway
    print_info "Starting gateway..."
    openclaw gateway start

    if [ $? -eq 0 ]; then
        print_success "Gateway restarted successfully"
        return 0
    else
        print_warning "Gateway restart may require manual intervention"
            return 1
    fi
}

# =============================================================================
# Main Script
# =============================================================================

show_usage() {
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  --bind        Fix Gateway bind address (set to loopback)"
    echo "  --token       Regenerate Gateway token"
    echo "  --deny        Add essential commands to deny list"
    echo "  --restart     Restart Gateway service"
    echo "  --all         Run all fixes"
    echo "  --help        Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --bind              Fix exposed Gateway"
    echo "  $0 --token             Regenerate weak token"
    echo "  $0 --all                Run all security fixes"
}

# Parse arguments
if [ $# -eq 0 ]; then
    show_usage
    exit 0
fi

FIX_BIND=false
FIX_TOKEN=false
FIX_DENY=false
RESTART=false

while [ $# -gt 0 ]; do
    case "$1" in
        --bind)
            FIX_BIND=true
            shift
            ;;
        --token)
            FIX_TOKEN=true
            shift
            ;;
        --deny)
            FIX_DENY=true
            shift
            ;;
        --restart)
            RESTART=true
            shift
            ;;
        --all)
            FIX_BIND=true
            FIX_TOKEN=true
            FIX_DENY=true
            RESTART=true
            shift
            ;;
        --help)
            show_usage
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
done

# Run fixes
echo "========================================"
echo "  OpenClaw Security Auto-Fix"
echo "========================================"
echo ""

ERRORS=0

if [ "$FIX_BIND" = true ]; then
    fix_gateway_bind
    if [ $? -ne 0 ]; then
        ((ERRORS++))
    fi
    echo ""
fi

if [ "$FIX_TOKEN" = true ]; then
    fix_gateway_token
    if [ $? -ne 0 ]; then
        ((ERRORS++))
    fi
    echo ""
fi

if [ "$FIX_DENY" = true ]; then
    fix_deny_commands
    if [ $? -ne 0 ]; then
        ((ERRORS++))
    fi
    echo ""
fi

if [ "$RESTART" = true ]; then
    restart_gateway
    if [ $? -ne 0 ]; then
        ((ERRORS++))
    fi
    echo ""
fi

# Summary
echo "========================================"
echo "  Fix Summary"
echo "========================================"
if [ $ERRORS -eq 0 ]; then
    print_success "All fixes completed successfully!"
    exit 0
else
    print_error "$ERRORS fix(es) failed. Please check the output above."
    exit 1
fi
