#!/usr/bin/env bash

# Simple backup script for a Linux server.
# Creates a timestamped tar.gz archive of a target directory.

set -euo pipefail

SOURCE_DIR="${1:-/var/www/html}"
BACKUP_DIR="${2:-/backup}"
TIMESTAMP=$(date +%Y-%m-%d-%H%M%S)
ARCHIVE_NAME="$(basename "$SOURCE_DIR")-${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$BACKUP_DIR/$ARCHIVE_NAME"
LOG_FILE="${3:-/var/log/backup.log}"
RETENTION_DAYS="${4:-7}"

mkdir -p "$BACKUP_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

sudo tar -czf "$ARCHIVE_PATH" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")" >> "$LOG_FILE" 2>&1

tar -tzf "$ARCHIVE_PATH" > /dev/null

echo "Backup created: $ARCHIVE_PATH" | tee -a "$LOG_FILE"

find "$BACKUP_DIR" -type f -name '*.tar.gz' -mtime +"$RETENTION_DAYS" -delete

echo "Old backups older than $RETENTION_DAYS days were removed." | tee -a "$LOG_FILE"
