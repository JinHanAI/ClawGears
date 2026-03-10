<div align="center">

# 🦞 ClawGears

### **Proteggi il tuo Mac, custodisci la tua privacy**

**Lo strumento di audit di sicurezza per OpenClaw**

[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey?style=for-the-badge&logo=apple)](https://github.com/JinHanAI/ClawGears)
[![Version](https://img.shields.io/badge/version-1.1.0-green?style=for-the-badge)](https://github.com/JinHanAI/ClawGears)

[English](./README.md) | [中文](./README.zh.md) | [Deutsch](./README.de.md) | [Français](./README.fr.md) | **Italiano**

</div>

---

## ⚠️ Il tuo OpenClaw è esposto?

> **Le statistiche mostrano: oltre 220.000 istanze OpenClaw sono esposte pubblicamente. Molte chiavi API sono già trapelate nei database degli hacker.**

### Se noti questi segnali, la tua privacy potrebbe essere a rischio:

| 🚨 Rischio | 💥 Conseguenza | ⚡ Gravità |
|:-----------|:---------------|:----------:|
| **Gateway esposto al pubblico** | Chiunque può accedere al tuo assistente IA | 🔴 Critico |
| **Token debole o trapelato** | Chiavi API rubate, costi imprevisti | 🟠 Grave |
| **Fotocamera/schermo accessibile** | Privacy compromessa, screenshot effettuati | 🟠 Grave |
| **Full Disk Access concesso** | Tutti i file accessibili dall'IA | 🟡 Alto rischio |
| **IP nel database delle fughe** | Già nel mirino degli hacker | 🟡 Alto rischio |

---

## 🎯 Cosa può fare ClawGears per te?

### ✅ Controllo rapido in 5 secondi

```bash
./scripts/quick-check.sh
```

**Un comando controlla 5 elementi di sicurezza critici:**
- 🔒 Il Gateway è esposto alla rete pubblica
- 🔑 La forza del token è sufficiente
- 📷 I comandi sensibili sono bloccati
- 💾 I permessi TCC sono ragionevoli
- 🌐 Il tuo IP è già trapelato

### ✅ Correzione automatica dei problemi

```bash
./scripts/interactive-fix.sh
```

**Correzione con un clic dei problemi comuni:**
- Riassociare il Gateway a localhost
- Generare un nuovo token forte
- Aggiungere i comandi sensibili alla blacklist

### ✅ Rilevamento fughe IP

```bash
./scripts/ip-leak-check.sh --all
```

**Funzione esclusiva:** Integrato con il database `openclaw.allegro.earth` per verificare se il tuo IP è trapelato

---

## 💡 Perché scegliere ClawGears?

### 🏆 Vantaggi principali

| Vantaggio | Descrizione |
|:----------|:------------|
| 🎯 **Focalizzato su OpenClaw** | Progettato specificamente per OpenClaw, controlli più approfonditi e precisi |
| 🔒 **Privacy prima di tutto** | Non solo sicurezza di sistema, ma rischi di fughe di privacy |
| 🌐 **Rilevamento fughe IP** | **L'unico** strumento integrato con database di fughe |
| 🔧 **Correzione con un clic** | Correzione automatica, nessun intervento manuale necessario |
| 📊 **Tracciamento cronologico** | Registrare ogni risultato di audit, seguire i trend di sicurezza |
| 🤖 **Pronto per CI/CD** | Automazione GitHub Actions inclusa |

### 🆚 Confronto con le alternative

| Funzionalità | <img src="https://img.shields.io/badge/ClawGears-🦞-red?style=flat-square" /> | Strumenti di sicurezza generici |
|:-------------|:-----------------------:|:-------------------------------:|
| Controllo approfondito OpenClaw | ✅ | ❌ |
| Rilevamento fughe IP | ✅ | ❌ |
| Audit permessi TCC | ✅ | ❌ |
| Controllo sync iCloud | ✅ | ❌ |
| Auto-correzione | ✅ | ❌ |
| Correzione interattiva | ✅ | ❌ |
| Tracciamento cronologico | ✅ | ❌ |
| Generazione report | ✅ | Parziale |

---

## 📈 Cosa otterrai

<table>
<tr>
<td width="50%" valign="top">

### 🛡️ Garanzia di sicurezza

- ✅ **Sicurezza Gateway** - Solo associazione localhost
- ✅ **Sicurezza Token** - Protezione con chiave forte
- ✅ **Controllo permessi** - Bloccare accesso non autorizzato FDA
- ✅ **Protezione comandi** - Bloccare fotocamera, operazioni schermo

</td>
<td width="50%" valign="top">

### 🔍 Scoperta dei rischi

- ✅ **Rilevamento fughe IP** - Verificare nei database degli hacker
- ✅ **Esposizione porte** - Trovare porte accidentalmente esposte
- ✅ **Connessioni sospette** - Rilevare attività di rete insolita

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 📊 Monitoraggio continuo

- ✅ **Tracciamento cronologico** - Registrare ogni risultato di audit
- ✅ **Analisi trend** - Comprendere i cambiamenti della postura di sicurezza
- ✅ **Automazione** - Controlli pianificati CI/CD

</td>
<td width="50%" valign="top">

### ⏱️ Risparmio di tempo

- ✅ **Controllo rapido** - 5 secondi per gli elementi critici
- ✅ **Correzione con un clic** - Correggere automaticamente i problemi comuni
- ✅ **Generazione report** - Report professionali con un clic

</td>
</tr>
</table>

---

## 🚀 Avvio rapido

### 📋 A chi è destinato?

| ✅ Perfetto per te | ❌ Non per te |
|:-------------------|:--------------|
| Esegui OpenClaw / MoltBot / ClawdBot su **Mac** | Non usi OpenClaw o assistenti IA simili |
| Preoccupato per la **sicurezza dell'assistente IA** | OpenClaw gira in un ambiente **completamente isolato** |
| OpenClaw **si connette a servizi esterni** (Feishu, Telegram) | Hai già un team di sicurezza professionale |
| Il tuo Mac memorizza **dati sensibili** (file di lavoro, foto personali) | |
| Desideri **controlli di sicurezza regolari** | |

### ⚡ Controllo rapido in 1 minuto

```bash
# Clona il repository
git clone https://github.com/JinHanAI/ClawGears.git
cd clawgears

# Controllo rapido (5 elementi critici)
./scripts/quick-check.sh
```

### 🔍 Verifica fuga IP

```bash
./scripts/ip-leak-check.sh --all
```

### 📊 Report di audit completo

```bash
./scripts/generate-report.sh --format html --output ./reports
```

### 🔧 Problemi trovati? Correzione con un clic

```bash
./scripts/interactive-fix.sh
```

---

## 📋 Elenco delle funzionalità

### 🔐 Controlli di sicurezza

| Controllo | Descrizione |
|:----------|:------------|
| Esposizione di rete | Associazione porta Gateway, stato Tailscale |
| Sicurezza Token | Lunghezza, validazione configurazione |
| Protezione da iniezione comandi | Configurazione denyCommands |
| Audit permessi TCC | Full Disk Access, Accessibilità |
| Monitoraggio processi | Servizi in background, processi sconosciuti |
| Controllo sync iCloud | Documenti/Immagini/Desktop |
| Privacy Workspace | File sensibili, link simbolici |
| Monitoraggio connessioni di rete | Whitelist domini esterni |
| Audit log | Rilevamento anomalie |
| Sicurezza di sistema | Firewall, FileVault, SIP |

### 🔧 Funzionalità di correzione

| Funzionalità | Comando |
|:-------------|:--------|
| Correggi esposizione Gateway | `--bind` |
| Genera nuovo Token | `--token` |
| Aggiungi comandi deny | `--deny` |
| Riavvia Gateway | `--restart` |
| Correggi tutto | `--all` |

---

## 📚 Documentazione

[English](./README.md) | [中文](./README.zh.md) | [Deutsch](./README.de.md) | [Français](./README.fr.md) | **Italiano**

---

## 🤝 Contribuire

I contributi sono benvenuti! Si prega di inviare Pull Request o Issue.

---

## 📄 Licenza

Licenza MIT - Vedi [LICENSE](./LICENSE)

---

## ⚠️ Disclaimer

Questo strumento è solo a scopo di audit di sicurezza. Si prega di comprendere le implicazioni prima di utilizzare le funzionalità di auto-correzione.

---

<div align="center">

**🦞 ClawGears**

*Proteggi il tuo Mac, custodisci la tua privacy*

Made with ❤️ by [Victor.Ch](https://github.com/JinHanAI)

</div>
