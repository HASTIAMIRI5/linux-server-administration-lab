# Linux Server Administration Lab

A practical, hands-on training repository for Linux system administration, networking, security, automation, monitoring, and troubleshooting. The lab is designed for students and professionals who want to strengthen their real-world Linux operations skills in a controlled environment.

## Overview

This repository provides a structured set of exercises and reference documentation for managing a Linux server from the ground up. It covers installation, hardening, service configuration, backups, monitoring, and incident response tasks that commonly appear in system administration roles.

## Learning Objectives

- Understand Linux filesystem layout and command-line operations.
- Manage users, groups, permissions, and sudo access.
- Install and configure core services such as SSH and NGINX.
- Harden a server with firewall, logging, and security best practices.
- Automate routine administrative tasks with Bash scripts.
- Back up and restore data safely and consistently.
- Monitor resource health and investigate service issues.
- Maintain accurate documentation and operational records.

## Lab Environment

- Operating System: Ubuntu Server LTS
- Shell: Bash
- Web Server: NGINX
- Firewall: UFW
- Package Manager: apt
- Version Control: Git and GitHub

## Repository Structure

```text
linux-server-administration-lab/
├── README.md
├── LICENSE
├── docs/
│   ├── architecture.md
│   ├── installation.md
│   ├── security.md
│   ├── backup.md
│   ├── monitoring.md
│   └── troubleshooting.md
├── scripts/
│   ├── create-user.sh
│   ├── backup.sh
│   └── server-health.sh
└── screenshots/
```

## Core Topics

### 1. Architecture and Design

The environment is intentionally simple and production-like enough to teach operational reliability without unnecessary complexity. A single Ubuntu server can host:

- SSH for remote administration
- NGINX as a web service
- UFW as a firewall layer
- system logs and service monitoring
- scheduled backups and routine health checks

See [docs/architecture.md](docs/architecture.md) for details.

### 2. Installation and Setup

The installation guide covers environment preparation, package setup, user configuration, service installation, and validation steps. See [docs/installation.md](docs/installation.md).

### 3. Security Hardening

This lab emphasizes safe administration by teaching account protection, firewall rules, SSH hardening, package updates, file permissions, and log review. See [docs/security.md](docs/security.md).

### 4. Backup and Recovery

Backups are a critical operational responsibility. The repository includes a backup strategy using tar and rsync, retention policies, verification checks, and restore practices. See [docs/backup.md](docs/backup.md).

### 5. Monitoring and Health Checks

The monitoring guide includes system resource checks, log review, service status checks, and automation ideas for health monitoring. See [docs/monitoring.md](docs/monitoring.md).

### 6. Troubleshooting

System problems are documented with structured troubleshooting workflows for permissions, service failures, network issues, and storage problems. See [docs/troubleshooting.md](docs/troubleshooting.md).

## Practical Exercises

- [ ] Inspect the Linux filesystem and understand important directories.
- [ ] Create and manage users and groups.
- [ ] Configure file permissions and ownership correctly.
- [ ] Install and manage NGINX.
- [ ] Configure UFW firewall rules.
- [ ] Review system logs with journalctl and log files.
- [ ] Create a server health-check script.
- [ ] Create and verify backup archives.
- [ ] Document troubleshooting exercises clearly.
- [ ] Validate the final server state with automated checks.

## Recommended Workflow

1. Provision an Ubuntu Server VM or cloud instance.
2. Complete the installation steps in [docs/installation.md](docs/installation.md).
3. Apply the hardening guidance in [docs/security.md](docs/security.md).
4. Configure the backup routine in [docs/backup.md](docs/backup.md).
5. Validate system health using [docs/monitoring.md](docs/monitoring.md).
6. Practice incident response using [docs/troubleshooting.md](docs/troubleshooting.md).

## Evidence and Reporting

Screenshots, command outputs, configuration examples, and validation results should be stored in the project as evidence of completed tasks.

A well-maintained lab journal should include:

- configuration changes
- commands run
- outputs and validation checks
- decisions and findings
- issues encountered and resolutions

## Security Notice

This repository is intended only for educational use in authorized lab environments. Do not publish passwords, private keys, access tokens, or sensitive configuration details.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contribution

This repository is a learning lab, so contributions should focus on improving clarity, adding realistic scenarios, and strengthening documentation quality.

## Maintenance Guidance

To keep the lab valuable over time:

- ensure commands remain compatible with current Ubuntu releases
- document expected outputs and validation checks
- keep security guidance aligned with best practices
- update examples when server packages change

---

Built for continuous learning in Linux server administration and systems operations.
