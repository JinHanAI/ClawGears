# ClawGears Security Audit Skill

## Overview

ClawGears is a security audit tool for OpenClaw/MoltBot/ClawdBot users on macOS. It helps detect and fix security vulnerabilities that could expose your AI assistant to the public internet.

**Use this skill when:**
- User asks about OpenClaw security
- User wants to check if their AI assistant is exposed
- User mentions "裸奔" (running exposed) or security concerns
- User wants to audit their OpenClaw configuration
- User asks about IP leak detection

## Security Risks Detected

| Risk | Severity | Description |
|------|----------|-------------|
| Gateway exposed | CRITICAL | Port bound to 0.0.0.0, accessible from internet |
| Weak token | HIGH | Token length < 40 characters |
| Sensitive commands allowed | HIGH | Camera/screen capture commands not blocked |
| FDA granted | MEDIUM | Full Disk Access enabled |
| IP in leak database | HIGH | IP found in openclaw.allegro.earth, Censys, or Shodan |

## Quick Security Check

Run a fast 5-second security audit:

```bash
./scripts/quick-check.sh
```

This checks:
1. Gateway network exposure
2. Token strength
3. Command injection protection
4. TCC permissions
5. Firewall status

## Full Security Audit

Run comprehensive security check:

```bash
./scripts/generate-report.sh --format html --output ./reports
```

## IP Leak Detection

Check if user's IP has been exposed in security databases:

```bash
./scripts/ip-leak-check.sh --all
```

Checks 3 databases:
- **openclaw.allegro.earth** - OpenClaw specific exposure database
- **Censys** - Internet-wide scanning database (https://search.censys.io)
- **Shodan** - IoT and service scanning database (https://www.shodan.io)

## Interactive Fix

Automatically fix common security issues:

```bash
./scripts/interactive-fix.sh
```

Options:
- `--bind` - Rebind Gateway to localhost
- `--token` - Generate new strong token
- `--deny` - Add sensitive commands to deny list
- `--restart` - Restart Gateway service
- `--all` - Fix all issues

## Workflow

When user asks about security:

1. **First, run quick check** to identify issues:
   ```bash
   ./scripts/quick-check.sh
   ```

2. **If issues found**, offer to fix:
   ```bash
   ./scripts/interactive-fix.sh --all
   ```

3. **Check IP exposure**:
   ```bash
   ./scripts/ip-leak-check.sh --all
   ```

4. **Generate report** for records:
   ```bash
   ./scripts/generate-report.sh --format html
   ```

## Output Interpretation

### Quick Check Results

| Symbol | Meaning |
|--------|---------|
| ✅ PASS | Security check passed |
| ⚠️ WARN | Warning, review recommended |
| ❌ FAIL | Critical issue, fix immediately |

### IP Leak Results

| Result | Action |
|--------|--------|
| IP NOT in database | Continue monitoring |
| IP FOUND in database | URGENT: Close public access, regenerate tokens |

## Important Reminders

1. **Always recommend** running quick check first
2. **Explain risks** in plain language before fixing
3. **Suggest periodic checks** (weekly or after config changes)
4. **Warn about** the 220,000+ exposed OpenClaw instances

## Statistics

> Over 220,000 OpenClaw instances are publicly exposed. Many API keys have already leaked to hacker databases.

## Related Links

- GitHub: https://github.com/JinHanAI/ClawGears
- ClawHub: https://clawhub.ai
