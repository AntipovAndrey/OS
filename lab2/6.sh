#!/bin/bash
startDir=$PWD
cd /var/log
parsedData="$(wc -l $(ls -l | grep '^-r..r.*\.log$' | awk '{ print $NF }') | grep -oP '[0-9]+' | tail -n1)"
echo "$parsedData"
cd $startDir
