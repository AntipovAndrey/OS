#!/bin/bash
startDir=$PWD
cd /etc
emails="$(cat $(ls -l | grep '^-r..r..r' | awk '{ print $NF }') | awk '{print $0}' | tr ' ' '\n' | grep -a -oP '[a-zA-Z][a-zA-Z0-9\.\_\-]*\@[a-zA-Z0-9\.\_\-]*\.[a-zA-Z]+' | tr '\n' ',')" 
echo "$emails" > ${startDir}/emails.lst
echo "$emails"
cd $startDir
