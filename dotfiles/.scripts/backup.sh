#!/bin/bash

# Runs a backup of all important files:
# - RSync documents folder with local NAS
# - Sync dotfiles, commit to github, and mark release

DATE=$(date)

# TODO Create local NAS, and backup with rsync

# Sync dotfiles
echo "Sycning..."
cd $HOME/.dotfiles
./sync.sh

echo "Pushing to github..."
git add .
git commit -m "Automatic backup $DATE"
git push

