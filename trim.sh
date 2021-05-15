#!/usr/bin/env bash
#
# This is a script for triming audio with ffmpeg.
#
# What I use it for: it simply automates my ffmpeg command so I
# don't have to remember it.
#
# Tools used: ffmpeg, bash.

bash -c "ffmpeg -i /home/jordan/Music/lyrical\\ music/$1 -ss $2 -to $3 -c copy /home/jordan/Music/lyrical\\ music/$4"
