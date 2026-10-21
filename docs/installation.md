# Installation Guide

This document provides a complete baseline installation and setup workflow for the Linux Server Administration Lab.

## Goal

Set up a clean Ubuntu-based Linux environment that is ready for user management, SSH configuration, firewall hardening, web service deployment, monitoring, and backup operations.

## Prerequisites

Before starting, ensure you have:

- Ubuntu Server 22.04 or 24.04 installed
- administrative access via sudo
- a stable network connection
- a virtual machine, server, or local Linux environment
- basic familiarity with the shell

## 1. System Preparation

Update the system before making changes:

```bash
sudo apt update && sudo apt upgrade -y
```

Install core packages used throughout the lab:

```bash
sudo apt install -y curl wget git openssh-server ufw nginx htop net-tools rsync zip unzip
```

Check the system version:

```bash
lsb_release -a
uname -a
```

## 2. Hostname and Network Configuration

Set a meaningful hostname:

```bash
sudo hostnamectl set-hostname linux-lab-server
```

Review the current network configuration:

```bash
ip addr
ip route
```

For a static IP setup, edit the netplan configuration. Typical file location:

```bash
ls /etc/netplan/
sudo nano /etc/netplan/01-netcfg.yaml
```

Example:

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: false
      addresses:
        - 192.168.1.50/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
          addresses: [8.8.8.8, 1.1.1.1]
```

Apply the configuration:

```bash
sudo netplan apply
```

## 3. User and Group Management

Create a non-root user with administrative privileges:

```bash
sudo adduser labuser
sudo usermod -aG sudo labuser
```

Create a dedicated admin group if needed:

```bash
sudo groupadd admins
sudo usermod -aG admins labuser
```

Verify group membership:

```bash
id labuser
```

## 4. SSH Configuration

Ensure the SSH service is installed and enabled:

```bash
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh
```

Back up the default SSH configuration before editing:

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
```

Recommended hardening changes include:

- PermitRootLogin no
- PasswordAuthentication no
- PubkeyAuthentication yes
- AllowUsers labuser

Edit the configuration:

```bash
sudo nano /etc/ssh/sshd_config
```

Reload the service:

```bash
sudo systemctl reload ssh
```

## 5. Firewall Configuration

Check the default UFW status:

```bash
sudo ufw status
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Allow SSH and HTTP traffic:

```bash
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```

Enable the firewall:

```bash
sudo ufw enable
sudo ufw status verbose
```

## 6. NGINX Setup

Install NGINX:

```bash
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx
```

Test the service locally:

```bash
curl -I http://localhost
```

Check the default site directory:

```bash
ls -l /var/www/html
```

You can replace the default page with a custom lab page or create additional virtual hosts as part of the exercises.

## 7. File System and Permissions Review

Review important system directories:

```bash
ls /etc
ls /var
ls /home
ls /srv
```

Set ownership of web content appropriately:

```bash
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
```

## 8. Log and Service Monitoring

Check service state:

```bash
systemctl list-units --type=service --state=running
journalctl -xe
```

Inspect key logs:

```bash
ls /var/log
sudo tail -f /var/log/syslog
```

## 9. Validation Checklist

Once installation is complete, confirm the following:

- OS is updated and stable
- SSH service is running
- firewall is enabled with expected rules
- NGINX responds to HTTP requests
- admin user can sudo without password prompts
- logs are being generated correctly

## 10. Next Steps

After the base installation is complete, continue with:

- [security.md](security.md)
- [backup.md](backup.md)
- [monitoring.md](monitoring.md)
- [troubleshooting.md](troubleshooting.md)

## Summary

This installation guide creates a secure and functional Linux server baseline. From here, the environment can be hardened, automated, and monitored in accordance with professional system administration practices.
