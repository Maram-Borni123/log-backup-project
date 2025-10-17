##Log Backup Automation Script

This Bash script automatically backs up system log files from `/var/log` into compressed `.tar.gz` files, stored safely in your home directory.


## ️ What It Does

- Lists all available log files in `/var/log`
- Lets you choose one specific log file to back up (or all logs)
- Creates a time-stamped backup folder
- Compresses it into a `.tar.gz` file
- Stores it inside `~/logs`
- Automatically names the backup file.
