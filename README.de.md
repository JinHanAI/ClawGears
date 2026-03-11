<div align="center">

# 🦞 ClawGears

### **Schützen Sie Ihren Mac, bewahren Sie Ihre Privatsphäre**

**Das Sicherheits-Audit-Tool für OpenClaw**

[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey?style=for-the-badge&logo=apple)](https://github.com/JinHanAI/ClawGears)
[![Version](https://img.shields.io/badge/version-1.5.0-green?style=for-the-badge)](https://github.com/JinHanAI/ClawGears)

[English](./README.md) | [中文](./README.zh.md) | **Deutsch** | [Français](./README.fr.md) | [Italiano](./README.it.md) | [日本語](./README.ja.md) | [Español](./README.es.md)

</div>

---

## ⚠️ Ist Ihr OpenClaw gefährdet?

> **Statistiken zeigen: Über 220.000 OpenClaw-Instanzen sind öffentlich exponiert. Viele API-Schlüssel wurden bereits in Hacker-Datenbanken geleakt.**

### Wenn Sie diese Anzeichen bemerken, ist Ihre Privatsphäre möglicherweise gefährdet:

| 🚨 Risiko | 💥 Konsequenz | ⚡ Schwere |
|:----------|:--------------|:----------:|
| **Gateway öffentlich exponiert** | Jeder kann auf Ihren KI-Assistenten zugreifen | 🔴 Kritisch |
| **Schwacher oder geleakter Token** | API-Schlüssel gestohlen, unerwartete Kosten | 🟠 Schwerwiegend |
| **Kamera/Bildschirm zugänglich** | Privatsphäre kompromittiert, Screenshots gemacht | 🟠 Schwerwiegend |
| **Full Disk Access gewährt** | Alle Dateien durch KI zugänglich | 🟡 Hohes Risiko |
| **IP in Leck-Datenbank** | Bereits von Hackern ins Visier genommen | 🟡 Hohes Risiko |

---

## 🎯 Was kann ClawGears für Sie tun?

### ✅ 5-Sekunden-Schnellprüfung

```bash
./scripts/quick-check.sh
```

**Ein Befehl prüft 5 kritische Sicherheitselemente:**
- 🔒 Ist das Gateway öffentlich exponiert
- 🔑 Ist die Token-Stärke ausreichend
- 📷 Sind sensible Befehle blockiert
- 💾 Sind die TCC-Berechtigungen angemessen
- 🌐 Ist Ihre IP bereits geleakt

### ✅ Probleme automatisch beheben

```bash
./scripts/interactive-fix.sh
```

**Ein-Klick-Behebung häufiger Probleme:**
- Gateway an localhost neu binden
- Neuen starken Token generieren
- Sensible Befehle zur Blacklist hinzufügen

### ✅ IP-Leck-Erkennung

```bash
./scripts/ip-leak-check.sh --all
```

**Exklusives Feature:** Integriert mit `openclaw.allegro.earth`, Censys und Shodan Datenbanken zur Prüfung, ob Ihre IP geleakt wurde

---

## 💡 Warum ClawGears wählen?

### 🏆 Hauptvorteile

| Vorteil | Beschreibung |
|:--------|:-------------|
| 🎯 **OpenClaw-fokussiert** | Speziell für OpenClaw entwickelt, tiefere und präzisere Prüfungen |
| 🔒 **Privatsphäre zuerst** | Nicht nur Systemsicherheit, sondern Privatsphäre-Risiken |
| 🌐 **IP-Leck-Erkennung** | **Das einzige** Tool mit Leck-Datenbank-Integration |
| 🔧 **Ein-Klick-Fix** | Automatische Problemlösung, kein manuelles Eingreifen nötig |
| 📊 **Verlauf-Tracking** | Jedes Audit-Ergebnis aufzeichnen, Sicherheitstrends verfolgen |
| 🤖 **CI/CD-bereit** | GitHub Actions Automatisierung inklusive |

### 🆚 Vergleich mit Alternativen

| Funktion | <img src="https://img.shields.io/badge/ClawGears-🦞-red?style=flat-square" /> | Generische Sicherheits-Tools |
|:---------|:-----------------------:|:----------------------------:|
| OpenClaw-Tiefenprüfung | ✅ | ❌ |
| IP-Leck-Erkennung | ✅ | ❌ |
| TCC-Berechtigungs-Audit | ✅ | ❌ |
| iCloud-Sync-Prüfung | ✅ | ❌ |
| Auto-Fix | ✅ | ❌ |
| Interaktive Reparatur | ✅ | ❌ |
| Verlauf-Tracking | ✅ | ❌ |
| Bericht-Generierung | ✅ | Teilweise |

---

## 📈 Was Sie erhalten

<table>
<tr>
<td width="50%" valign="top">

### 🛡️ Sicherheitssicherung

- ✅ **Gateway-Sicherheit** - Nur an Localhost gebunden
- ✅ **Token-Sicherheit** - Starke Schlüssel protection
- ✅ **Berechtigungskontrolle** - FDA unbefugten Zugriff blockieren
- ✅ **Befehlsschutz** - Kamera-, Bildschirm-Operationen blockieren

</td>
<td width="50%" valign="top">

### 🔍 Risikoerkennung

- ✅ **IP-Leck-Erkennung** - Prüfung in Hacker-Datenbanken
- ✅ **Port-Exposition** - Versehentlich exponierte Ports finden
- ✅ **Verdächtige Verbindungen** - Ungewöhnliche Netzwerkaktivität erkennen

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 📊 Kontinuierliche Überwachung

- ✅ **Verlauf-Tracking** - Jedes Audit-Ergebnis aufzeichnen
- ✅ **Trend-Analyse** - Sicherheitsstatus-Änderungen verstehen
- ✅ **Automatisierung** - CI/CD-geplante Prüfungen

</td>
<td width="50%" valign="top">

### ⏱️ Zeiteinsparung

- ✅ **Schnellprüfung** - 5 Sekunden für kritische Elemente
- ✅ **Ein-Klick-Fix** - Häufige Probleme automatisch beheben
- ✅ **Bericht-Generierung** - Professionelle Berichte mit einem Klick

</td>
</tr>
</table>

---

## 🚀 Schnellstart

### 📋 Wer sollte dies verwenden?

| ✅ Perfekt für Sie | ❌ Nicht für Sie |
|:-------------------|:-----------------|
| OpenClaw / MoltBot / ClawdBot auf **Mac** ausführen | OpenClaw oder ähnliche KI-Assistenten nicht verwenden |
| Besorgt über **KI-Assistenten-Sicherheit** | OpenClaw läuft in **vollständig isolierter** Umgebung |
| OpenClaw **verbindet sich mit externen Diensten** (Feishu, Telegram) | Bereits ein professionelles Sicherheitsteam |
| Mac speichert **sensible Daten** (Arbeitsdateien, persönliche Fotos) | |
| **Regelmäßige Sicherheitsprüfungen** wünschen | |

### ⚡ 1-Minuten-Schnellprüfung

```bash
# Repository klonen
git clone https://github.com/JinHanAI/ClawGears.git
cd clawgears

# Schnellprüfung (5 kritische Elemente)
./scripts/quick-check.sh
```

### 🔍 IP-Leck prüfen

```bash
./scripts/ip-leak-check.sh --all
```

### 📊 Vollständiger Audit-Bericht

```bash
./scripts/generate-report.sh --format html --output ./reports
```

### 🔧 Probleme gefunden? Ein-Klick-Fix

```bash
./scripts/interactive-fix.sh
```

---

## 📋 Funktionsliste

### 🔐 Sicherheitsprüfungen

| Prüfung | Beschreibung |
|:--------|:-------------|
| Netzwerk-Exposition | Gateway-Port-Bindung, Tailscale-Status |
| Token-Sicherheit | Länge, Konfigurationsvalidierung |
| Befehlsinjektion-Schutz | denyCommands-Konfiguration |
| TCC-Berechtigungs-Audit | Full Disk Access, Bedienungshilfen |
| Prozessüberwachung | Hintergrunddienste, unbekannte Prozesse |
| iCloud-Sync-Prüfung | Dokumente/Bilder/Desktop |
| Workspace-Privatsphäre | Sensible Dateien, Symlinks |
| Netzwerkverbindungsüberwachung | Externe Domain-Whitelist |
| Log-Audit | Anomalieerkennung |
| Systemsicherheit | Firewall, FileVault, SIP |

### 🔧 Reparaturfunktionen

| Funktion | Befehl |
|:---------|:-------|
| Gateway-Exposition beheben | `--bind` |
| Neuen Token generieren | `--token` |
| Deny-Befehle hinzufügen | `--deny` |
| Gateway neu starten | `--restart` |
| Alles beheben | `--all` |

---

## 📚 Dokumentation

[English](./README.md) | [中文](./README.zh.md) | **Deutsch** | [Français](./README.fr.md) | [Italiano](./README.it.md) | [日本語](./README.ja.md) | [Español](./README.es.md)

---

## 🤝 Mitwirken

Beiträge willkommen! Bitte reichen Sie Pull Requests oder Issues ein.

---

## 📄 Lizenz

MIT-Lizenz - Siehe [LICENSE](./LICENSE)

---

## ⚠️ Haftungsausschluss

Dieses Tool dient nur Sicherheits-Audit-Zwecken. Bitte verstehen Sie die Auswirkungen, bevor Sie Auto-Fix-Funktionen verwenden.

---

<div align="center">

**🦞 ClawGears**

*Schützen Sie Ihren Mac, bewahren Sie Ihre Privatsphäre*

Made with ❤️ by [Victor.Chen(https://github.com/JinHanAI)

</div>
