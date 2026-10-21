#!/usr/bin/env bash

# Create a standard Linux user with optional sudo privileges.
# Usage: ./create-user.sh <username> [group]

set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <username> [additional-group]"
  exit 1
fi

USERNAME="$1"
GROUP="${2:-}"

if id "$USERNAME" >/dev/null 2>&1; then
  echo "User $USERNAME already exists."
  exit 1
fi

sudo useradd -m -s /bin/bash "$USERNAME"

if [ -n "$GROUP" ]; then
  sudo usermod -aG "$GROUP" "$USERNAME"
fi

sudo usermod -aG sudo "$USERNAME"

sudo passwd "$USERNAME"

echo "User $USERNAME created successfully and added to sudo."
