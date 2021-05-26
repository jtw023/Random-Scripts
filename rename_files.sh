#!/usr/bin/env bash
#
# This is a script to remove leading whitespace
# from a filename.

for filename in *.m4a; do
    [ -f "$filename" ] || continue
    mv "$filename" "$(echo $filename | sed -e 's/^[ \t]*//')"
done
