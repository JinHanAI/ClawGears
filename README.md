# OpenClaw 安全审计 Skill

## 简介
本 Skill 提供完整的 OpenClaw 安全性检查流程，用于定期审计 Mac mini 上运行的 OpenClaw 是否存在安全风险。

## 适用场景
- 每次使用 OpenClaw 前进行快速安全检查
- 每 30 天定期安全审计
- 发现异常行为时的排查
- 陈总（用户）担忧外部黑客入侵时的确认

## 核心安全诉求

| # | 诉求 | 风险等级 |
|---|------|----------|
| 1 | 防止外部黑客通过 Gateway 入侵 | 🔴 高 |
| 2 | 防止命令注入导致隐私泄露 | 🔴 高 |
| 3 | 防止 Token 泄露被滥用 | 🟠 中 |
| 4 | 防止本地隐私被 OpenClaw 访问 | 🟠 中 |
| 5 | 防止 iCloud 数据被同步 | 🟢 低 |

## 检查流程

### 1. 网络暴露检查
```bash
# 检查 Gateway 端口绑定（必须是 localhost）
lsof -i :18789

# 检查 Tailscale 状态
tailscale status
```

**通过标准**：
- ✅ 只监听 `127.0.0.1` 或 `localhost`
- ✅ Tailscale 显示未连接或已关闭

### 2. Token 安全检查
```bash
python3 -c "
import json
with open('~/.openclaw/openclaw.json') as f:
    cfg = json.load(f)
    g = cfg.get('gateway', {})
    print(f'mode: {g.get(\"mode\")}')
    print(f'bind: {g.get(\"bind\")}')
    t = g.get('auth', {}).get('token', '')
    print(f'Token 长度: {len(t)}')
"
```

**通过标准**：
- ✅ `mode`: "local"
- ✅ `bind`: "loopback" 或 "127.0.0.1"
- ✅ Token 长度 >= 40

### 3. 命令注入防护检查
```bash
python3 -c "
import json
with open('~/.openclaw/openclaw.json') as f:
    cfg = json.load(f)
    deny = cfg.get('gateway', {}).get('nodes', {}).get('denyCommands', [])
    print('禁止的命令列表：')
    for cmd in deny:
        print(f'  ❌ {cmd}')
"
```

**通过标准**：
- ✅ 必须包含：`camera.snap`, `camera.clip`, `screen.record`
- ✅ 必须包含：`contacts.add`, `reminders.add`

### 4. 权限防御检查
```bash
python3 -c "
import sqlite3
conn = sqlite3.connect('/Library/Application Support/com.apple.TCC/TCC.db')
cursor = conn.cursor()

# Full Disk Access（必须是 0 或 None）
cursor.execute('SELECT auth_value FROM access WHERE client=\"/usr/local/bin/node\" AND service=\"kTCCServiceSystemPolicyAllFiles\"')
r = cursor.fetchone()
print(f'Full Disk Access: {\"❌ 已授权 (风险)\" if r and r[0]==2 else \"✅ 未授权 (安全)\"}')

# Accessibility（需要授权才能运行 UI 自动化）
cursor.execute('SELECT auth_value FROM access WHERE client=\"/usr/local/bin/node\" AND service=\"kTCCServiceAccessibility\"')
r = cursor.fetchone()
print(f'Accessibility: {\"✅ 已授权 (正常)\" if r and r[0]==2 else \"❌ 未授权\"}')

conn.close()
"
```

**通过标准**：
- ✅ Full Disk Access: 未授权（auth_value = 0 或 None）
- ✅ Accessibility: 已授权（auth_value = 2）

### 5. 进程运行状态
```bash
ps aux | grep openclaw | grep -v grep
```

**通过标准**：
- ✅ 只有 `openclaw-gateway` 在运行
- ❌ 不应有未知的后台进程

### 6. 后台服务检查
```bash
launchctl list | grep -v "com.apple" | grep -v "^PID"
```

**通过标准**：
- ✅ 无非官方的持久化服务
- ✅ 无可疑的代理脚本

