#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

TARGET_DIR=$1

if [[ "$TARGET_DIR" == "" ]]; then
	echo "No second argument found, defaulting to $HOME"
	TARGET_DIR="$HOME"
fi

for file in "$SCRIPT_DIR"/dotfiles/.*; do
	if ! [[ "${file: -1}" == "." ]] && ! [[ "${file: -1}" == ".." ]]; then
		echo "Copying $file", to "$TARGET_DIR"
		cp -r "$file"/ "$TARGET_DIR" &> /dev/null || cp "$file" "$TARGET_DIR" &> /dev/null
	fi
done

for dir in "$SCRIPT_DIR"/config/*; do
	if ! [[ $(ls -al "$TARGET_DIR"/ | grep .config) ]]; then
		echo "Couldn't find .config, creating one..."
		mkdir "$TARGET_DIR"/.config
	fi
	if ! [[ "${dir: -1}" == "." ]] && ! [[ ${dir: -1} == ".." ]]; then
		echo "Copying $dir, to $TARGET_DIR"
		cp -r "$dir"/ "$TARGET_DIR"/.config &> /dev/null
	fi
done
