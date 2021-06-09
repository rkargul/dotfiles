#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir config &> /dev/null
mkdir dotfiles &> /dev/null

input="$SCRIPT_DIR"/config.txt

while IFS= read -r dir; do
	echo "Copying $dir"
	cp -r "$HOME"/.config/"$dir" "$SCRIPT_DIR"/config/ &> /dev/null
done < "$input"

input="$SCRIPT_DIR"/dotfiles.txt

while IFS= read -r file; do
	echo "Copying $file"
	cp -r "$HOME"/"$file" "$SCRIPT_DIR"/dotfiles/ &> /dev/null
done < "$input"
