#!/bin/bash
# changeVolume

# Arbitrary but unique message id
msgId="991049"

# Query amixer for the current volume and whether or not the speaker is muted
volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
	head -n $(( $(get_active_sonk.sh sinks) + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

if [[ $volume == 0 ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i /usr/share/icons/Adwaita/32x32/status/audio-volume-muted-symbolic.symbolic.png -r "$msgId" "Volume muted" 
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i /usr/share/icons/Adwaita/32x32/status/audio-volume-high-symbolic.symbolic.png -r "$msgId" \
    -h int:value:"$volume" "Volume: ${volume}%"
fi

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"

