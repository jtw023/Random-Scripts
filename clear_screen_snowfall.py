#!/usr/bin/env python
"""
This script clears the screen with a snowflake pattern only
in the month of December.

What I use it for: in my .zshrc I have the 'cl' command
mapped to this script.

Tools used: python, get_terminal_size, system, random,
choice, sleep, and date.
"""

from os import get_terminal_size, system
from random import random, choice
from time import sleep
from datetime import date

TODAY = date.today()
SNOW_DENSITY = 8
DELAY = .05

SNOW = 0
SNOWFLAKES = ['❄', '❅', '❆', '❃']

TERM = get_terminal_size()

WIDTH = TERM.columns
HEIGHT = TERM.lines

GRID = []

for _ in range(HEIGHT):
    GRID.append([' '] * WIDTH)

def draw_grid():
    '''funtion used for drawing the snowflakes on screen'''

    print('\033[?25l')

    output = ''

    for space in GRID:
        output += ''.join(space) + '\n'

    output = output.strip('\n')

    print(output, end='')

if __name__ == '__main__':
    if TODAY.strftime("%m") == '12':
        while SNOW < HEIGHT:
            row = []


            for _ in range(WIDTH):
                if random() < SNOW_DENSITY / 100:
                    row.append(choice(SNOWFLAKES))
                else:
                    row.append(' ')

            GRID.insert(0, row)
            GRID.pop()

            system('clear')

            draw_grid()

            sleep(DELAY)
            SNOW += 1

            system('clear')
