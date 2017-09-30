#!/bin/bash

currentDate="$(date +"%F")"
currentDateSec="$(date +"%s")"

lastBackup="$(ls "$HOME" -l | grep -E '^d.*Backup-[0-9]{4}\-[0-9]{2}\-[0-9]{2}$' | awk {'print $NF'} | sort -r -k2 | head -1 )"
lastBackupInSec="$(date -d "$(echo "$lastBackup" | grep -oP '[0-9]{4}\-[0-9]{2}\-[0-9]{2}')" +"%s")"

let difference=($currentDateSec-$lastBackupInSec)/60/60/24

echo "$difference"
isCreated=false
if [[ "${#lastBackup}" -lt 8 || "$difference" -gt 7 ]]
then
    currentBackup="Backup-$currentDate"
    mkdir "$HOME/$currentBackup"
    isCreated=true
    echo "Backup directory $HOME/$currentBackup was created" >> "$HOME/backup-report"
    
else
    echo "Backup directory $HOME/$currentBackup was updated at $currentDate" >> "$HOME/backup-report"
    currentBackup="$lastBackup"
fi

echo "$currentBackup"

if $isCreated
then
    cd "$HOME/source"
    while read -r FILE 
    do
        FILE="$(echo "$FILE" | grep -oP '[^\.\/].*')"
        if [[ ${#FILE} -eq 0 || -d $FILE ]] ; then 
             continue
        fi
        cp --parent $FILE "$HOME/$currentBackup" > /dev/null 2> /dev/null && echo "+ $FILE" >> "$HOME/backup-report" || echo "! $FILE" >> "$HOME/backup-report"
        echo "$FILE"
    done <<< "$(find -L)"
else
    cd "$HOME/source"
    while read -r FILE 
    do
        FILE="$(echo "$FILE" | grep -oP '[^\.\/].*')"
        if [[ ${#FILE} -eq 0 || -d $FILE ]] ; then 
             continue
        fi
        if [[ ! -f "$HOME/$currentBackup/$FILE" ]]
        then
        cp --parent $FILE "$HOME/$currentBackup" > /dev/null 2> /dev/null && echo "+ $FILE" >> "$HOME/backup-report" || echo "! $FILE" >> "$HOME/backup-report"
        else
            if [[ "$(wc -c "$FILE" | awk '{print $1}')" -ne "$(wc -c "$HOME/$currentBackup/$FILE" | awk '{print $1}')" ]]
            then
                mv "$HOME/$currentBackup/$FILE" "$HOME/$currentBackup/$FILE.$currentDate"
                cp --parent $FILE "$HOME/$currentBackup" > /dev/null 2> /dev/null && echo "* $FILE | $FILE.$currentDate" >> "$HOME/backup-report" || echo "! $FILE" >> "$HOME/backup-report"
            fi
        fi

    done <<< "$(find -L)"
fi




















