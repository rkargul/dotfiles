#!/bin/bash

function pacgrep-sink () {
OUT=$(pactl list sinks | grep -B 1 $1 | head -n 1 | awk 'NF>1{print $NF}')

	if [[ $OUT ]]; then
		echo ${OUT:1}
		exit 0
	fi
}

function pacgrep-source () {
	OUT=$(pactl list sources | grep -B 1 $1 | head -n 1 | awk 'NF>1{print $NF}')

	if [[ $OUT ]]; then
		echo ${OUT:1}
		exit 0
	fi
}

function err() {
	echo "Improper usage: get-active-sonk.sh [sinks, sources]"
	exit 1
}

if ! [[ $1 ]]; then
	err
fi

if [[ $1 -eq "sinks" ]]; then
	pacgrep-sink 'RUNNING' $1
	pacgrep-sink 'IDLE' $1
	pacgrep-sink 'SUSPENDED' $1
	exit 0
fi

if [[ $1 -eq "sources" ]]; then
	pacgrep-source 'RUNNING' $1
	pacgrep-source 'IDLE' $1
	pacgrep-source 'SUSPENDED' $1
	exit 0
fi

err

