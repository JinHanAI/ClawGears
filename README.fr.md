<div align="center">

# 🦞 ClawGears

### **Protégez votre Mac, gardez votre vie privée**

**L'outil d'audit de sécurité pour OpenClaw**

[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey?style=for-the-badge&logo=apple)](https://github.com/JinHanAI/ClawGears)
[![Version](https://img.shields.io/badge/version-1.5.0-green?style=for-the-badge)](https://github.com/JinHanAI/ClawGears)

[English](./README.md) | [中文](./README.zh.md) | [Deutsch](./README.de.md) | **Français** | [Italiano](./README.it.md) | [日本語](./README.ja.md) | [Español](./README.es.md)

</div>

---

## ⚠️ Votre OpenClaw est-il exposé ?

> **Les statistiques montrent : plus de 220 000 instances OpenClaw sont exposées publiquement. De nombreuses clés API ont déjà fui dans les bases de données de pirates.**

### Si vous remarquez ces signes, votre vie privée pourrait être en danger :

| 🚨 Risque | 💥 Conséquence | ⚡ Gravité |
|:----------|:---------------|:----------:|
| **Gateway exposé au public** | N'importe qui peut accéder à votre assistant IA | 🔴 Critique |
| **Token faible ou fui** | Clés API volées, frais inattendus | 🟠 Grave |
| **Caméra/écran accessible** | Vie privée compromise, captures d'écran | 🟠 Grave |
| **Full Disk Access accordé** | Tous les fichiers accessibles par l'IA | 🟡 Risque élevé |
| **IP dans une base de fuites** | Déjà ciblé par des pirates | 🟡 Risque élevé |

---

## 🎯 Que peut faire ClawGears pour vous ?

### ✅ Vérification rapide en 5 secondes

```bash
./scripts/quick-check.sh
```

**Une commande vérifie 5 éléments de sécurité critiques :**
- 🔒 Le Gateway est-il exposé au réseau public
- 🔑 La force du token est-elle suffisante
- 📷 Les commandes sensibles sont-elles bloquées
- 💾 Les permissions TCC sont-elles raisonnables
- 🌐 Votre IP a-t-elle déjà fui

### ✅ Correction automatique des problèmes

```bash
./scripts/interactive-fix.sh
```

**Correction en un clic des problèmes courants :**
- Relier le Gateway à localhost
- Générer un nouveau token fort
- Ajouter les commandes sensibles à la liste noire

### ✅ Détection de fuite IP

```bash
./scripts/ip-leak-check.sh --all
```

**Fonction exclusive :** Intégré aux bases de données `openclaw.allegro.earth`, Censys et Shodan pour vérifier si votre IP a fui

---

## 💡 Pourquoi choisir ClawGears ?

### 🏆 Avantages clés

| Avantage | Description |
|:---------|:------------|
| 🎯 **Focalisé sur OpenClaw** | Conçu spécifiquement pour OpenClaw, vérifications plus approfondies et précises |
| 🔒 **Vie privée d'abord** | Pas seulement la sécurité système, mais les risques de fuite de vie privée |
| 🌐 **Détection de fuite IP** | **Le seul** outil intégré à une base de données de fuites |
| 🔧 **Correction en un clic** | Correction automatique, aucune intervention manuelle nécessaire |
| 📊 **Suivi historique** | Enregistrer chaque résultat d'audit, suivre les tendances de sécurité |
| 🤖 **Prêt CI/CD** | Automatisation GitHub Actions incluse |

### 🆚 Comparaison avec les alternatives

| Fonctionnalité | <img src="https://img.shields.io/badge/ClawGears-🦞-red?style=flat-square" /> | Outils de sécurité génériques |
|:---------------|:-----------------------:|:-----------------------------:|
| Vérification approfondie OpenClaw | ✅ | ❌ |
| Détection de fuite IP | ✅ | ❌ |
| Audit des permissions TCC | ✅ | ❌ |
| Vérification sync iCloud | ✅ | ❌ |
| Auto-correction | ✅ | ❌ |
| Correction interactive | ✅ | ❌ |
| Suivi historique | ✅ | ❌ |
| Génération de rapports | ✅ | Partiel |

---

## 📈 Ce que vous obtiendrez

<table>
<tr>
<td width="50%" valign="top">

### 🛡️ Assurance sécurité

- ✅ **Sécurité Gateway** - Liaison localhost uniquement
- ✅ **Sécurité Token** - Protection par clé forte
- ✅ **Contrôle des permissions** - Bloquer l'accès non autorisé FDA
- ✅ **Protection des commandes** - Bloquer caméra, opérations écran

</td>
<td width="50%" valign="top">

### 🔍 Découverte des risques

- ✅ **Détection de fuite IP** - Vérifier dans les bases de pirates
- ✅ **Exposition de ports** - Trouver les ports accidentellement exposés
- ✅ **Connexions suspectes** - Détecter l'activité réseau inhabituelle

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 📊 Surveillance continue

- ✅ **Suivi historique** - Enregistrer chaque résultat d'audit
- ✅ **Analyse des tendances** - Comprendre les changements de posture de sécurité
- ✅ **Automatisation** - Vérifications planifiées CI/CD

</td>
<td width="50%" valign="top">

### ⏱️ Gain de temps

- ✅ **Vérification rapide** - 5 secondes pour les éléments critiques
- ✅ **Correction en un clic** - Corriger automatiquement les problèmes courants
- ✅ **Génération de rapports** - Rapports professionnels en un clic

</td>
</tr>
</table>

---

## 🚀 Démarrage rapide

### 📋 À qui est-ce destiné ?

| ✅ Parfait pour vous | ❌ Pas pour vous |
|:---------------------|:-----------------|
| Exécutez OpenClaw / MoltBot / ClawdBot sur **Mac** | N'utilisez pas OpenClaw ou assistants IA similaires |
| Préoccupé par la **sécurité de l'assistant IA** | OpenClaw fonctionne dans un environnement **complètement isolé** |
| OpenClaw **se connecte à des services externes** (Feishu, Telegram) | Avez déjà une équipe de sécurité professionnelle |
| Votre Mac stocke des **données sensibles** (fichiers de travail, photos personnelles) | |
| Souhaitez des **vérifications de sécurité régulières** | |

### ⚡ Vérification rapide en 1 minute

```bash
# Cloner le dépôt
git clone https://github.com/JinHanAI/ClawGears.git
cd clawgears

# Vérification rapide (5 éléments critiques)
./scripts/quick-check.sh
```

### 🔍 Vérifier la fuite IP

```bash
./scripts/ip-leak-check.sh --all
```

### 📊 Rapport d'audit complet

```bash
./scripts/generate-report.sh --format html --output ./reports
```

### 🔧 Problèmes trouvés ? Correction en un clic

```bash
./scripts/interactive-fix.sh
```

---

## 📋 Liste des fonctionnalités

### 🔐 Vérifications de sécurité

| Vérification | Description |
|:-------------|:------------|
| Exposition réseau | Liaison de port Gateway, statut Tailscale |
| Sécurité Token | Longueur, validation de configuration |
| Protection injection de commande | Configuration denyCommands |
| Audit des permissions TCC | Full Disk Access, Accessibilité |
| Surveillance des processus | Services d'arrière-plan, processus inconnus |
| Vérification sync iCloud | Documents/Photos/Bureau |
| Vie privée Workspace | Fichiers sensibles, liens symboliques |
| Surveillance des connexions réseau | Liste blanche de domaines externes |
| Audit des logs | Détection d'anomalies |
| Sécurité système | Pare-feu, FileVault, SIP |

### 🔧 Fonctionnalités de correction

| Fonctionnalité | Commande |
|:---------------|:---------|
| Corriger l'exposition Gateway | `--bind` |
| Générer un nouveau Token | `--token` |
| Ajouter des commandes deny | `--deny` |
| Redémarrer le Gateway | `--restart` |
| Tout corriger | `--all` |

---

## 📚 Documentation

[English](./README.md) | [中文](./README.zh.md) | [Deutsch](./README.de.md) | **Français** | [Italiano](./README.it.md) | [日本語](./README.ja.md) | [Español](./README.es.md)

---

## 🤝 Contribuer

Les contributions sont les bienvenues ! Veuillez soumettre des Pull Requests ou des Issues.

---

## 📄 Licence

Licence MIT - Voir [LICENSE](./LICENSE)

---

## ⚠️ Avertissement

Cet outil est uniquement destiné à des fins d'audit de sécurité. Veuillez comprendre les implications avant d'utiliser les fonctionnalités de correction automatique.

---

<div align="center">

**🦞 ClawGears**

*Protégez votre Mac, gardez votre vie privée*

Made with ❤️ by [Victor.Chen(https://github.com/JinHanAI)

</div>
