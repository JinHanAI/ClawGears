# ClawGears Security Audit Skill

[![License](https://img.shields.io/badge/license-GPL%203.0-blue)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey?logo=apple)](https://github.com/JinHanAI/ClawGears)

OpenClaw Security Audit Skill - Protect your Mac, guard your privacy.

## Installation

```bash
clawhub install clawgears
```

## Quick Start

After installation, ask your OpenClaw agent:

- "帮我检查一下 OpenClaw 的安全性"
- "Check if my OpenClaw is exposed"
- "Run a security audit"

## Features

- 🔒 Gateway exposure detection
- 🔑 Token strength validation
- 📷 Sensitive command blocking check
- 💾 TCC permission audit
- 🌐 IP leak detection (allegro.earth, Censys, Shodan)
- 🔧 Auto-fix capabilities

## Scripts Included

| Script | Purpose |
|--------|---------|
| `quick-check.sh` | 5-second security check |
| `ip-leak-check.sh` | IP exposure detection |
| `interactive-fix.sh` | Auto-fix security issues |
| `generate-report.sh` | Generate audit reports |

## Full Repository

For the complete CLI tool with TUI menu:

```bash
git clone https://github.com/JinHanAI/ClawGears.git
cd ClawGears
./clawgears.sh
```

## License

MIT-0 (ClawHub Platform License)

## Author

Victor.Chen ([@JinHanAI](https://github.com/JinHanAI))
