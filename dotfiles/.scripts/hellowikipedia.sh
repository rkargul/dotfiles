#!/bin/bash

wikiscraper.py > /tmp/wikiarticle
notify-send "$(cat /tmp/wikiarticle)" -u normal

