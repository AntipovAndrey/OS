#!/bin/bash

mode="add"
val=1

(tail -n 0 -f data.txt) | while true
do
    read line;
    case "$line" in
        +)
            mode="add"
            ;;
        [*])
            mode="mul"
            ;;
        [0-9]*)
            if [[ $mode == "add" ]] ; then
                let val=$val+$line    
            else
                let val=$val*$line
            fi
            ;;
        "QUIT")
            echo "Script stopped, result is $val"
            killall tail
            exit
            ;;
        *)
            echo "Wrong input"
            killall tail
            exit 1
            ;;
        esac
done
