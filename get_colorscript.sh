#!/usr/bin/env bash

targetDir="/home/$USER/.config/colorscripts"

files=("$targetDir"/*)

bash "${files[RANDOM % ${#files[@]}]}"
