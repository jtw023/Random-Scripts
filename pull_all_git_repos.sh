#!/usr/bin/env bash

# This is a script that finds all git directories
# on the system and then runs the git pull command.

# What I use it for: I have it aliased in my zshrc
# as 'gp' for pulling all git directories with one command.

# Tools used: find, sed, cd, git

DIRECTORIES=($(find $HOME -name .git -type d -maxdepth 3 2>/dev/null | sed -E "s/\.git//g"))
COUNT=1

for DIRECTORY in "${DIRECTORIES[@]}"
do
    cd $DIRECTORY
    echo "$DIRECTORY:"
    echo ""
    git pull
    echo ""
done
