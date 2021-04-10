#!/usr/bin/env bash

RANDOM_NUMBERS=""
for i in `seq 167`
do
    RANDOM_NUMBERS+=$RANDOM
done

echo $RANDOM_NUMBERS
