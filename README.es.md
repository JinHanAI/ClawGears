<div align="center">

# 🦞 ClawGears

### **Protege tu Mac, resguarda tu privacidad**

**Herramienta de auditoría de seguridad para OpenClaw**

[![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey?style=for-the-badge&logo=apple)](https://github.com/JinHanAI/ClawGears)
[![Version](https://img.shields.io/badge/version-1.5.0-green?style=for-the-badge)](https://github.com/JinHanAI/ClawGears)

[English](./README.md) | [中文](./README.zh.md) | [Deutsch](./README.de.md) | [Français](./README.fr.md) | [Italiano](./README.it.md) | **Español**

</div>

---

## ⚠️ ¿Tu OpenClaw está expuesto?

> **Las estadísticas muestran: más de 220,000 instancias de OpenClaw están expuestas públicamente. Muchas claves API ya se han filtrado en bases de datos de hackers.**

### Si notas estas señales, tu privacidad puede estar en riesgo:

| 🚨 Riesgo | 💥 Consecuencia | ⚡ Gravedad |
|:--------|:---------------|:-----------:|
| **Gateway expuesto al público** | Cualquiera puede acceder a tu asistente de IA | 🔴 Crítico |
| **Token débil o filtrado** | Claves API robadas, cargos inesperados | 🟠 Grave |
| **Cámara/pantalla accesible** | Privacidad comprometida, capturas de pantalla tomadas | 🟠 Grave |
| **Acceso completo al disco otorgado** | Todos los archivos accesibles por la IA | 🟡 Alto riesgo |
| **IP en base de datos de filtraciones** | Ya objetivo de hackers | 🟡 Alto riesgo |

---

## 🎯 ¿Qué puede hacer ClawGears por ti?

### ✅ Verificación rápida en 5 segundos

```bash
./scripts/quick-check.sh
```

**Un comando verifica 5 elementos críticos de seguridad:**
- 🔒 ¿Está el Gateway expuesto a la red pública?
- 🔑 ¿Es la fortaleza del token suficiente?
- 📷 ¿Están los comandos sensibles bloqueados?
- 💾 ¿Son los permisos TCC razonables?
- 🌐 ¿Tu IP ya se ha filtrado?

### ✅ Corrección automática de problemas

```bash
./scripts/interactive-fix.sh
```

**Corrección con un clic de problemas comunes:**
- Revincular Gateway a localhost
- Generar nuevo token fuerte
- Agregar lista negra de comandos sensibles

### ✅ Detección de filtración de IP

```bash
./scripts/ip-leak-check.sh --all
```

**Característica exclusiva:** Integrado con la base de datos `openclaw.allegro.earth`, Censys y Shodan para verificar si tu IP se ha filtrado

---

## 💡 ¿Por qué elegir ClawGears?

### 🏆 Ventajas clave

| Ventaja | Descripción |
|:--------|:------------|
| 🎯 **Enfocado en OpenClaw** | Diseñado específicamente para OpenClaw, verificaciones más profundas y precisas |
| 🔒 **Privacidad primero** | No solo seguridad del sistema, sino riesgos de filtración de privacidad |
| 🌐 **Detección de filtración IP** | **La única** herramienta integrada con base de datos de filtraciones |
| 🔧 **Corrección con un clic** | Corrección automática, sin intervención manual |
| 📊 **Seguimiento histórico** | Registrar cada resultado de auditoría, seguir tendencias de seguridad |
| 🤖 **Listo para CI/CD** | Automatización de GitHub Actions incluida |

---

## 📈 Lo que obtendrás

<table>
<tr>
<td width="50%" valign="top">

### 🛡️ Garantía de seguridad

- ✅ **Seguridad del Gateway** - Solo vinculación localhost
- ✅ **Seguridad del Token** - Protección con clave fuerte
- ✅ **Control de permisos** - Bloquear acceso no autorizado FDA
- ✅ **Protección de comandos** - Bloquear cámara, operaciones de pantalla

</td>
<td width="50%" valign="top">

### 🔍 Descubrimiento de riesgos

- ✅ **Detección de filtración IP** - Verificar en bases de datos de hackers
- ✅ **Exposición de puertos** - Encontrar puertos accidentalmente expuestos
- ✅ **Conexiones sospechosas** - Detectar actividad de red inusual

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 📊 Monitoreo continuo

- ✅ **Seguimiento histórico** - Registrar cada resultado de auditoría
- ✅ **Análisis de tendencias** - Entender cambios de postura de seguridad
- ✅ **Automatización** - Verificaciones programadas CI/CD

</td>
<td width="50%" valign="top">

### ⏱️ Ahorro de tiempo

- ✅ **Verificación rápida** - 5 segundos para elementos críticos
- ✅ **Corrección con un clic** - Corregir automáticamente problemas comunes
- ✅ **Generación de informes** - Informes profesionales con un clic

</td>
</tr>
</table>

---

## 🚀 Inicio rápido

### 📋 ¿Quién debería usar esto?

| ✅ Perfecto para ti | ❌ No para ti |
|:-------------------|:---------------|
| Ejecutas OpenClaw / MoltBot / ClawdBot en **Mac** | No usas OpenClaw o asistentes de IA similares |
| Preocupado por la **seguridad del asistente de IA** | OpenClaw se ejecuta en un entorno **completamente aislado** |
| OpenClaw **se conecta a servicios externos** (Feishu, Telegram) | Ya tienes un equipo de seguridad profesional |
| Tu Mac almacena **datos sensibles** (archivos de trabajo, fotos personales) | |
| Deseas **verificaciones de seguridad regulares** | |

### 🎮 Menú interactivo (Recomendado)

```bash
# Clonar el repositorio
git clone https://github.com/JinHanAI/ClawGears.git
cd ClawGears

# Iniciar menú interactivo
./clawgears.sh
```

### ⚡ Verificación rápida en 1 minuto

```bash
# Verificación rápida (5 elementos críticos)
./scripts/quick-check.sh
```

### 🔍 Verificar filtración de IP

```bash
./scripts/ip-leak-check.sh --all
```

### 📊 Informe de auditoría completo

```bash
./scripts/generate-report.sh --format html --output ./reports
```

### 🔧 ¿Problemas encontrados? Corrección con un clic

```bash
./scripts/interactive-fix.sh
```

---

## 📋 Lista de características

### 🔐 Verificaciones de seguridad

| Verificación | Descripción |
|:-------------|:------------|
| Exposición de red | Vinculación de puerto Gateway, estado de Tailscale |
| Seguridad del Token | Longitud, validación de configuración |
| Protección contra inyección de comandos | Configuración denyCommands |
| Auditoría de permisos TCC | Acceso completo al disco, Accesibilidad |
| Monitoreo de procesos | Servicios en segundo plano, procesos desconocidos |
| Verificación de sincronización iCloud | Documentos/Imágenes/Escritorio |
| Privacidad del Workspace | Archivos sensibles, enlaces simbólicos |
| Monitoreo de conexiones de red | Lista blanca de dominios externos |
| Auditoría de logs | Detección de anomalías |
| Seguridad del sistema | Firewall, FileVault, SIP |

### 🔧 Características de corrección

| Característica | Comando |
|:---------------|:--------|
| Corregir exposición del Gateway | `--bind` |
| Generar nuevo Token | `--token` |
| Agregar comandos deny | `--deny` |
| Reiniciar Gateway | `--restart` |
| Corregir todo | `--all` |

---

## 📚 Documentación

[English](./README.md) | [中文](./README.zh.md) | [Deutsch](./README.de.md) | [Français](./README.fr.md) | [Italiano](./README.it.md) | **Español**

---

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Por favor envía Pull Requests o Issues.

---

## 📄 Licencia

Licencia MIT - Ver [LICENSE](./LICENSE)

---

## ⚠️ Descargo de responsabilidad

Esta herramienta es solo para fines de auditoría de seguridad. Por favor entiende las implicaciones antes de usar las características de corrección automática.

---

<div align="center">

**🦞 ClawGears**

*Protege tu Mac, resguarda tu privacidad*

Made with ❤️ by [Victor.Chen](https://github.com/JinHanAI)

</div>
