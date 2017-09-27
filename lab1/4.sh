#!/bin/bash
inputNum=0
counter=0
read inputNum
while [[ $(($inputNum % 2)) -eq 1 ]]
do
let counter=$counter+1
read inputNum
done
echo "$counter"
