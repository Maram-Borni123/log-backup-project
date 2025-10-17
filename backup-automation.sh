#!/bin/bash

log_dir="/var/log"
log_files=$(ls "$log_dir")
backup_dir="$HOME/logs"
mkdir -p "$backup_dir"
print_alert() { echo -e "\e[38;5;218m $1\e[0m"; }
date=$(date)
backup_file="$backup_dir/log-$date.tar.gz"

echo "logs in $log_dir:"
echo "$log_files"
read -p "Enter the logs you want to back up: " selected_file

test=false
for file in $log_files; do
    if [ "$file" = "$selected_file" ]; then
        echo "Backing up selected log: $selected_file"
        backup_folder="$backup_dir/$selected_file-$date_stamp"
        backup_tar="$backup_dir/${selected_file%.*}-$date_stamp.tar.gz"
        mkdir -p "$backup_folder"
        sudo cp "$log_dir/$selected_file" "$backup_folder"/
        sudo tar -czf "$backup_tar" -C "$backup_dir" "$(basename "$backup_folder")"
        rm -rf "$backup_folder"
        test=true
        break
    fi
done
if [ "$test" = true ]; then
         echo "Backup has been successfully created: $backup_file"
         echo "Inside the archive, the log is stored in the folder: $selected_file/"
else
         print_alert "No specific logs chosen. Try again later..."
         exit
fi
