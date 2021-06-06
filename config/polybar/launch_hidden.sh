#!/bin/bash

$HOME/.config/polybar/launch.sh $1

until hideIt.sh --class '^polybar$' --direction top --hover -s 10
do
	sleep 1
	bspc config top_padding 0
done 
