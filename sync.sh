#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

rm -rf "$SCRIPT_DIR"/config &> /dev/null
mkdir "$SCRIPT_DIR"/config &> /dev/null

rm -rf "$SCRIPT_DIR"/dotfiles &> /dev/null
mkdir "$SCRIPT_DIR"/dotfiles &> /dev/null

input="$SCRIPT_DIR"/config.txt

while IFS= read -r dir; do
	echo "Copying $dir"
	cp -rf "$HOME/.config/$dir" "$SCRIPT_DIR/config/"
done < "$input"

input="$SCRIPT_DIR"/dotfiles.txt

while IFS= read -r file; do
	echo "Copying $file"
	cp -rf "$HOME/$file" "$SCRIPT_DIR/dotfiles/" &> /dev/null
done < "$input"
