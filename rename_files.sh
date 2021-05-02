#!/usr/bin/env bash
#
# This is a script to remove leading whitespace
# from a filename.
#
# Tools used: mv.

#for filename in *.m4a; do
#    [ -f "$filename" ] || continue
#    mv "$filename" "$(echo $filename | awk '{print substr( $0, 6 ) }')"
#done

for filename in *.m4a; do
    [ -f "$filename" ] || continue
    mv "$filename" "$(echo $filename | sed -e 's/^[ \t]*//')"
done
