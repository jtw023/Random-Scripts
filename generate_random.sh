#!/usr/bin/env bash

RANDOM_NUMBERS=""

for i in `seq 200`
do
    RANDOM_NUMBERS+=$RANDOM
done

if [[ "${#RANDOM_NUMBERS}" -gt $(expr $(tput cols) \* 3) ]]; then

    echo "${RANDOM_NUMBERS}" | cut -c 1-$(expr $(tput cols) \* 5)

else
    echo "${RANDOM_NUMBERS}"
fi

