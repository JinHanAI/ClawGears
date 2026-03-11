<div align="center">

# 🦞 ClawGears

### **Macを保護し、プライバシーを守る**

**OpenClawセキュリティ監査ツール**

[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey?style=for-the-badge&logo=apple)](https://github.com/JinHanAI/ClawGears)
[![Version](https://img.shields.io/badge/version-1.5.0-green?style=for-the-badge)](https://github.com/JinHanAI/ClawGears)

[English](./README.md) | [中文](./README.zh.md) | [Deutsch](./README.de.md) | [Français](./README.fr.md) | [Italiano](./README.it.md) | **日本語**

</div>

---

## ⚠️ あなたのOpenClawは公開されていますか？

> **統計：220,000以上のOpenClawインスタンスが公開されています。多くのAPIキーがすでにハッカーデータベースに漏洩しています。**

### これらの兆候がある場合、プライバシーが危険にさらされている可能性があります：

| 🚨 リスク | 💥 結果 | ⚡ 深刻度 |
|:--------|:---------------|:-----------:|
| **Gatewayが公開されている** | 誰でもAIアシスタントにアクセス可能 | 🔴 致命的 |
| **トークンが弱い・漏洩している** | APIキーが盗難、予期せぬ課金 | 🟠 重大 |
| **カメラ/画面にアクセス可能** | プライバシー侵害、スクリーンショット撮影 | 🟠 重大 |
| **フルディスクアクセスが付与されている** | AIがすべてのファイルにアクセス可能 | 🟡 高リスク |
| **IPが漏洩データベースにある** | すでにハッカーの標的 | 🟡 高リスク |

---

## 🎯 ClawGearsで何ができる？

### ✅ 5秒クイックチェック

```bash
./scripts/quick-check.sh
```

**1つのコマンドで5つの重要セキュリティ項目をチェック：**
- 🔒 Gatewayが公開ネットワークに公開されているか
- 🔑 トークン強度は十分か
- 📷 センシティブコマンドはブロックされているか
- 💾 TCC権限は適切か
- 🌐 IPはすでに漏洩しているか

### ✅ 自動修正

```bash
./scripts/interactive-fix.sh
```

**ワンクリックでよくある問題を修正：**
- Gatewayをlocalhostに再バインド
- 新しい強力なトークンを生成
- センシティブコマンドブラックリストを追加

### ✅ IP漏洩検出

```bash
./scripts/ip-leak-check.sh --all
```

**独自機能：** `openclaw.allegro.earth`、Censys、Shodanデータベースと統合し、IPが漏洩しているかチェック

---

## 💡 なぜClawGearsを選ぶ？

### 🏆 主な利点

| 利点 | 説明 |
|:----------|:------------|
| 🎯 **OpenClaw特化** | OpenClaw専用に設計、より深く正確なチェック |
| 🔒 **プライバシーファースト** | システムセキュリティだけでなく、プライバシー漏洩リスク |
| 🌐 **IP漏洩検出** | **唯一の**漏洩データベース統合ツール |
| 🔧 **ワンクリック修正** | 自動修正、手動介入不要 |
| 📊 **履歴追跡** | 各監査結果を記録、セキュリティ傾向を追跡 |
| 🤖 **CI/CD対応** | GitHub Actions自動化を含む |

---

## 🚀 クイックスタート

### 🤖 AIエージェントで使用（最も簡単）

**最も簡単な方法：AIアシスタントに聞くだけ！**

#### 方法1：Claude Code

```
OpenClawのセキュリティをチェックして
```

Claude Codeが自動的に：
1. ClawGearsリポジトリをクローン
2. セキュリティ監査を実行
3. 結果をわかりやすく説明
4. 問題の修正を提案

#### 方法2：OpenClaw + ClawHub

```bash
# ClawGearsスキルをインストール
clawhub install clawgears-securityaudit
```

OpenClawに聞く：
```
完全なセキュリティ監査をして
```

### 🎮 インタラクティブメニュー（推奨）

```bash
# リポジトリをクローン
git clone https://github.com/JinHanAI/ClawGears.git
cd ClawGears

# インタラクティブメニューを起動
./clawgears.sh
```

---

## 📋 機能一覧

### 🔐 セキュリティチェック

| チェック | 説明 |
|:------|:------------|
| ネットワーク公開 | Gatewayポートバインド、Tailscaleステータス |
| トークンセキュリティ | 長さ、設定検証 |
| コマンドインジェクション保護 | denyCommands設定 |
| TCC権限監査 | フルディスクアクセス、アクセシビリティ |
| プロセス監視 | バックグラウンドサービス、不明なプロセス |
| iCloud同期チェック | ドキュメント/ピクチャ/デスクトップ |
| ワークスペースプライバシー | センシティブファイル、シンボリックリンク |
| ネットワーク接続監視 | 外部ドメインホワイトリスト |
| ログ監査 | 異常検出 |
| システムセキュリティ | ファイアウォール、FileVault、SIP |

### 🔧 修正機能

| 機能 | コマンド |
|:--------|:--------|
| Gateway公開を修正 | `--bind` |
| 新しいトークンを生成 | `--token` |
| denyコマンドを追加 | `--deny` |
| Gatewayを再起動 | `--restart` |
| すべて修正 | `--all` |

---

## 📚 ドキュメント

[English](./README.md) | [中文](./README.zh.md) | [Deutsch](./README.de.md) | [Français](./README.fr.md) | [Italiano](./README.it.md) | **日本語**

---

## 🤝 貢献

貢献を歓迎します！Pull RequestやIssueをお送しください。

---

## 📄 ライセンス

MITライセンス - [LICENSE](./LICENSE)を参照

---

## ⚠️ 免責事項

このツールはセキュリティ監査目的のみです。自動修正機能を使用する前に、その影響を理解してください。

---

<div align="center">

**🦞 ClawGears**

*Macを保護し、プライバシーを守る*

Made with ❤️ by [Victor.Chen](https://github.com/JinHanAI)

</div>
