# Security Hardening Guide

This document outlines the key security controls and operational safeguards used in the Linux Server Administration Lab.

## Security Principles

The lab follows a simple but effective model:

- protect administrative access
- limit network exposure
- enforce least privilege
- keep software patched
- monitor logs and changes
- document security decisions

## 1. Secure Account Management

Create a dedicated administrative user instead of sharing root access.

```bash
sudo adduser adminuser
sudo usermod -aG sudo adminuser
```

Review user accounts:

```bash
cat /etc/passwd
getent group sudo
```

Lock unnecessary system accounts if they are not required.

```bash
sudo passwd -l daemon
```

## 2. SSH Hardening

Securing SSH is essential for system administration. Recommended settings include:

```bash
sudo nano /etc/ssh/sshd_config
```

Use the following secure configuration values:

```text
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding no
AllowUsers adminuser
```

Restart SSH after modification:

```bash
sudo systemctl restart ssh
sudo systemctl status ssh
```

Always verify that key-based authentication works before disabling password access.

## 3. Firewall Rules

UFW is a strong default firewall for Ubuntu. Use it to restrict access to only required services.

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status verbose
```

For a production-like environment, allow ports only when needed and avoid exposing unnecessary services.

## 4. File Permissions and Ownership

Permissions are one of the most important aspects of Linux security.

Review file ownership and mode:

```bash
ls -l /etc /var/www /home
```

Typical examples:

```bash
sudo chown root:root /etc/ssh/sshd_config
sudo chmod 600 /etc/ssh/sshd_config
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
```

Avoid granting write access to non-admin users on sensitive system paths.

## 5. Package Updates and Patching

Keep the system current:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
```

For an environment with security requirements, configure unattended upgrades if needed:

```bash
sudo apt install -y unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades
```

## 6. Logging and Audit Practices

Review logs regularly:

```bash
journalctl -xe
sudo tail -f /var/log/auth.log
sudo tail -f /var/log/syslog
```

Useful checks include:

- failed login attempts
- service restarts
- authorization errors
- unexpected file changes

## 7. Service Hardening

Before enabling services, confirm they are necessary.

```bash
systemctl list-unit-files --type=service
systemctl status nginx
systemctl status ssh
```

Disable services that are not required:

```bash
sudo systemctl disable --now foo-service
```

## 8. Monitoring for Security Events

Common security indicators include:

- repeated failed SSH logins
- unexpected open ports
- changes to executable files
- disabled or modified firewall rules
- service instability

Use monitoring tools and logs to identify suspicious activity early.

## 9. Recommended Baseline Policy

A secure baseline should include:

- no direct root login
- key-based SSH authentication
- firewall enabled by default
- minimal service exposure
- weekly or daily patching
- user-level least privilege access
- centralized log review

## 10. Incident Response Reminder

When a problem is suspected, capture these details first:

- timestamp of the event
- system logs related to the issue
- affected service or user
- current firewall and port state
- recent changes to configuration files

## Summary

Strong Linux security is built from a combination of correct account administration, network restrictions, log review, patching, and controlled service exposure. These practices reduce risk and establish a solid foundation for all other lab tasks.
