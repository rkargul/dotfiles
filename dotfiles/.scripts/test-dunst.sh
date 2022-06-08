#!/usr/bin/env bash

if [ $(dunstctl is-paused) = 'true' ]; then
    exit 1
else
    exit 0
fi
