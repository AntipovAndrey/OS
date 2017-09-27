#!/bin/bash
startDir=$PWD
cd /var/log
parsedData="$(cat $(ls  -l | grep '^-r..r' | awk '{ print $NF }') | grep '')"
echo "$parsedData" > ${startDir}/errors.log
echo "$parsedData" | grep -E '\/[^ \*\"\>\<\?]*[^ \*\"\>\<\?]*\.[^ \*\"\>\<\?\.\/]+'
cd $startDir


