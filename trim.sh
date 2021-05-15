#!/usr/bin/env bash
#
# This is a script for triming audio with ffmpeg.
#
# What I use it for: it simply automates my ffmpeg command so I
# don't have to remember it. I also have it aliased to 'trim'
# inside of my .zshrc
#
# Tools used: ffmpeg, bash.
#
# Enter the arguments inside the same directory as the song to
# trim.
#
# Arguments: 1 is the file to trim, 2 is the start time, 3 is
# the end time, 4 is a filename for the new version.
#
# Be sure to wrap all arguments inside of double quotes.

bash -c "ffmpeg -i /home/jordan/Music/lyrical\\ music/$1 -ss $2 -to $3 -c copy /home/jordan/Music/lyrical\\ music/$4"
