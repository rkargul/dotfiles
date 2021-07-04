#!/bin/bash

# Runs a backup of all important files:
# - RSync documents folder with local NAS
# - Sync dotfiles, commit, and push to remote

DATE=$(date)

# Backup with rsync
echo "Backing up to local NAS..."
rsync -azP "/home/zohar/Documents" 192.168.0.142

# Sync dotfiles
echo "Sycning dotfiles..."
cd /home/zohar/.dotfiles
./sync.sh

echo "Pushing to remote..."
git add .
git commit -m "Automatic backup $DATE"
git push

