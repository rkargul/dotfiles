#!/bin/bash

{ sudo ddcutil setvcp 0x10 && touch /tmp/.finished }

# until $(ls /tmp | grep finished)
# do
# 	echo -e "."
# 	sleep 0.5
# done

rm /tmp/.finished
