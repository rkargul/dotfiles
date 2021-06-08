#!/bin/bash

if ! [[ $1 ]]; then
	exit 1
fi

ip a | grep -Po '('$1'\w+)'

