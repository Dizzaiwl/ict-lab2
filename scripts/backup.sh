#!/bin/bash
set -e

SOURCE_DIR="./docs"
BACKUP_DIR="./backup"
LOG_FILE="./logs/backup.log"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Ошибка: Директория $SOURCE_DIR не существует."
    exit 1
fi

ARCHIVE_NAME="docs_$(date +%Y%m%d_%H%M%S).tar.gz"
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR"

echo "$(date +'%Y-%m-%d %H:%M:%S') - Создан бэкап $ARCHIVE_NAME" >> "$LOG_FILE"
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete[
