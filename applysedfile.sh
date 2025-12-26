#!/bin/bash
# This code creates a backup for all files passed to the program
# and change its content with sed based on a pattern
IFS=$'\n'
for fn in $*; do
	echo "process $fn file"
	cp "$fn" "${fn%.*}.bak"
	sed s/nigga/nigger/Ig < "${fn%.*}.bak" > "$fn"
done
