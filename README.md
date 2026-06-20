![Bash](https://img.shields.io/badge/Bash-Script-green)

![Platform](https://img.shields.io/badge/Platform-macOS-blue)

# AutoVault

Automated backup solution built using Bash.

## Features

- Reads source folders from backup.conf
- Creates compressed tar.gz backups
- Adds timestamp to backup names
- Logs backup status
- Deletes backups older than 7 days
- Supports cron scheduling

## Files

backup.conf
autovault.sh
autovault.log
backups/

## Run

chmod +x autovault.sh
./autovault.sh

## Cron

- - - - - /Users/nazneensakheen/AutoVault/autovault.sh

## Sample Log Output

Sat Jun 20 23:58:38 IST 2026: Backup successful for Documents

Sat Jun 20 23:58:38 IST 2026: Backup successful for AutoVault
