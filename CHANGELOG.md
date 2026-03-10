# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2026-03-11

### Added
- **Enhanced IP Leak Detection**: Now checks 3 databases instead of 1
  - `openclaw.allegro.earth` - OpenClaw specific exposure database
  - `Censys` - Internet-wide scanning database (https://search.censys.io)
  - `Shodan` - IoT and service scanning database (https://www.shodan.io)
- Updated JSON report to include all checked databases with URLs
- Updated TUI menu and all README files to reflect multi-database support

## [1.2.0] - 2026-03-10

### Added
- **Interactive TUI Menu** (`clawgears.sh`)
  - ASCII art banner with "CLAWGEARS" branding
  - 6 menu options for easy navigation
  - Help system and documentation links
- Fixed author attribution to Victor.Chen across all README files

## [1.1.0] - 2026-03-10

### Added
- **Test Suite**: Complete BATS test framework for core scripts
  - `tests/quick-check.bats`: Unit tests for quick security check
  - `tests/generate-report.bats`: Unit tests for report generator
  - `tests/ip-leak-check.bats`: Unit tests for IP leak detection
  - `tests/run-tests.sh`: Test runner script with colored output
- **History Tracking**: Audit reports now saved to `history/` directory
  - HTML and JSON format support
  - IP leak check results preserved
- **CHANGELOG.md**: This changelog file for tracking version changes

### Fixed
- Fixed argument parsing in `generate-report.sh` (shift 2 for options with values)
- Fixed JSON report generation syntax error

### Security
- All security checks validated with test cases
- IP leak detection confirmed working

## [1.0.0] - 2026-03-10

### Added
- **Quick Security Check** (`scripts/quick-check.sh`)
  - Network exposure check (Gateway port binding)
  - Token security validation (length >= 40 chars)
  - Command injection protection check (denyCommands)
  - Full Disk Access audit
  - Firewall status check

- **Report Generator** (`scripts/generate-report.sh`)
  - HTML format report generation
  - JSON format report generation
  - 8 comprehensive security checks
  - Professional styled HTML output

- **IP Leak Detection** (`scripts/ip-leak-check.sh`)
  - Integration with `openclaw.allegro.earth` database
  - Public IP detection (multiple fallback methods)
  - Port exposure scanning (18789, 8080, 3000, 5000)
  - History tracking for leak checks

- **Auto-Fix Features** (`scripts/interactive-fix.sh`)
  - Fix exposed Gateway configuration
  - Generate new security tokens
  - Add denyCommands blacklist
  - Interactive fix workflow

- **Additional Scripts**
  - `scripts/fix-exposed-gateway.sh`: Automated Gateway security fix
  - `scripts/history-tracker.sh`: Audit history management
  - `scripts/privacy-clean.sh`: Privacy cleanup utilities
  - `scripts/system-security-check.sh`: System-level security checks

- **CI/CD Integration**
  - GitHub Actions workflow (`.github/workflows/security-audit.yml`)
  - Scheduled daily audits (2:00 AM UTC)
  - Manual trigger support

- **Documentation**
  - Multi-language README (EN, ZH, DE, FR, IT)
  - Usage examples and feature comparison
  - Security risk explanation

### Security Features
- OpenClaw/MoltBot/ClawdBot focused security checks
- TCC permission auditing
- Network connection monitoring
- Workspace privacy verification
- iCloud sync risk detection

---

## Version History

| Version | Date | Description |
|---------|------|-------------|
| 1.1.0 | 2026-03-10 | Added test suite, history tracking, and bug fixes |
| 1.0.0 | 2026-03-10 | Initial release with core security features |

---

## Upcoming Features

- [ ] Web dashboard for audit history visualization
- [ ] Email/Slack notifications for security alerts
- [ ] Automated remediation suggestions
- [ ] Integration with more security databases
- [ ] Support for Linux platforms
