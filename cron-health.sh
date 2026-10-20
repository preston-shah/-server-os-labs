#!/bin/bash
echo "=== Cron Health Check $(date) ==="
echo "Cron service: $(systemctl is-active cron)"
echo "User cron jobs: $(crontab -l 2>/dev/null | grep -v '^#' | grep -v '^$' | grep -v '^PATH' | wc -l)"
echo "System cron.d files: $(ls /etc/cron.d/ | wc -l)"
echo "Recent backups: $(ls /backups/*.tar.gz 2>/dev/null | wc -l)"
