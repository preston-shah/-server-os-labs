#!/bin/bash
# Automated backup script

SOURCE="/srv/importantdata"
BACKUP_DIR="/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Create the backup
tar -czf "$BACKUP_FILE" "$SOURCE" 2>/dev/null

# Log the result
if [ $? -eq 0 ]; then
echo "$(date): Backup successful - $BACKUP_FILE" >> /var/log/labcron/backup.log
else
echo "$(date): Backup FAILED" >> /var/log/labcron/backup.log
fi

# Keep only the 5 most recent backups (cleanup)
ls -t $BACKUP_DIR/backup_*.tar.gz 2>/dev/null | tail -n +6 | xargs -r rm

echo "Backup completed: $BACKUP_FILE"
