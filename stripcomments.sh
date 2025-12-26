#!/bin/bash
# This file removes all lines that contain a #, ; or are empty from the input file
grep -E -v '\s*#|\s*;|^$' $1 
