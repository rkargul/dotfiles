#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

TARGET_DIR=$1

# set $TARGET_DIR to default if not set
if [[ "$TARGET_DIR" == "" ]]; then
	echo "No second argument found, defaulting to $HOME"
	TARGET_DIR="$HOME"
fi

# check if $TARGET_DIR exists
if [ ! -d "$TARGET_DIR" ]; then
	echo "Directory $TARGET_DIR doesn't exist, please change the target, or create the folder"
	exit 1
fi 

# copy all dotfiles to $TARGET_DIR
for file in "$SCRIPT_DIR"/dotfiles/.*; do
	if ! [[ "${file: -1}" == "." ]] && ! [[ "${file: -1}" == ".." ]]; then
		echo "Copying $file", to "$TARGET_DIR"
		cp -r "$file" "$TARGET_DIR"/ &> /dev/null || cp "$file" "$TARGET_DIR" &> /dev/null
	fi
done

# if .config doesnt exist, create it
if [ ! -d "$TARGET_DIR"/.config ]; then
	echo "Couldn't find .config, creating one..."
	mkdir -p "$TARGET_DIR"/.config
fi

# copy all dirs in config to $TARGET_DIR/.config
for dir in "$SCRIPT_DIR"/config/*; do
	if ! [[ "${dir: -1}" == "." ]] && ! [[ "${dir: -1}" == ".." ]]; then
		if cp -rf "$dir" "$TARGET_DIR"/.config; then
			echo "Copying $dir, to $TARGET_DIR"/.config
		else
			echo "Failed to copy $dir, to $TARGET_DIR"/.config
		fi
	fi
done

