#!/bin/bash
echo $$ > .pid
MODE="work"
onKill()
    {
        MODE="killed"
    }
trap 'onKill' SIGTERM
while true; do
    case $MODE in
        "work")
            let A=$A+1
            echo $A
            ;;
        "killed")
            echo "Process was killed bu SIGTERM"
            exit
            ;;
    esac
    sleep 1
done
