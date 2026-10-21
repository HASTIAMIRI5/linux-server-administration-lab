# Linux Server Administration Lab

This repository is organized to teach Linux systems administration in a hands-on, professional manner. It is designed around a basic but realistic server environment where students can configure an Ubuntu system, secure it, monitor it, and troubleshoot common administration tasks.

## Architecture Overview

The lab models a minimal production-like Linux server. Each task is focused on a distinct operational area while still using the same system environment.

```text
+----------------------+       +----------------------+
| Administrator / Dev | ----> | Ubuntu Server VM     |
| SSH, Monitoring,    |       | - SSH service        |
| Backup, Troubleshoot|       | - NGINX              |
+----------------------+       | - UFW firewall       |
                                | - Logs / Journald    |
                                | - Systemd services   |
                                +----------------------+
                                            |
                                            v
                                +----------------------+
                                | Supporting Services  |
                                | - apt updates        |
                                | - cron jobs          |
                                | - backup retention   |
                                +----------------------+
```

## Design Goals

The architecture intentionally emphasizes:

- simple configuration management
- easy reproducibility in a virtual machine
- clear separation between system administration tasks
- realistic security and monitoring practices
- straightforward troubleshooting workflows

## Core Components

### 1. Ubuntu Server Base

The base operating system is the foundation of the lab. It includes the Linux kernel, system services, package manager, networking, users, and the shell environment.

### 2. SSH Access

Secure Shell is used for remote administrative access. The lab includes guidance for:

- installing OpenSSH Server
- creating administrative users
- enabling key-based authentication
- restricting access to trusted clients
- disabling password login when appropriate

### 3. Firewall Hardening

UFW is used to restrict network access and enforce a least-privilege security model. Baseline rules typically allow:

- SSH access from trusted networks
- HTTP/HTTPS traffic for the web server
- administrative access only where required

### 4. Web Hosting Services

NGINX acts as the example application service. The lab can be used to validate:

- service installation
- configuration loading
- virtual host setup
- request testing
- log review

### 5. Monitoring and Observability

The lab teaches operational awareness by covering:

- CPU, memory, and disk usage checks
- service status validation
- process monitoring
- log review
- uptime and health checks

### 6. Backup and Recovery

A strong server administration workflow includes scheduled backup tasks and restore procedures. This protects data and makes the environment inspectable and resilient.

## Typical Lab Flow

```text
Provision VM
   ↓
Install OS and core packages
   ↓
Configure users and permissions
   ↓
Install SSH and firewall
   ↓
Deploy and test NGINX
   ↓
Add monitoring and health checks
   ↓
Schedule backups and verify retention
   ↓
Troubleshoot and document fixes
```

## Operational Principles

The lab follows these practices:

- Principle of least privilege
- Keep systems updated and documented
- Use automation for repetitive tasks
- Validate configuration after changes
- Preserve logs and evidence for troubleshooting
- Back up before major modifications

## Related Documentation

- [installation.md](installation.md)
- [security.md](security.md)
- [backup.md](backup.md)
- [monitoring.md](monitoring.md)
- [troubleshooting.md](troubleshooting.md)

## Example Use Cases

This repository is useful for:

- classroom labs
- personal Linux practice
- DevOps or systems administration preparation
- building a reusable server administration checklist
- validating understanding of Linux service operations

## Summary

This architecture is intentionally minimal but realistic. It gives learners a strong foundation for understanding how Linux servers are configured, secured, and managed in real-world environments.
