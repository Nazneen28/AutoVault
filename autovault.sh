#!/bin/bash
echo "$(date) CRON TRIGGERED" >> /Users/nazneensakheen/AutoVault/cron_test.log
SOURCES=$(cat backup.conf)

DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p backups
SUCCESS=0
FAILED=0
for dir in $SOURCES
do
    name=$(basename "$dir")
    if [ -d "$dir" ]
then
    echo "$(date): Found $dir" >> autovault.log
    SUCCESS=$((SUCCESS + 1))
else
    echo "$(date): ERROR - Folder not found: $dir" >> autovault.log
    FAILED=$((FAILED + 1))
    continue
fi

    tar --exclude="backups" -czf "backups/${name}_${DATE}.tar.gz" "$dir"

    if [ $? -eq 0 ]
    then
        echo "$(date): Backup successful for $name" >> autovault.log
    else
        echo "$(date): Backup failed for $name" >> autovault.log
    fi
done
find backups -name "*.tar.gz" -mtime +7 -delete
echo "==================================" >> autovault.log
echo "Backup Summary - $(date)" >> autovault.log
echo "Successful Backups: $SUCCESS" >> autovault.log
echo "Failed Backups: $FAILED" >> autovault.log
echo "==================================" >> autovault.log