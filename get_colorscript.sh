#!/usr/bin/env bash

targetDir="/home/jordan/.config/colorscripts"

files=("$targetDir"/*)

bash "${files[RANDOM % ${#files[@]}]}"
