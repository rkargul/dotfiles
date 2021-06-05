#!/bin/bash

polybar-msg cmd hide
bspc config -m focused top_padding $((`bspc config -m focused top_padding` - 27 ))
