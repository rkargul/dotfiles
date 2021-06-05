#!/bin/bash

pactl list | grep -B 1 'RUNNING' | grep Sink | tail -c 2 | head -c 1
