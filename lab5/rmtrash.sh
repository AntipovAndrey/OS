#!/bin/bash

if [[ $# -eq 0 ]] ; then
	echo "Too few parameters"
	exit 1
fi

if [[ ! -f "$1" ]] ; then
	echo "File doesn't exist"
	exit 1
fi

fileToDel="$1"

echo "$fileToDel"

trashPath=${HOME}"/.trash"
logPath=${HOME}"/.trash.log"
fileId=${trashPath}"/.id"
if [[ ! -d "$trashPath" ]] ; then
    mkdir "$trashPath"
    echo "1" > "$fileId"
fi

let newId="$(cat "$fileId")"+1

echo "$newId" > "$fileId"

ln -- "./$fileToDel" ${trashPath}"/"${newId}

echo "${PWD}/${1}:$newId" >> "$logPath"
rm -- "./$fileToDel"
