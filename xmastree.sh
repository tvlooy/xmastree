#!/bin/bash

clear

# Hide cursor
tput civis

tput sgr0
tput bold

# Find start position based on middle of screen
l=$(($(tput cols) / 2 - 6))

# Draw tree
tput setaf 11 # yellow
tput cup  0 $l;   echo "       ."
tput cup  1 $l;   echo "    __/ \\__"
tput cup  2 $l;   echo "    \\     /"
tput cup  3 $l;   echo -n "    /"
tput setaf 2 # green
tput cup  3 $(($l+5)); echo      ".'O'."
tput setaf 11 # yellow
tput cup  3 $(($l+10)); echo           "\\"
tput setaf 2 # green
tput cup  4 $l; echo "     .O.'."
tput cup  5 $l; echo "    .'.'O'."
tput cup  6 $l; echo "   O'.O.'.O."
tput cup  7 $l; echo "  .'.O.'.'.O."
tput cup  8 $l; echo " .O.'.O.'.O.'."
tput setaf 4 # blue
tput cup  9 $l; echo "    [_____]"
tput cup 10 $l; echo "     \\___/"

balls=(
  3.7
  4.6
  5.8
  6.3
  6.6
  6.10
  7.5
  7.11
  8.2
  8.6
  8.10
)

colors=(1 13 9 11)

while [ true ]; do

  for bal in ${balls[@]}; do
    y=$(echo $bal | cut -d. -f1)
    x=$(echo $bal | cut -d. -f2)
    color=${colors[$RANDOM % ${#colors[@]}]}
    tput setaf $color
    tput cup $y $(($l+$x)); echo "O"
  done

  sleep 0.1

done

