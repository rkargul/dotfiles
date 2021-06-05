#!/bin/bash

rdesktop -z -x l -r sound:off -u $1 $2:3389 &> /dev/null & 
disown
