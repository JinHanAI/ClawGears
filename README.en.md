# OpenClaw Security Audit

[![License](https://img.shields.io/badge/license-MIT-blue)](https://github.com/yourusername/openclaw-security-audit/blob/main/LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey)](https://github.com/yourusername/openclaw-security-audit)
[![Language](https://img.shields.io/badge/language-中文%20English-blue)](https://github.com/yourusername/openclaw-security-audit)

> A comprehensive security audit tool for OpenClaw on macOS. Protect your privacy, secure your Mac.

**中文文档** | [Chinese Documentation](./README.md)

---

## 🔒 Why This Tool?

Running OpenClaw on macOS is powerful, but without proper security configuration, it can expose your privacy:

- 🌐 **Network Exposure** - Gateway ports accessible to the whole network
- 🔑 **Token Leakage** - Weak authentication tokens easily guessed
- 📷 **Privacy Invasion** - Full Disk Access grants access to sensitive data
- ☁️ **iCloud Sync** - Sensitive files synced to cloud without consent

This tool helps you identify and fix these security issues before they become problems.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| **Network Exposure Check** | Verify Gateway only binds to localhost |
| **Token Security** | Check token length and configuration |
| **Command Injection Protection** | Audit denyCommands configuration |
| **TCC Permissions Audit** | Monitor Full Disk Access and Accessibility permissions |
| **iCloud Sync Check** | Detect if sensitive folders are syncing |
| **Workspace Privacy** | Check for symlinks to sensitive directories |
| **Network Monitoring** | Monitor external connections by domain |
| **Log Anomaly Detection** | Detect suspicious activities in logs |
| **Auto-Fix Scripts** | One-click fix for exposed configurations |
| **Report Generation** | Generate HTML/JSON audit reports |

---

## 📋 Security Checklist

### 1. Network Exposure Check
```bash
# Check Gateway port binding (MUST be localhost)
lsof -i :18789

# Check Tailscale status
tailscale status
```

**Pass Criteria**:
- ✅ Only listening on `127.0.0.1` or `localhost`
- ✅ Tailscale shows disconnected or off

### 2. Token Security Check
```bash
python3 -c "
import json
with open('$HOME/.openclaw/openclaw.json') as f:
    cfg = json.load(f)
    g = cfg.get('gateway', {})
    print(f'mode: {g.get(\"mode\")}')
    print(f'bind: {g.get(\"bind\")}')
    t = g.get('auth', {}).get('token', '')
    print(f'Token length: {len(t)}')
"
```

**Pass Criteria**:
- ✅ `mode`: "local"
- ✅ `bind`: "loopback" or "127.0.0.1"
- ✅ Token length >= 40

### 3. Command Injection Protection
```bash
python3 -c "
import json
with open('$HOME/.openclaw/openclaw.json') as f:
    cfg = json.load(f)
    deny = cfg.get('gateway', {}).get('nodes', {}).get('denyCommands', [])
    print('Denied commands:')
    for cmd in deny:
        print(f'  ❌ {cmd}')
"
```

**Pass Criteria**:
- ✅ Must include: `camera.snap`, `camera.clip`, `screen.record`
- ✅ Must include: `contacts.add`, `reminders.add`

### 4. TCC Permissions Audit
```bash
python3 -c "
import sqlite3
conn = sqlite3.connect('/Library/Application Support/com.apple.TCC/TCC.db')
cursor = conn.cursor()

# Full Disk Access (MUST be 0 or None)
cursor.execute('SELECT auth_value FROM access WHERE client=\"/usr/local/bin/node\" AND service=\"kTCCServiceSystemPolicyAllFiles\"')
r = cursor.fetchone()
print(f'Full Disk Access: {\"❌ Granted (RISK)\" if r and r[0]==2 else \"✅ Not granted (Safe)\"}')

# Accessibility (Required for UI automation)
cursor.execute('SELECT auth_value FROM access WHERE client=\"/usr/local/bin/node\" AND service=\"kTCCServiceAccessibility\"')
r = cursor.fetchone()
print(f'Accessibility: {\"✅ Granted (Normal)\" if r and r[0]==2 else \"❌ Not granted\"}')

conn.close()
"
```

**Pass Criteria**:
- ✅ Full Disk Access: Not granted (auth_value = 0 or None)
- ✅ Accessibility: Granted (auth_value = 2)

### 5. iCloud Sync Check
```bash
ls -la ~/Documents/ ~/Pictures/ ~/Desktop/
```

**Pass Criteria**:
- ✅ Documents, Pictures, Desktop are empty or contain only .localized

### 6. Workspace Privacy Check
```bash
ls -la ~/.openclaw/workspace/
```

**Pass Criteria**:
- ✅ Does not contain personal private files
- ⚠️ Watch for symlinks (may point to sensitive directories)

### 7. Network Connection Monitoring
```bash
lsof -p $(pgrep -f openclaw-gateway) -i
```

**Pass Criteria**:
- ✅ Only connects to known AI service domains (openai, anthropic, google)
- ✅ Only connects to configured channel services (feishu, telegram, whatsapp)
- ❌ No unexpected external IP connections

### 8. Log Anomaly Check
```bash
tail -50 ~/.openclaw/logs/gateway.log
```

**Pass Criteria**:
- ✅ No massive errors or abnormal requests
- ⚠️ WhatsApp/Telegram auto-reconnect is normal behavior

---

## 🚀 Quick Start

### Using Claude Code
```
/openclaw-security-audit
```

Or simply ask:
```
"Please run the OpenClaw security audit"
```

### Manual Execution
```bash
# Full audit
./scripts/run-audit.sh

# Quick check (key items only)
./scripts/run-audit.sh --quick

# Generate report
./scripts/generate-report.sh --format html

# Auto-fix exposed configuration
./scripts/fix-exposed-gateway.sh --all
```

---

## 🔧 Auto-Fix Scripts

### Fix Exposed Gateway
```bash
./scripts/fix-exposed-gateway.sh --bind
```
Changes Gateway bind to localhost only.

### Fix Weak Token
```bash
./scripts/fix-exposed-gateway.sh --token
```
Generates a new strong token (40+ characters).

### Fix Missing Deny Commands
```bash
./scripts/fix-exposed-gateway.sh --deny
```
Adds essential commands to denyCommands list.

---

## 📊 Report Generation

### HTML Report
```bash
./scripts/generate-report.sh --format html --output audit-report.html
```

### JSON Report
```bash
./scripts/generate-report.sh --format json --output audit-report.json
```

---

## 📋 Risk Response Plan

| Risk Scenario | Response |
|---------------|----------|
| Unknown IP connecting to Gateway | Restart Gateway immediately, change Token |
| Token leaked | Generate new Token immediately, update config |
| Suspicious process found | Kill process, check launchd services |
| Tailscale enabled unexpectedly | Disable immediately, check config |
| FDA permission granted | Revoke immediately |

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Inspired by the need for privacy protection in AI agent environments
- Built for OpenClaw users who care about security
- Thanks to the OpenClaw community for feedback

---

## 📮 Disclaimer

This tool is provided as-is for security auditing purposes. Always review the changes made by auto-fix scripts before applying them to production environments.
