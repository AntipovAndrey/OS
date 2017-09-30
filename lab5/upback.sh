#!/bin/bash

lastBackup="$(ls "$HOME" -l | grep -E '^d.*Backup-[0-9]{4}\-[0-9]{2}\-[0-9]{2}$' | awk {'print $NF'} | sort -r -k2 | head -1 )"

if [[ "${#lastBackup}" -lt 8 ]]
then
    echo "Backup not found"
    exit 1
fi

cd "$HOME/$lastBackup"
while read -r FILE 
do
    FILE="$(echo "$FILE" | grep -oP '[^\.\/].*')"
    if [[ ${#FILE} -eq 0 || -d $FILE || $FILE =~ \.[0-9]{4}\-[0-9]{2}\-[0-9]{2}$ ]] ; then 
         continue
    fi
    echo "$FILE"
    cp --parent $FILE "$HOME/restore" > /dev/null 2> /dev/null
done <<< "$(find -L)"
