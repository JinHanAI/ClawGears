# ⚙️ ClawGears

> **Protect Your Mac, Guard Your Privacy** - The Security Audit Tool Built for OpenClaw

[![License](https://img.shields.io/badge/license-MIT-blue)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey)](https://github.com/JinHanAI/clawgears)
[![Version](https://img.shields.io/badge/version-1.1.0-green)](https://github.com/JinHanAI/clawgears)

[中文文档](./README.md) | **English Documentation**

---

## ⚠️ Is Your OpenClaw Secure?

**If your OpenClaw shows any of these signs, your privacy may be at risk:**

| Risk | Consequence | Severity |
|------|-------------|----------|
| 🔓 Gateway exposed to public | Anyone can access your AI assistant | Critical |
| 🔑 Weak or leaked token | API keys stolen, unexpected charges | Severe |
| 📷 Camera/screen accessible | Privacy compromised | Severe |
| 💾 Full Disk Access granted | All files accessible | High Risk |
| 🌐 IP in leak database | Already targeted by hackers | High Risk |

**Statistics show 220,000+ OpenClaw instances are exposed publicly. Many API keys have already been leaked.**

---

## 🎯 Who Should Use This Tool?

### ✅ Perfect for You if:

- You run OpenClaw / MoltBot / ClawdBot on **Mac**
- You're concerned about **AI assistant security**
- Your OpenClaw **connects to external services** (Feishu, Telegram, WhatsApp)
- Your Mac stores **sensitive data** (work files, personal photos)
- You want **regular security checks** before problems occur

### ❌ Not for You if:

- You don't use OpenClaw or similar AI assistants
- Your OpenClaw runs in a **completely isolated** environment
- You already have a professional security team

---

## 💡 Why Choose ClawGears?

### 🏆 Key Advantages

| Advantage | Description |
|-----------|-------------|
| **🎯 OpenClaw Focused** | Designed specifically for OpenClaw, deeper checks |
| **🔒 Privacy-First** | Not just system security, but privacy protection |
| **🌐 IP Leak Detection** | Only tool integrated with openclaw.allegro.earth |
| **🔧 One-Click Fix** | Auto-fix issues, no manual intervention needed |
| **📊 History Tracking** | Track security trends, compare changes |
| **🤖 CI/CD Ready** | GitHub Actions automation included |

### 🆚 Comparison with Alternatives

| Feature | ClawGears | Generic Security Tools |
|---------|:-----------------------:|:----------------------:|
| OpenClaw Deep Check | ✅ | ❌ |
| IP Leak Detection | ✅ | ❌ |
| TCC Permission Audit | ✅ | ❌ |
| iCloud Sync Check | ✅ | ❌ |
| Auto-Fix | ✅ | ❌ |
| Interactive Fix | ✅ | ❌ |
| History Tracking | ✅ | ❌ |
| Report Generation | ✅ | Partial |

---

## 📈 What You'll Get

### 🛡️ Security Assurance
- ✅ **Gateway Security** - Ensure localhost-only binding
- ✅ **Token Security** - Strong keys, prevent unauthorized use
- ✅ **Permission Control** - Block FDA unauthorized access
- ✅ **Command Protection** - Block camera, screen, and other sensitive operations

### 🔍 Risk Discovery
- ✅ **IP Leak Detection** - Check if your IP is in hacker databases
- ✅ **Port Exposure** - Find accidentally exposed service ports
- ✅ **Suspicious Connections** - Detect unusual network activity

### 📊 Continuous Monitoring
- ✅ **History Tracking** - Record every audit result
- ✅ **Trend Analysis** - Understand security posture changes
- ✅ **Automation** - CI/CD integration for scheduled checks

### ⏱️ Time Savings
- ✅ **Quick Check** - 5 seconds for critical items
- ✅ **One-Click Fix** - Auto-fix common issues
- ✅ **Report Generation** - Professional reports in one click

---

## 🚀 Quick Start

### 1-Minute Quick Check
```bash
# Clone the repository
git clone https://github.com/JinHanAI/clawgears.git
cd clawgears

# Quick check (5 critical items)
./scripts/quick-check.sh
```

### Check IP Leak
```bash
./scripts/ip-leak-check.sh --all
```

### Full Audit
```bash
./scripts/generate-report.sh --format html --output ./reports
```

### Found Issues? One-Click Fix
```bash
./scripts/interactive-fix.sh
```

---

## 📋 Feature Checklist

### Security Checks
| Check | Description |
|-------|-------------|
| Network Exposure | Gateway port binding, Tailscale status |
| Token Security | Length, configuration validation |
| Command Injection Protection | denyCommands configuration |
| TCC Permission Audit | Full Disk Access, Accessibility |
| Process Monitoring | Background services, unknown processes |
| iCloud Sync Check | Documents/Pictures/Desktop |
| Workspace Privacy | Sensitive files, symlinks |
| Network Connection Monitoring | External domain whitelist |
| Log Audit | Anomaly detection |
| System Security | Firewall, FileVault, SIP |

### Fix Features
| Feature | Command |
|---------|---------|
| Fix Gateway Exposure | `--bind` |
| Generate New Token | `--token` |
| Add Deny Commands | `--deny` |
| Restart Gateway | `--restart` |
| Fix All | `--all` |

---

## 🤝 Contributing

Contributions welcome! Please submit Pull Requests or Issues.

---

## 📄 License

MIT License - See [LICENSE](./LICENSE)

---

## ⚠️ Disclaimer

This tool is for security audit purposes only. Please understand the impact before using auto-fix features.

---

<div align="center">

**🦞 ClawGears**

*Protect Your Mac, Guard Your Privacy*

Made with ❤️ by [JinHanAI](https://github.com/JinHanAI)

</div>
