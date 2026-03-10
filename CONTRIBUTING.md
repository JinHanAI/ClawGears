# Contributing to ClawGears

First off, thank you for considering contributing to ClawGears! It's people like you that make ClawGears such a great tool.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)

---

## Code of Conduct

This project and everyone participating in it is governed by basic principles of respect and inclusivity. By participating, you are expected to uphold this standard. Please be respectful, constructive, and professional in all interactions.

---

## How Can I Contribute?

### 🐛 Reporting Bugs

Before creating bug reports, please check the existing issues. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples** (commands, output, screenshots)
- **Describe the behavior you observed** and what you expected
- **Include your environment details**:
  - macOS version: `sw_vers`
  - Shell version: `bash --version`
  - OpenClaw version (if applicable)

### 💡 Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating one:

- **Use a clear and descriptive title**
- **Provide a step-by-step description** of the suggested enhancement
- **Explain why this enhancement would be useful**
- **List any similar tools** that have this feature

### 🔧 Pull Requests

- Fill in the required template
- Do not include issue numbers in the PR title
- Follow the coding standards
- Include appropriate tests
- Update documentation if needed

---

## Development Setup

### Prerequisites

- macOS (this tool is macOS-specific)
- Bash 3.2+ (default on macOS)
- Python 3.x (for JSON parsing)
- [BATS](https://github.com/bats-core/bats-core) (for running tests)

### Installation

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/ClawGears.git
cd ClawGears

# Install BATS for testing
brew install bats-core

# Run tests to verify setup
./tests/run-tests.sh
```

### Project Structure

```
ClawGears/
├── scripts/           # Core shell scripts
│   ├── quick-check.sh
│   ├── generate-report.sh
│   ├── ip-leak-check.sh
│   └── ...
├── tests/             # BATS test files
│   ├── quick-check.bats
│   ├── generate-report.bats
│   ├── ip-leak-check.bats
│   └── run-tests.sh
├── .github/           # GitHub templates and workflows
├── history/           # Audit history (gitignored)
└── *.md               # Documentation
```

---

## Coding Standards

### Shell Scripts

- Use `#!/bin/bash` shebang
- Enable strict mode: `set -e`
- Use meaningful variable names
- Add comments for complex logic
- Follow the existing code style

### Documentation

- Update README.md for user-facing changes
- Update CHANGELOG.md for all changes
- Use clear, concise language

### Testing

- All new features should include tests
- All bug fixes should include regression tests
- Run the full test suite before submitting PRs

```bash
# Run all tests
./tests/run-tests.sh

# Run specific test
./tests/run-tests.sh quick-check
```

---

## Commit Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>: <description>

[optional body]
```

### Types

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Code style (formatting, etc.) |
| `refactor` | Code refactoring |
| `test` | Adding or updating tests |
| `chore` | Maintenance tasks |

### Examples

```
feat: add iCloud sync check
fix: correct token length validation
docs: update installation instructions
test: add tests for firewall check
```

---

## Pull Request Process

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** following the coding standards
3. **Add/update tests** as needed
4. **Update documentation** (README, CHANGELOG)
5. **Run the test suite** and ensure all tests pass
6. **Submit your pull request**

### PR Checklist

- [ ] Code follows the project's coding standards
- [ ] Tests have been added/updated and pass
- [ ] Documentation has been updated
- [ ] CHANGELOG.md has been updated
- [ ] Commit messages follow the guidelines

### Review Process

- PRs require at least one approval
- CI checks must pass
- Changes may be requested before merging

---

## Questions?

Feel free to open an issue for any questions or discussions. We're here to help!

---

Thank you for contributing! 🦞
