#!/bin/bash

$HOME/.config/polybar/launch.sh $1

sleep 1

# Wait for polybar to be launched
until [[ $(ps aux | grep polybar) ]]; do
	sleep 1
done

# Kill al instances of hideIt
for PID in $(ps aux | grep hideIt.sh | grep polybar | grep -oP '^zohar\s+\K(\w+)\s'); do
	kill -9 $PID
done

# Run hideIt
exec hideIt.sh --class '^polybar$' --direction top -p -$2 -H -S &> /dev/null &

# Remove top padding
bspc config top_padding 0

