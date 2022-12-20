#!/bin/bash

# `tput` uses the terminfo db to make the values of terminal-dependent capabilities
# and info avail to the shell, to init or reset the terminal, or return the long
# name of the requested terminal type.
LINES=$(tput lines)
COLUMNS=$(tput cols)

# `declare` allows you to update attributes applied to variables within the scope
# of your shell.
declare -A snowflakes
declare -A lastflakes

clear

function move_flake() {
    # this function moves the snowflakes by deleting them from the line they are
    # on and printing them on the next line. it also generate new flakes by the
    # random number it gets as flakes' columns.

    i="$1"

    if [ "${snowflakes[$i]}" = "" ] || [ "${snowflakes[$i]}" = "$LINES" ]; then
        snowflakes[$i]=0
    else
        if [ "${lastflakes[$i]}" != "" ]; then
            printf "\033[%s;%sH \033[1;1H " ${lastflakes[$i]} $i
        fi
    fi

    printf "\033[%s;%sH\u274$[($RANDOM%6)+3]\033[1;1H" ${snowflakes[$i]} $i

    lastflakes[$i]=${snowflakes[$i]}
    snowflakes[$i]=$((${snowflakes[$i]}+1))
}

while :
do
    i=$(($RANDOM % $COLUMNS))
    move_flake $i

    for x in "${!lastflakes[@]}"
    do
        move_flake "$x"
    done

    sleep 0.1
done
