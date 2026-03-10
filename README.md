<div align="center">

# 🦞 ClawGears

### **Protect Your Mac, Guard Your Privacy**

**OpenClaw Security Audit Tool - Protect your Mac, guard your privacy**[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey?style=for-the-badge&logo=apple)](https://github.com/JinHanAI/ClawGears)
[![Version](https://img.shields.io/badge/version-1.1.0-green?style=for-the-badge)](https://github.com/JinHanAI/ClawGears)

**English** | [中文](./README.zh.md) | [Deutsch](./README.de.md) | [Français](./README.fr.md) | [Italiano](./README.it.md)

</div>

---

## ⚠️ Is Your OpenClaw Exposed?

> **Statistics show: 220,000+ OpenClaw instances are exposed publicly. Many API keys have already been leaked to hacker databases.**

### If you see any of these signs, your privacy may be at risk:

| 🚨 Risk | 💥 Consequence | ⚡ Severity |
|:--------|:---------------|:-----------:|
| **Gateway exposed to public** | Anyone can access your AI assistant | 🔴 Critical |
| **Weak or leaked token** | API keys stolen, unexpected charges | 🟠 Severe |
| **Camera/screen accessible** | Privacy compromised, screenshots taken | 🟠 Severe |
| **Full Disk Access granted** | All files accessible by AI | 🟡 High Risk |
| **IP in leak database** | Already targeted by hackers | 🟡 High Risk |

---

## 🎯 What Can ClawGears Do for You?

### ✅ 5-Second Quick Check

```bash
./scripts/quick-check.sh
```

**One command checks 5 critical security items:**
- 🔒 Is Gateway exposed to public network
- 🔑 Is Token strength sufficient
- 📷 Are sensitive commands blocked
- 💾 Are TCC permissions reasonable
- 🌐 Is your IP already leaked

### ✅ Auto-Fix Issues

```bash
./scripts/interactive-fix.sh
```

**One-click fix common problems:**
- Rebind Gateway to localhost
- Generate new strong Token
- Add sensitive command blacklist

### ✅ IP Leak Detection

```bash
./scripts/ip-leak-check.sh --all
```

**Exclusive Feature:** Integrated with `openclaw.allegro.earth` database to check if your IP has been leaked

---

## 💡 Why Choose ClawGears?

### 🏆 Key Advantages

| Advantage | Description |
|:----------|:------------|
| 🎯 **OpenClaw Focused** | Designed specifically for OpenClaw, deeper and more precise checks |
| 🔒 **Privacy-First** | Not just system security, but privacy leak risks |
| 🌐 **IP Leak Detection** | **The only** tool integrated with leak database |
| 🔧 **One-Click Fix** | Auto-fix issues, no manual intervention needed |
| 📊 **History Tracking** | Record every audit result, track security trends |
| 🤖 **CI/CD Ready** | GitHub Actions automation included |

### 🆚 Comparison with Alternatives

| Feature | <img src="https://img.shields.io/badge/ClawGears-🦞-red?style=flat-square" /> | Generic Security Tools |
|:--------|:-----------------------:|:----------------------:|
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

<table>
<tr>
<td width="50%" valign="top">

### 🛡️ Security Assurance

- ✅ **Gateway Security** - Localhost-only binding
- ✅ **Token Security** - Strong key protection
- ✅ **Permission Control** - Block FDA unauthorized access
- ✅ **Command Protection** - Block camera, screen operations

</td>
<td width="50%" valign="top">

### 🔍 Risk Discovery

- ✅ **IP Leak Detection** - Check if in hacker databases
- ✅ **Port Exposure** - Find accidentally exposed ports
- ✅ **Suspicious Connections** - Detect unusual network activity

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 📊 Continuous Monitoring

- ✅ **History Tracking** - Record every audit result
- ✅ **Trend Analysis** - Understand security posture changes
- ✅ **Automation** - CI/CD scheduled checks

</td>
<td width="50%" valign="top">

### ⏱️ Time Savings

- ✅ **Quick Check** - 5 seconds for critical items
- ✅ **One-Click Fix** - Auto-fix common issues
- ✅ **Report Generation** - Professional reports in one click

</td>
</tr>
</table>

---

## 🚀 Quick Start

### 📋 Who Should Use This?

| ✅ Perfect for You | ❌ Not for You |
|:-------------------|:---------------|
| Run OpenClaw / MoltBot / ClawdBot on **Mac** | Don't use OpenClaw or similar AI assistants |
| Concerned about **AI assistant security** | OpenClaw runs in **completely isolated** environment |
| OpenClaw **connects to external services** (Feishu, Telegram) | Already have a professional security team |
| Mac stores **sensitive data** (work files, personal photos) | |
| Want **regular security checks** | |

### ⚡ 1-Minute Quick Check

```bash
# Clone the repository
git clone https://github.com/JinHanAI/ClawGears.git
cd clawgears

# Quick check (5 critical items)
./scripts/quick-check.sh
```

### 🔍 Check IP Leak

```bash
./scripts/ip-leak-check.sh --all
```

### 📊 Full Audit Report

```bash
./scripts/generate-report.sh --format html --output ./reports
```

### 🔧 Found Issues? One-Click Fix

```bash
./scripts/interactive-fix.sh
```

---

## 📋 Feature Checklist

### 🔐 Security Checks

| Check | Description |
|:------|:------------|
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

### 🔧 Fix Features

| Feature | Command |
|:--------|:--------|
| Fix Gateway Exposure | `--bind` |
| Generate New Token | `--token` |
| Add Deny Commands | `--deny` |
| Restart Gateway | `--restart` |
| Fix All | `--all` |

---

## 📚 Documentation

**English** | [中文](./README.zh.md) | [Deutsch](./README.de.md) | [Français](./README.fr.md) | [Italiano](./README.it.md)

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

Made with ❤️ by [Winnie.C](https://github.com/JinHanAI)

</div>
