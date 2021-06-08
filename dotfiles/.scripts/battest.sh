#!/bin/bash

BATPATH=/sys/class/power_supply/BAT0
BAT_FULL=$BATPATH/charge_full
BAT_NOW=$BATPATH/charge_now

bf=$(cat $BAT_FULL)
bn=$(cat $BAT_NOW)

if [ $(( 100 * $bn / $bf )) -lt 15 ]
then
	echo "Battery level: $(( 100 * $bn / $bf ))"
else
	dunstify -u critical "Warning: low battery\!" -i /usr/share/icons/HighContrast/16x16/status/battery-caution.png
fi
