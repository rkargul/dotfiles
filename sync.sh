#!/bin/bash

CONFIG_DIRS="nvim polybar kitty ranger rofi sxhkd bspwm"
DOTILES=".zshrc .scripts .oh-my-zsh .fehbg"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir config &> /dev/null
mkdir dotfiles &> /dev/null

for dir in $CONFIG_DIRS; do
	echo "Copying $dir"
	cp -r $HOME/.config/$dir $SCRIPT_DIR/config/
done

for file in $DOTFILES; do 
	echo "Copying $file"
	cp -r $HOME/$file $SCRIPT_DIR/dotfiles/
done

