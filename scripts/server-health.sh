#!/usr/bin/env bash

# Server health check script.
# Reports basic resource usage and service state.

set -euo pipefail

echo "=== Linux Server Health Check ==="
echo "Time: $(date)"

echo "--- System ---"
cat /etc/os-release | head -n 2
uname -a

echo "--- Uptime ---"
uptime

echo "--- Memory ---"
free -h

echo "--- Disk Usage ---"
df -h

echo "--- Top Processes ---"
ps aux --sort=-%cpu | head -n 10

echo "--- Running Services ---"
systemctl list-units --type=service --state=running --no-pager | head -n 20

echo "--- Network ---"
ss -tulnp | head -n 20

echo "--- Recent Login Activity ---"
last -n 10 || true

echo "=== Health check complete ==="
