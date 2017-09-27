#!/bin/bash

trashPath=${HOME}"/.trash"
logPath=${HOME}"/.trash.log"
fileId=${trashPath}"/.id"
if [[ ! -d "$trashPath" ]] ; then
    mkdir "$trashPath"
    echo "1" > "$fileId"
fi

let newId="$(cat "$fileId")"+1

echo "$newId" > "$fileId"

ln "$1" ${trashPath}"/"${newId}

echo "${PWD}/${1}:$newId" >> "$logPath"
rm "$1"
