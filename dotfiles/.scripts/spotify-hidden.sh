#!/bin/bash

spotify &

exec hideIt.sh --class '^Spotify$' -w --direction top -H -S
