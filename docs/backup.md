# Backup and Recovery Guide

This document describes the backup strategy for the Linux Server Administration Lab and explains how to create, verify, and restore backup data safely.

## Why Backups Matter

Backups are essential in system administration because they protect data, support disaster recovery, and make troubleshooting safer. A server may fail due to:

- accidental file deletion
- misconfigured services
- disk corruption
- malicious activity
- human error during updates

Without a reliable backup plan, recovery can be slow and expensive.

## Backup Strategy

The recommended approach is to create regular backups of:

- web content in /var/www/html
- configuration files in /etc
- critical user data and home directories
- custom scripts and local project files

## 1. Basic Archive Backup with tar

The `tar` utility is a standard and reliable choice for creating compressed archives.

```bash
sudo tar -czvf /backup/webroot-backup-$(date +%F-%H%M%S).tar.gz /var/www/html
```

This command creates a compressed archive containing the web directory.

## 2. Backup with rsync

`rsync` is useful when you want to copy files efficiently and keep a mirror of important directories.

```bash
sudo rsync -aHAX --info=progress2 /var/www/html/ /backup/www-live/
```

This approach is ideal when you want a near-real-time mirror of content.

## 3. Backup Script Example

The repository includes a sample backup utility in `scripts/backup.sh`. It can be used as a template for an automated scheduled backup process.

Example usage:

```bash
chmod +x scripts/backup.sh
./scripts/backup.sh
```

The script should normally:

- create a timestamped archive
- store it in a backup directory
- keep a defined retention period
- log the result
- verify the archive is valid

## 4. Scheduling Backups with cron

Use cron to run the backup automatically.

```bash
crontab -e
```

Example daily backup at 2:00 AM:

```cron
0 2 * * * /usr/local/bin/backup.sh >> /var/log/backup.log 2>&1
```

You can also use systemd timers for more structured automation, especially in modern Ubuntu systems.

## 5. Backup Verification

Before trusting a backup, verify that the archive is readable and complete.

```bash
tar -tzf /backup/webroot-backup-2026-10-21-020000.tar.gz | head
```

A good verification process should check:

- archive is readable
- expected files are present
- size is reasonable
- restore test is successful for at least one important file

## 6. Restore Procedure

Restore process should be tested regularly.

Example extraction:

```bash
sudo tar -xzvf /backup/webroot-backup-2026-10-21-020000.tar.gz -C /
```

If using rsync:

```bash
sudo rsync -aHAX /backup/www-live/ /var/www/html/
```

Always validate the restored content after extraction.

## 7. Retention Policy

A standard retention policy could be:

- daily backups for 7 days
- weekly backups for 4 weeks
- monthly backups for 6 months

Use rm or find with caution to avoid accidental deletion of necessary archives.

## 8. Best Practices

- store backups outside the main system disk when possible
- keep encrypted or protected copies of critical data
- test restore procedures routinely
- document backup schedule and retention rules
- avoid storing unprotected secrets in backup files

## Summary

Backup operations are a routine part of Linux server administration. A disciplined backup strategy protects the system from both technical failures and operational mistakes.
