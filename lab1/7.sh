#!/bin/bash
max=$1
avg=$2
min=$3
cur=0
if [[ $max -lt $avg ]]
  then
    cur=$max
    max=$avg
    avg=$cur
fi

if [[ $min -ge $max ]]
  then
    echo "$min $max $avg"
  else
    if [[ $min -ge $avg ]]
      then
        echo "$max $min $avg"
      else
        echo "$max $avg $min"
    fi
fi


