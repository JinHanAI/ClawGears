<div align="center">

# 🦞 ClawGears

### **Protect Your Mac, Guard Your Privacy**

**OpenClaw Security Audit Tool - Protect your Mac, guard your privacy**[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey?style=for-the-badge&logo=apple)](https://github.com/JinHanAI/ClawGears)
[![Version](https://img.shields.io/badge/version-1.5.0-green?style=for-the-badge)](https://github.com/JinHanAI/ClawGears)

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

**Exclusive Feature:** Integrated with `openclaw.allegro.earth`, Censys, and Shodan databases to check if your IP has been leaked

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

### 🤖 AI Agent Usage (Easiest Way)

**The simplest way: Just ask your AI assistant!**

#### Option 1: Claude Code

```
帮我检查一下 OpenClaw 的安全性
```

Claude Code will automatically:
1. Clone ClawGears repository
2. Run security audit
3. Explain results in plain language
4. Offer to fix issues

#### Option 2: OpenClaw with ClawHub

```bash
# Install ClawGears skill
clawhub install clawgears-securityaudit
```

Then ask OpenClaw:
```
帮我做一个完整的安全审计
```

#### Option 3: Direct Clone

```bash
git clone https://github.com/JinHanAI/ClawGears.git
cd ClawGears
./clawgears.sh
```

### 🎮 Interactive Menu (Recommended)

```bash
# Clone the repository
git clone https://github.com/JinHanAI/ClawGears.git
cd ClawGears

# Launch interactive menu
./clawgears.sh
```

**Menu Preview:**

```
 ██████╗██╗     ██╗     ███████╗ ██████╗ ██████╗ ███████╗██╗   ██╗
██╔════╝██║     ██║     ██╔════╝██╔═══██╗██╔══██╗██╔════╝╚██╗ ██╔╝
██║     ██║     ██║     █████╗  ██║   ██║██║  ██║█████╗   ╚████╔╝
██║     ██║     ██║     ██╔══╝  ██║   ██║██║  ██║██╔══╝    ╚██╔╝
╚███╗   ███████╗███████╗███████╗╚██████╔╚██████╔██║  ██║   ██║
 ╚══╝   ╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝

      OpenClaw Security Audit Tool
      Protect Your Mac, Guard Your Privacy
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

What would you like to do?

  [1] Quick Security Check     (5 critical items, ~5 sec)
  [2] Full Security Audit     (All checks, detailed report)
  [3] Check IP Leak          (allegro.earth, Censys, Shodan)
  [4] Interactive Fix        (Auto-fix security issues)
  [5] Generate Report       (HTML/JSON format)
  [6] System Security       (Firewall, FileVault, SIP)

  [H] Help & Documentation
  [Q] Quit

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Enter your choice [1-6, H, Q]: _
```

**Menu Options:**
| Option | Description | Time |
|:-------|:------------|:-----|
| `[1]` Quick Security Check | 5 critical items | ~5 sec |
| `[2]` Full Security Audit | All checks + detailed report | ~30 sec |
| `[3]` Check IP Leak | Query allegro.earth, Censys, Shodan | ~10 sec |
| `[4]` Interactive Fix | Auto-fix security issues | Varies |
| `[5]` Generate Report | HTML/JSON format | ~5 sec |
| `[6]` System Security | Firewall, FileVault, SIP | ~5 sec |

---

## 📸 Demo: See It In Action

### Quick Security Check Output

```
========================================
  OpenClaw Quick Security Check
========================================

[INFO] Checking OpenClaw configuration...

========================================
  Network Exposure Check
========================================

[✅ PASS] Gateway is safely bound (127.0.0.1:18789)
[✅ PASS] No public network exposure detected

========================================
  Token Security Check
========================================

[✅ PASS] Token length is sufficient (64 characters)
[✅ PASS] Token configuration is valid

========================================
  Command Protection Check
========================================

[✅ PASS] Sensitive commands are blocked:
  - screencapture
  - camerasnap
  - osascript

========================================
  Summary
========================================

✅ All checks passed! Your OpenClaw is secure.
```

### IP Leak Detection Output

```
========================================
  Checking openclaw.allegro.earth
========================================

Your Public IP: 45.xxx.xxx.xxx

[✅ PASS] Your IP is NOT in the exposure database

========================================
  Checking Censys Database
========================================

[INFO] Censys is an internet scanning database

Check your IP at:
  🔗 https://search.censys.io/hosts/45.xxx.xxx.xxx

========================================
  Checking Shodan Database
========================================

[INFO] Shodan is another internet scanning database

Check your IP at:
  🔗 https://www.shodan.io/host/45.xxx.xxx.xxx

========================================
  Leak Check Summary
========================================

[✅ PASS] No exposure detected
```

### Context-Aware Risk Explanation (New! 🆕)

ClawGears now provides **scenario-based risk analysis** instead of one-size-fits-all recommendations:

```
========================================
  2. FileVault Encryption Check
========================================

📌 What this check protects:
   Prevents data access if your disk is stolen or lost

FileVault Status: FileVault is Off.

⚡ Real impact based on your scenario:
   ┌─────────────────────────────────────────────────────┐
   │ Usage Scenario                              │ Risk   │
   ├─────────────────────────────────────────────────────┤
   │ Mac fixed in secure office                  │ 🟢 Low │
   │ Frequently carried outside (cafe/travel)    │ 🟠 High│
   │ Stores sensitive data (finance/client info) │ 🔴 V.High│
   │ Needs remote restart control (SSH)          │ ⚪ OK   │
   └─────────────────────────────────────────────────────┘

💡 Recommendation:
   Level: [Optional] (Decide based on your scenario)

   • If you disabled FileVault for remote control needs, this is reasonable
   • You can compensate the risk with:
     - Physical security (keep Mac in safe location)
     - Regular backups of important data
```

### Issue Found & Fixed

```
========================================
  1. Gateway Network Exposure Check
========================================

📌 What this check protects:
   Detects if OpenClaw Gateway is exposed to the public internet

Gateway Binding: *:18789 (EXPOSED!)

⚡ Real impact:
   ┌─────────────────────────────────────────────────────┐
   │ Risk: Anyone on the internet can access your AI    │
   │ Impact: API keys stolen, unexpected charges,       │
   │         privacy leaked                              │
   └─────────────────────────────────────────────────────┘

💡 Recommendation:
   Level: [🔴 Must Fix]

Fix this issue? [Y/n]: Y

[INFO] Rebinding Gateway to localhost...
[INFO] Updating configuration...
[INFO] Restarting Gateway service...

[✅ PASS] Gateway is now safely bound to 127.0.0.1
```

---

### ⚡ 1-Minute Quick Check

```bash
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

Made with ❤️ by [Victor.Chen(https://github.com/JinHanAI)

</div>
