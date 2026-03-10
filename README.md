# ⚙️ ClawGears

> **保护您的 Mac，守护您的隐私** - OpenClaw 专属安全审计工具

[![License](https://img.shields.io/badge/license-MIT-blue)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey)](https://github.com/JinHanAI/openclaw-security-audit)
[![Version](https://img.shields.io/badge/version-1.1.0-green)](https://github.com/JinHanAI/openclaw-security-audit)

**中文文档** | [English Documentation](./README.en.md)

---

## ⚠️ 您的 OpenClaw 安全吗？

**如果您的 OpenClaw 出现以下情况，您的隐私可能正在泄露：**

| 风险 | 后果 | 严重程度 |
|------|------|----------|
| 🔓 Gateway 暴露到公网 | 任何人都能访问您的 AI 助手 | 致命 |
| 🔑 Token 太弱或泄露 | API 密钥被盗用，产生费用 | 严重 |
| 📷 摄像头/屏幕可被调用 | 隐私被偷窥 | 严重 |
| 💾 Full Disk Access 被授予 | 所有文件可被访问 | 高危 |
| 🌐 IP 出现在泄露数据库 | 已被黑客盯上 | 高危 |

**据统计，已有 220,000+ OpenClaw 实例暴露在公网，许多 API 密钥已泄露。**

---

## 🎯 谁应该使用这个工具？

### ✅ 适合您，如果：

- 您在 **Mac** 上运行 OpenClaw / MoltBot / ClawdBot
- 您担心 **AI 助手被黑客入侵**
- 您的 OpenClaw **连接了外部服务**（飞书、Telegram、WhatsApp）
- 您的 Mac 存储了 **敏感数据**（工作文件、个人照片）
- 您想要 **定期安全检查**，而不是等到出问题

### ❌ 不适合您，如果：

- 您不使用 OpenClaw 或类似的 AI 助手
- 您的 OpenClaw 运行在**完全隔离**的环境中
- 您已经有专业的安全团队在维护

---

## 💡 为什么选择 ClawGears？

### 🏆 核心优势

| 优势 | 说明 |
|------|------|
| **🎯 专注 OpenClaw** | 专为 OpenClaw 设计，检查项更深入 |
| **🔒 隐私保护视角** | 不只查系统安全，更关注隐私泄露 |
| **🌐 IP 泄露检测** | 唯一集成 openclaw.allegro.earth 检测的工具 |
| **🔧 一键修复** | 发现问题，自动修复，无需手动操作 |
| **📊 历史追踪** | 追踪安全趋势，对比变化 |
| **🤖 CI/CD 集成** | GitHub Actions 自动化审计 |

### 🆚 与竞品对比

| 功能 | ClawGears | 其他通用安全工具 |
|------|:-----------------------:|:----------------:|
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

### 🛡️ 安全保障
- ✅ **Gateway 安全** - 确保只监听本地，不被公网访问
- ✅ **Token 安全** - 强密钥保护，防止被盗用
- ✅ **权限控制** - 防止 FDA 越权访问您的文件
- ✅ **命令防护** - 阻止摄像头、屏幕等敏感操作

### 🔍 风险发现
- ✅ **IP 泄露检测** - 检查您的 IP 是否在黑客数据库中
- ✅ **端口暴露** - 发现意外暴露的服务端口
- ✅ **异常连接** - 检测可疑的网络外连

### 📊 持续监控
- ✅ **历史追踪** - 记录每次审计结果
- ✅ **趋势分析** - 了解安全态势变化
- ✅ **自动化** - CI/CD 集成，定时检查

### ⏱️ 时间节省
- ✅ **快速检查** - 5 秒完成关键项检查
- ✅ **一键修复** - 自动修复常见问题
- ✅ **报告生成** - 一键生成专业报告

---

## 🚀 快速开始

### 1 分钟快速检查
```bash
# 克隆仓库
git clone https://github.com/JinHanAI/openclaw-security-audit.git
cd openclaw-security-audit

# 快速检查（5 个关键项）
./scripts/quick-check.sh
```

### 检查 IP 是否泄露
```bash
./scripts/ip-leak-check.sh --all
```

### 完整审计
```bash
./scripts/generate-report.sh --format html --output ./reports
```

### 发现问题？一键修复
```bash
./scripts/interactive-fix.sh
```

---

## 📋 功能清单

### 安全检查
| 检查项 | 说明 |
|--------|------|
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

### 修复功能
| 功能 | 命令 |
|------|------|
| 修复 Gateway 暴露 | `--bind` |
| 生成新 Token | `--token` |
| 添加 deny 命令 | `--deny` |
| 重启 Gateway | `--restart` |
| 一键全部修复 | `--all` |

---

## 📚 文档

- **中文文档**: [README.md](./README.md)
- **English Documentation**: [README.en.md](./README.en.md)

---

## 🤝 贡献

欢迎贡献！ 请提交 Pull Request 或 Issue。

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

Made with ❤️ by [JinHanAI](https://github.com/JinHanAI)

</div>