### 7. iCloud 同步状态
```bash
ls -la ~/Documents/ ~/Pictures/ ~/Desktop/
```

**通过标准**：
- ✅ Documents, Pictures, Desktop 为空或只有 .localized

### 8. Workspace 检查
```bash
ls -la ~/.openclaw/workspace/
```

**通过标准**：
- ✅ 不包含个人私密文件
- ⚠️ 警惕符号链接（可能指向敏感目录）

### 9. 网络连接监控
```bash
lsof -p $(pgrep -f openclaw-gateway) -i
```

**通过标准**：
- ✅ 只连接已知的 AI 服务域名（openai, anthropic, google）
- ✅ 只连接已配置的通道服务（feishu, telegram, whatsapp）
- ❌ 无意外的外部 IP 连接

### 10. 日志异常检查
```bash
tail -50 ~/.openclaw/logs/gateway.log
```

**通过标准**：
- ✅ 无大量错误或异常请求
- ⚠️ WhatsApp/Telegram 自动重连是正常行为

## 风险响应预案

| 风险场景 | 应对措施 |
|----------|----------|
| 发现未知 IP 连接 Gateway | 立即重启 Gateway，更换 Token |
| Token 泄露 | 立即生成新 Token，更新配置 |
| 发现可疑进程 | 杀掉进程，检查 launchd 服务 |
| Tailscale 被开启 | 立即关闭，检查配置 |
| FDA 权限被授予 | 立即撤销 |

## 使用方法

在 Claude Code 中输入：
```
/openclaw-security-audit
```

或直接要求：
"请执行 OpenClaw 安全审计"

### 🚀 高级功能

#### ⚡ 快速检查
```bash
./scripts/quick-check.sh
```
仅检查 5 个最关键的安全项（网络暴露、Token、命令防护、FDA权限、防火墙）

#### 🔒 紝统安全检查
```bash
./scripts/system-security-check.sh --all
./scripts/system-security-check.sh --firewall --filevault
./scripts/system-security-check.sh --sip
./scripts/system-security-check.sh --gatekeeper
./scripts/system-security-check.sh --secure-boot
```
检查 macOS 系统级安全（防火墙、FileVault、SIP、 Gatekeeper, 安全启动）

#### 📊 匆史追踪
```bash
./scripts/history-tracker.sh save    # 保存审计结果
./scripts/history-tracker.sh show     # 查看历史记录
./scripts/history-tracker.sh trends   # 查看安全趋势
./scripts/history-tracker.sh compare <file1> <file2>  # 对比两次审计
```

#### 🔧 交互式修复
```bash
./scripts/interactive-fix.sh
```
交互式菜单，逐项确认后再执行修复

#### 🤖 自动修复
```bash
./scripts/fix-exposed-gateway.sh --bind     # 修复 Gateway 暴露
./scripts/fix-exposed-gateway.sh --token   # 生成新 Token
./scripts/fix-exposed-gateway.sh --deny    # 添加危险命令到 deny 列表
./scripts/fix-exposed-gateway.sh --restart # 重启 Gateway
./scripts/fix-exposed-gateway.sh --all      # 一键全部修复
```

#### 🌐 IP 泄露检查
```bash
./scripts/ip-leak-check.sh --all
./scripts/ip-leak-check.sh --ip 1.2.3.4
./scripts/ip-leak-check.sh --ports
```
检查您的 IP 是否在 [openclaw.allegro.earth](https://openclaw.allegro.earth) 暴露数据库中

#### 📋 报告生成
```bash
./scripts/generate-report.sh --format html --output ./reports
./scripts/generate-report.sh --format json --output ./reports
```
生成 HTML/JSON 格式的审计报告

### 🔄 CI/CD 支持
- GitHub Actions 自动测试: `.github/workflows/security-audit.yml`
- 定时运行: 每天 2:00 AM UTC
- 自动生成报告

### 📚 文档
- 中文文档: `README.md`
- 英文文档: `README.en.md`