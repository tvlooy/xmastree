#!/bin/bash

clear

# Hide cursor
tput civis

# Find start position based on middle of screen
l=$(($(tput cols) / 2 - 23))

# Draw rack background
tput setaf 4; tput setab 0; tput bold

for ((i=3; i<46; i++))
{
    tput cup $i $(($l+5)); echo "                                     "
}

# Draw logos
tput setaf 7; tput setab 4

tput cup 5 $(($l+30)); echo " Juniper "

tput cup 9 $(($l+20)); echo "(DELL)"
tput cup 15 $(($l+20)); echo "(DELL)"
tput cup 21 $(($l+20)); echo "(DELL)"
tput cup 27 $(($l+20)); echo "(DELL)"
tput cup 33 $(($l+20)); echo "(DELL)"

tput cup 38 $(($l+9)); echo "      "
tput cup 39 $(($l+9)); echo "  "
tput cup 39 $(($l+13)); echo "  "
tput cup 40 $(($l+9)); echo "  "
tput cup 40 $(($l+13)); echo "  "

tput setaf 7; tput setab 0; tput bold
tput cup 42 $(($l+9)); echo "NetApp"

# Draw rack
tput setaf 4; tput setab 4

tput cup  3 $(($l+5)); echo "+-----------------------------------+"
tput cup  4 $(($l+5)); echo "| --------------------------------- |"
tput cup  5 $(($l+5)); echo "||"
tput cup  5 $(($l+40)); echo "||"
tput cup  6 $(($l+5)); echo "||---------------------------------||"
tput cup  7 $(($l+5)); echo "||  \\"
tput cup  7 $(($l+37)); echo "/  ||"
tput cup  8 $(($l+5)); echo "||   ---------------------------   ||"
tput cup  9 $(($l+5)); echo "||             "
tput cup  9 $(($l+26)); echo "              ||"
tput cup 10 $(($l+5)); echo "||   ---------------------------   ||"
tput cup 11 $(($l+5)); echo "||  /"
tput cup 11 $(($l+37)); echo "\\  ||"
tput cup 12 $(($l+5)); echo "||---------------------------------||"
tput cup 13 $(($l+5)); echo "||  \\"
tput cup 13 $(($l+37)); echo "/  ||"
tput cup 14 $(($l+5)); echo "||   ---------------------------   ||"
tput cup 15 $(($l+5)); echo "||             "
tput cup 15 $(($l+26)); echo "              ||"
tput cup 16 $(($l+5)); echo "||   ---------------------------   ||"
tput cup 17 $(($l+5)); echo "||  /"
tput cup 17 $(($l+37)); echo "\\  ||"
tput cup 18 $(($l+5)); echo "||---------------------------------||"
tput cup 19 $(($l+5)); echo "||  \\"
tput cup 19 $(($l+37)); echo "/  ||"
tput cup 20 $(($l+5)); echo "||   ---------------------------   ||"
tput cup 21 $(($l+5)); echo "||             "
tput cup 21 $(($l+26)); echo "              ||"
tput cup 22 $(($l+5)); echo "||   ---------------------------   ||"
tput cup 23 $(($l+5)); echo "||  /"
tput cup 23 $(($l+37)); echo "\\  ||"
tput cup 24 $(($l+5)); echo "||---------------------------------||"
tput cup 25 $(($l+5)); echo "||  \\"
tput cup 25 $(($l+37)); echo "/  ||"
tput cup 26 $(($l+5)); echo "||   ---------------------------   ||"
tput cup 27 $(($l+5)); echo "||             "
tput cup 27 $(($l+26)); echo "              ||"
tput cup 28 $(($l+5)); echo "||   ---------------------------   ||"
tput cup 29 $(($l+5)); echo "||  /"
tput cup 29 $(($l+37)); echo "\\  ||"
tput cup 30 $(($l+5)); echo "||---------------------------------||"
tput cup 31 $(($l+5)); echo "||  \\"
tput cup 31 $(($l+37)); echo "/  ||"
tput cup 32 $(($l+5)); echo "||   ---------------------------   ||"
tput cup 33 $(($l+5)); echo "||             "
tput cup 33 $(($l+26)); echo "              ||"
tput cup 34 $(($l+5)); echo "||   ---------------------------   ||"
tput cup 35 $(($l+5)); echo "||  /"
tput cup 35 $(($l+37)); echo "\\  ||"
tput cup 36 $(($l+5)); echo "||---------------------------------||"
tput cup 37 $(($l+5)); echo "||"
tput cup 37 $(($l+40)); echo "||"
tput cup 38 $(($l+5)); echo "||"
tput cup 38 $(($l+40)); echo "||"
tput cup 39 $(($l+5)); echo "||"
tput cup 39 $(($l+40)); echo "||"
tput cup 40 $(($l+5)); echo "||"
tput cup 40 $(($l+40)); echo "||"
tput cup 41 $(($l+5)); echo "||"
tput cup 41 $(($l+40)); echo "||"
tput cup 42 $(($l+5)); echo "||"
tput cup 42 $(($l+40)); echo "||"
tput cup 43 $(($l+5)); echo "||"
tput cup 43 $(($l+40)); echo "||"
tput cup 44 $(($l+5)); echo "| --------------------------------- |"
tput cup 45 $(($l+5)); echo "+-----------------------------------+"

# Print wishes
tput sgr0; tput bold

tput cup 1 $(($l+3))
tput setaf 6
echo 'Een zalige kerst en een fantastisch 2020!'
tput cup 47 $(($l+9))
tput setaf 5
echo 'vanwege het Intracto SRE team'

# Draw blinkenlights
tput setab 0

colors=(1 3 2 2)

function led() {
    color=${colors[$RANDOM % ${#colors[@]}]}
    tput setaf $color
    tput cup $1 $(($l+$2))
    echo '*'
}

LIGHTS=()

for ((col=9; col<28; col+=2))
{
    LIGHTS+=("5 $col")
}

for row in 7 11 13 17 19 23 25 29 31 35; do
    for ((col=13; col<34; col+=2))
    {
        LIGHTS+=("$row $col")
    }
done

for row in 38 39 40 41 42; do
    for ((col=18; col<38; col+=2))
    {
        LIGHTS+=("$row $col")
    }
done

while [ true ]; do
    mapfile -t LIGHTS < <(shuf -e "${LIGHTS[@]}")

    for ((i=0; i<${#LIGHTS[@]}; i++))
    {
       led ${LIGHTS[$i]}
    }
    
    sleep 0.1
done

