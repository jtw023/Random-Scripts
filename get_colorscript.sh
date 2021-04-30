#!/usr/bin/env bash
#
# This is a script that fetches a random colorscript from my
# config directory.
#
# What I use it for: in my .zshrc I have a line at the bottom
# 'bash *path/to/this/script*' which sets this as the first
# thing to run when I open a new terminal.
#
# Tools used: bash.

targetDir="/home/$USER/.config/colorscripts"

files=("$targetDir"/*)

bash "${files[RANDOM % ${#files[@]}]}"
