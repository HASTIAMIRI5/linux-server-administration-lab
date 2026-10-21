# Troubleshooting Guide

This document outlines a professional, repeatable approach to diagnosing and resolving common Linux server and service problems.

## Troubleshooting Mindset

When a Linux system fails, the goal is to gather facts quickly and narrow the root cause methodically. Good troubleshooting follows a sequence:

1. Verify the symptom
2. Check the service and logs
3. Review recent configuration changes
4. Validate resource health
5. Apply the smallest corrective fix
6. Confirm the system is stable

## 1. Common Problems and Checks

### Access denied or permission issues

```bash
ls -l /path/to/file
id username
sudo -l
```

Look for:

- wrong ownership
- incorrect file mode
- sudo policy mismatch
- missing group membership

### Service not starting

```bash
sudo systemctl status nginx
sudo journalctl -u nginx -n 100 --no-pager
```

Inspect:

- failed unit state
- syntax errors in configuration files
- missing dependencies
- failing service start order

### SSH not reachable

```bash
sudo systemctl status ssh
sudo ss -lnt | grep 22
sudo tail -f /var/log/auth.log
```

Check:

- firewall rules
- port 22 exposure
- SSH config syntax
- key permissions

### NGINX returns 502 or 503

```bash
sudo systemctl status nginx
sudo tail -f /var/log/nginx/error.log
```

Look for:

- upstream application issues
- invalid configuration
- file permission problems
- insufficient process resources

### Disk full

```bash
df -h
du -sh /* 2>/dev/null | sort -h
```

Typical causes:

- logs growing without rotation
- backups not pruned
- application cache expansion
- temporary files left behind

## 2. System Logs

Useful log sources include:

```bash
journalctl -xe
/var/log/syslog
/var/log/auth.log
/var/log/nginx/error.log
```

Logs should be reviewed before making changes so you can separate configuration issues from environmental problems.

## 3. Configuration Review

If a service fails after a change, inspect the exact file involved:

```bash
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
```

For SSH and firewall troubleshooting:

```bash
sudo sshd -T
sudo ufw status verbose
```

## 4. Resource Bottlenecks

A server may appear broken even when the service is fine. Check for:

```bash
free -h
vmstat 1 5
ps aux --sort=-%cpu
df -h
```

Common causes include:

- low memory
- saturated CPU
- full storage
- stuck processes
- runaway background jobs

## 5. Change Management

When debugging, capture the timeline of changes:

- package installation or upgrades
- firewall updates
- config file edits
- service restarts
- scheduled jobs

This helps distinguish configuration drift from recent faults.

## 6. Standard Recovery Approach

A typical recovery sequence:

1. identify the failed component
2. inspect logs and service status
3. confirm file and permission state
4. validate hardware or network conditions
5. restore the last working configuration if needed
6. test the service again

## 7. Documentation Practice

Every fix should be recorded in a simple lab journal:

- problem summary
- root cause
- commands used
- verification steps
- final status

This improves long-term operational knowledge and helps others recover faster.

## Summary

Troubleshooting in Linux is a structured problem-solving discipline. The best administrators combine log analysis, system checks, careful changes, and clear documentation to restore services quickly and confidently.
