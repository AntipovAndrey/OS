#!/bin/bash
inputString=""
outputString=""
read inputString
while [[ $inputString != "q" ]]
do
outputString=${outputString}$inputString
read inputString
done
echo "$outputString"
