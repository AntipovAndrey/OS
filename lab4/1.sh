#!/bin/bash

dirPath=${HOME}"/test"
reportPath=${HOME}"/report"
siteName="lolkek"
time="$(date +"%F_%R")"

mkdir "$dirPath" >/dev/null 2>&1 && { echo "catalog test was created successfully" > "$reportPath" ; touch ${dirPath}"/"${time}; } ; ping -c 1 $siteName >/dev/null 2>&1 || echo "Can not reach the server" >> $reportPath
