#!/usr/bin/env bash
#
# This is a script that generates a sequence of random numbers,
# cuts the length if over 5 rows, and then outputs to your terminal.
#
# What I use it for: in my .zshrc I have an alias
# 'alias cl="clear; bash *path/to/this/script* | lolcat"' for some
# color at the top of my terminal everytime I clear it.
#
# Tools used: seq, expr, tput, echo, and cut.

RANDOM_NUMBERS=""

for i in `seq 200`
do
    RANDOM_NUMBERS+=$RANDOM
done

if [[ "${#RANDOM_NUMBERS}" -gt $(expr $(tput cols) \* 5) ]]; then

    echo "${RANDOM_NUMBERS}" | cut -c 1-$(expr $(tput cols) \* 5)

else
    echo "${RANDOM_NUMBERS}"
fi

