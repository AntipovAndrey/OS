#!/bin/bash
clear
normal="\033[0m"
blue="\033[36m"
boldYellow="\033[1m\033[33m"

echo -e "$boldYellow 1: $normal"
echo -e "$blue ./1.sh hi bye $normal"
./1.sh hi bye
echo -e "$blue ./1.sh hey hey $normal"
./1.sh hey hey
echo ""
echo -e "$boldYellow 2: $normal"
echo -e "$blue ./2.sh 1 4 8 $normal"
./2.sh 1 4 8
echo -e "$blue ./2.sh -5 6 0 hey $normal"
./2.sh -5 6 0
echo ""
echo -e "$boldYellow 3: $normal"
echo -e "$blue ./3.sh $normal"
./3.sh
echo ""
echo -e "$boldYellow 4: $normal"
echo -e "$blue ./4.sh $normal"
./4.sh
echo ""
echo -e "$boldYellow 6: $normal"
echo -e "$blue ./6.sh $normal"
./6.sh
echo ""
echo -e "$boldYellow 5: $normal"
echo -e "$blue ./5.sh $normal"
./5.sh



