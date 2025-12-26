#!/bin/bash
# Transform any JPEG image into a 400x400 image, if dimensions are lower then don't reshape

IFS=$"\n"
if [ ! -d "resized" ]; then
	mkdir resized
	echo "Directory created"
fi
for filename in $*; do
	echo "--> processing file: $filename"
	magick -size 400x400 "$filename" -resize 400x400 \
		"resized/$filename"
done
