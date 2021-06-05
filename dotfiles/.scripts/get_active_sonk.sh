#!/bin/bash

function pacgrep () {
	OUT=$(pactl list $2 | grep -B 1 $1 | head -n 1 | awk 'NF>1{print $NF}')
	OUT="${OUT:1}"
	echo $OUT
}

if [[ $(pacgrep 'RUNNING' $1) ]]; then
	echo $(pacgrep 'RUNNING' $1)
	exit 0
fi

pacgrep 'IDLE' $1

