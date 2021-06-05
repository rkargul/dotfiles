#!/bin/bash

CONFIG_DIRS="nvim polybar kitty ranger rofi sxhkd bspwm"
DOTILES=".zshrc"
DOTDIRS=".scripts .oh-my-zsh"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir config &> /dev/null
mkdir dotfiles &> /dev/null

for dir in $CONFIG_DIRS; do
	cp -rv $HOME/.config/$dir $SCRIPT_DIR/config/
done

for file in $DOTFILES; do
	cp -v $HOME/$file $SCRIPT_DIR/dotfiles/
done

for dir in $DOTDIRS; do 
	cp -rv $HOME/$dir $SCRIPT_DIR/dotfiles/
done

