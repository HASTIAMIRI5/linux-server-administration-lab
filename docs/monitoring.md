# Monitoring and Health Check Guide

This document explains how to monitor a Linux server, validate service health, and identify resource bottlenecks in a structured way.

## Monitoring Goals

Monitoring helps administrators detect problems before they become outages. The most important signs to track are:

- CPU usage
- memory consumption
- disk space
- service state
- network connectivity
- log errors and warnings

## 1. Basic System Health Commands

Check system uptime and load:

```bash
uptime
who
```

Review CPU and memory usage:

```bash
free -h
vmstat 1 5
```

Inspect disk usage:

```bash
df -h
du -sh /var /home /tmp
```

## 2. Process and Service Monitoring

Use `ps` and `top` to inspect active processes:

```bash
ps aux --sort=-%mem
ps aux --sort=-%cpu
htop
```

Check service status:

```bash
systemctl status nginx
systemctl status ssh
systemctl list-units --type=service --state=failed
```

## 3. Network Monitoring

Review active connections:

```bash
ss -tulnp
ip addr
ip route
netstat -tulpn
```

Check whether a service is listening on the expected port:

```bash
ss -lnt | grep 80
ss -lnt | grep 22
```

## 4. Log Review

Logs are the first place to look when investigating system health issues.

```bash
journalctl -xe
sudo tail -f /var/log/syslog
sudo tail -f /var/log/auth.log
```

Common issues visible in logs include:

- failed service startups
- permission errors
- authentication failures
- disk full warnings
- firewall or network rejections

## 5. NGINX Monitoring

Check whether the web server is responding:

```bash
sudo systemctl status nginx
curl -I http://localhost
```

Inspect NGINX log files:

```bash
sudo tail -f /var/log/nginx/access.log
sudo tail -f /var/log/nginx/error.log
```

## 6. Health Script Example

The repository includes a sample health-check script in `scripts/server-health.sh` that can be extended to provide baseline server validation.

Example:

```bash
chmod +x scripts/server-health.sh
./scripts/server-health.sh
```

A good health script should check:

- CPU load
- memory availability
- disk usage
- root filesystem status
- service status
- basic connectivity

## 7. Alerting Considerations

Simple monitoring can become more effective with alerting rules. Typical alert triggers include:

- CPU above 90% for sustained periods
- memory near exhaustion
- disk usage above 85%
- failed service restarts
- repeated SSH failures
- unexpected service downtime

## 8. Best Practices

- monitor both system metrics and application availability
- review logs regularly, not only after failures
- document acceptable thresholds for the environment
- automate repeated checks where possible
- verify that monitoring reflects the real production workload

## Summary

Consistent monitoring is a core admin skill. A healthy Linux server is not just one that runs, but one whose resource usage, logs, and services remain stable and predictable.
