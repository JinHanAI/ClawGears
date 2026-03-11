<div align="center">

# 🦞 ClawGears

### **保护您的 Mac，守护您的隐私**

**OpenClaw 专属安全审计工具**

[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey?style=for-the-badge&logo=apple)](https://github.com/JinHanAI/ClawGears)
[![Version](https://img.shields.io/badge/version-1.1.0-green?style=for-the-badge)](https://github.com/JinHanAI/ClawGears)

[English](./README.md) | **中文** | [Deutsch](./README.de.md) | [Français](./README.fr.md) | [Italiano](./README.it.md)

</div>

---

## ⚠️ 您的 OpenClaw 正在"裸奔"吗？

> **统计显示：已有 220,000+ OpenClaw 实例暴露在公网，大量 API 密钥已泄露到黑客数据库**

### 如果出现以下情况，您的隐私可能正在泄露：

| 🚨 风险 | 💥 后果 | ⚡ 严重程度 |
|:--------|:--------|:-----------:|
| **Gateway 暴露到公网** | 任何人都能访问您的 AI 助手 | 🔴 致命 |
| **Token 太弱或已泄露** | API 密钥被盗用，产生意外费用 | 🟠 严重 |
| **摄像头/屏幕可被调用** | 隐私被偷窥，屏幕被截图 | 🟠 严重 |
| **Full Disk Access 被授予** | 所有文件可被 AI 访问和读取 | 🟡 高危 |
| **IP 出现在泄露数据库** | 已被黑客盯上，成为攻击目标 | 🟡 高危 |

---

## 🎯 ClawGears 能为您做什么？

### ✅ 5 秒快速检查

```bash
./scripts/quick-check.sh
```

**一键检查 5 个关键安全项：**
- 🔒 Gateway 是否暴露到公网
- 🔑 Token 强度是否足够
- 📷 敏感命令是否被禁止
- 💾 TCC 权限是否合理
- 🌐 IP 是否已泄露

### ✅ 自动修复问题

```bash
./scripts/interactive-fix.sh
```

**一键修复常见问题：**
- 重新绑定 Gateway 到本地
- 生成新的强 Token
- 添加敏感命令黑名单

### ✅ IP 泄露检测

```bash
./scripts/ip-leak-check.sh --all
```

**独家功能：** 集成 `openclaw.allegro.earth`、Censys、Shodan 数据库，检测您的 IP 是否已被泄露

---

## 💡 为什么选择 ClawGears？

### 🏆 核心优势

| 优势 | 说明 |
|:-----|:-----|
| 🎯 **专注 OpenClaw** | 专为 OpenClaw 设计，检查项更深入、更精准 |
| 🔒 **隐私保护视角** | 不只查系统安全，更关注隐私泄露风险 |
| 🌐 **IP 泄露检测** | **唯一**集成泄露数据库检测的工具 |
| 🔧 **一键修复** | 发现问题自动修复，无需手动操作 |
| 📊 **历史追踪** | 记录每次审计结果，追踪安全趋势 |
| 🤖 **CI/CD 集成** | GitHub Actions 自动化审计 |

### 🆚 与竞品对比

| 功能 | <img src="https://img.shields.io/badge/ClawGears-🦞-red?style=flat-square" /> | 通用安全工具 |
|:-----|:-----------------------:|:------------:|
| OpenClaw 深度检查 | ✅ | ❌ |
| IP 泄露检测 | ✅ | ❌ |
| TCC 权限审计 | ✅ | ❌ |
| iCloud 同步检查 | ✅ | ❌ |
| 自动修复 | ✅ | ❌ |
| 交互式修复 | ✅ | ❌ |
| 历史追踪 | ✅ | ❌ |
| 报告生成 | ✅ | 部分 |

---

## 📈 使用后您将获得

<table>
<tr>
<td width="50%" valign="top">

### 🛡️ 安全保障

- ✅ **Gateway 安全** - 确保只监听本地
- ✅ **Token 安全** - 强密钥保护
- ✅ **权限控制** - 防止 FDA 越权访问
- ✅ **命令防护** - 阻止摄像头、屏幕操作

</td>
<td width="50%" valign="top">

### 🔍 风险发现

- ✅ **IP 泄露检测** - 检查是否在黑客数据库
- ✅ **端口暴露** - 发现意外暴露的端口
- ✅ **异常连接** - 检测可疑网络外连

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 📊 持续监控

- ✅ **历史追踪** - 记录每次审计结果
- ✅ **趋势分析** - 了解安全态势变化
- ✅ **自动化** - CI/CD 定时检查

</td>
<td width="50%" valign="top">

### ⏱️ 时间节省

- ✅ **快速检查** - 5 秒完成关键项
- ✅ **一键修复** - 自动修复常见问题
- ✅ **报告生成** - 一键生成专业报告

</td>
</tr>
</table>

---

## 🚀 快速开始

### 📋 适用人群

| ✅ 适合您 | ❌ 不适合您 |
|:----------|:------------|
| 在 **Mac** 上运行 OpenClaw / MoltBot / ClawdBot | 不使用 OpenClaw 或类似 AI 助手 |
| 担心 **AI 助手被黑客入侵** | OpenClaw 运行在**完全隔离**环境 |
| OpenClaw **连接了外部服务**（飞书、Telegram） | 已有专业安全团队维护 |
| Mac 存储了 **敏感数据**（工作文件、个人照片） | |
| 想要 **定期安全检查** | |

### 🤖 AI Agent 使用（最简单的方式）

**最简单的方式：直接问你的 AI 助手！**

#### 方式一：Claude Code

```
帮我检查一下 OpenClaw 的安全性
```

Claude Code 会自动：
1. 克隆 ClawGears 仓库
2. 运行安全审计
3. 用通俗语言解释结果
4. 提供修复建议

#### 方式二：OpenClaw + ClawHub

```bash
# 安装 ClawGears 技能
clawhub install clawgears-securityaudit
```

然后问 OpenClaw：
```
帮我做一个完整的安全审计
```

#### 方式三：直接克隆

```bash
git clone https://github.com/JinHanAI/ClawGears.git
cd ClawGears
./clawgears.sh
```

### 🎮 交互式菜单（推荐）

```bash
# 克隆仓库
git clone https://github.com/JinHanAI/ClawGears.git
cd ClawGears

# 启动交互式菜单
./clawgears.sh
```

**界面预览：**

```
 ██████╗██╗     ██╗     ███████╗ ██████╗ ██████╗ ███████╗██╗   ██╗
██╔════╝██║     ██║     ██╔════╝██╔═══██╗██╔══██╗██╔════╝╚██╗ ██╔╝
██║     ██║     ██║     █████╗  ██║   ██║██║  ██║█████╗   ╚████╔╝
██║     ██║     ██║     ██╔══╝  ██║   ██║██║  ██║██╔══╝    ╚██╔╝
╚███╗   ███████╗███████╗███████╗╚██████╔╚██████╔██║  ██║   ██║
 ╚══╝   ╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝

      OpenClaw 安全审计工具
      保护您的 Mac， 守护您的隐私
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

您想要执行什么操作？

  [1] 快速安全检查     (5 个关键项， ~5 秒)
  [2] 完整安全审计     (全面检查, 详细报告)
  [3] 检查 IP 泄露        (allegro.earth, Censys, Shodan)
  [4] 交互式修复        (自动修复安全问题)
  [5] 生成报告         (HTML/JSON 格式)
  [6] 系统安全         (防火墙, FileVault, SIP)

  [H] 帮助与文档
  [Q] 退出

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
请输入您的选择 [1-6, H, Q]: _
```

**菜单选项：**
| 选项 | 描述 | 时间 |
|:-----|:-----|:-----|
| `[1]` 快速安全检查 | 5 个关键项 | ~5 秒 |
| `[2]` 完整安全审计 | 全面检查 + 详细报告 | ~30 秒 |
| `[3]` 检查 IP 泄露 | 查询 allegro.earth, Censys, Shodan | ~10 秒 |
| `[4]` 交互式修复 | 自动修复安全问题 | 视情况 |
| `[5]` 生成报告 | HTML/JSON 格式 | ~5 秒 |
| `[6]` 系统安全 | 防火墙、FileVault、 SIP | ~5 秒 |

---

## 📸 效果演示

### 快速安全检查输出

```
========================================
  OpenClaw 快速安全检查
========================================

[INFO] 正在检查 OpenClaw 配置...

========================================
  网络暴露检查
========================================

[✅ 通过] Gateway 安全绑定 (127.0.0.1:18789)
[✅ 通过] 未检测到公网暴露

========================================
  Token 安全检查
========================================

[✅ 通过] Token 长度足够 (64 字符)
[✅ 通过] Token 配置有效

========================================
  命令保护检查
========================================

[✅ 通过] 敏感命令已阻止:
  - screencapture
  - camerasnap
  - osascript

========================================
  检查摘要
========================================

✅ 所有检查通过！您的 OpenClaw 是安全的。
```

### IP 泄露检测输出

```
========================================
  检查 openclaw.allegro.earth
========================================

您的公网 IP: 45.xxx.xxx.xxx

[✅ 通过] 您的 IP 未在泄露数据库中

========================================
  检查 Censys 数据库
========================================

[信息] Censys 是互联网扫描数据库

检查您的 IP:
  🔗 https://search.censys.io/hosts/45.xxx.xxx.xxx

========================================
  检查 Shodan 数据库
========================================

[信息] Shodan 是另一个互联网扫描数据库

检查您的 IP:
  🔗 https://www.shodan.io/host/45.xxx.xxx.xxx

========================================
  泄露检测摘要
========================================

[✅ 通过] 未检测到泄露
```

### 发现问题并修复

```
========================================
  交互式修复
========================================

[❌ 失败] Gateway 暴露在公网 (0.0.0.0:18789)

修复此问题? [Y/n]: Y

[信息] 正在重新绑定 Gateway 到本地...
[信息] 正在更新配置...
[信息] 正在重启 Gateway 服务...

[✅ 通过] Gateway 已安全绑定到 127.0.0.1
```

---

### ⚡ 1 分钟快速检查

```bash
# 快速检查（5 个关键项）
./scripts/quick-check.sh
```

### 🔍 检查 IP 是否泄露

```bash
./scripts/ip-leak-check.sh --all
```

### 📊 完整审计报告

```bash
./scripts/generate-report.sh --format html --output ./reports
```

### 🔧 发现问题？一键修复

```bash
./scripts/interactive-fix.sh
```

---

## 📋 功能清单

### 🔐 安全检查

| 检查项 | 说明 |
|:-------|:-----|
| 网络暴露检查 | Gateway 端口绑定、Tailscale 状态 |
| Token 安全检查 | 长度、配置验证 |
| 命令注入防护 | denyCommands 配置 |
| TCC 权限审计 | Full Disk Access、Accessibility |
| 进程监控 | 后台服务、未知进程 |
| iCloud 同步检查 | Documents/Pictures/Desktop |
| Workspace 隐私 | 敏感文件、符号链接 |
| 网络连接监控 | 外连域名白名单 |
| 日志审计 | 异常请求检测 |
| 系统安全检查 | 防火墙、FileVault、SIP |

### 🔧 修复功能

| 功能 | 命令 |
|:-----|:-----|
| 修复 Gateway 暴露 | `--bind` |
| 生成新 Token | `--token` |
| 添加 deny 命令 | `--deny` |
| 重启 Gateway | `--restart` |
| 一键全部修复 | `--all` |

---

## 📚 文档

[English](./README.md) | **中文** | [Deutsch](./README.de.md) | [Français](./README.fr.md) | [Italiano](./README.it.md)

---

## 🤝 贡献

欢迎贡献！请提交 Pull Request 或 Issue。

---

## 📄 许可证

MIT License - 详见 [LICENSE](./LICENSE)

---

## ⚠️ 免责声明

本工具仅供安全审计目的使用。使用自动修复功能前，请确保您了解其影响。

---

<div align="center">

**🦞 ClawGears**

*保护您的 Mac，守护您的隐私*

Made with ❤️ by [Victor.Chen(https://github.com/JinHanAI)

</div>
