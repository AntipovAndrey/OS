#!/bin/bash
data="$(cat 5.out)"
counter=1
lastPpid=-1
avgSum=1.0 
while read -r line 
do
    ppid="$(echo \"$line\" | cut -d = -f3 | grep -oP '^[0-9]+')"
    if [[ $ppid -ne $lastPpid ]]
    then
        avg="$(echo "$avgSum $counter" | awk '{ printf("%.6f",$1/$2) }')"
        result=${result}"Average_Sleeping_Children_of_ParentID="${lastPpid}" is "${avg}"\n"
        counter=1
	avgSum=0     
    else
        let counter=$counter+1
    fi
    result=${result}$line"\n"
    lastPpid=$ppid
    avgSum="$(echo "$avgSum "$(echo $line | cut -d = -f4)"" | awk '{ print($1+$2) }')"
done <<< "$data"
result=${result}"Average_Sleeping_Children_of_ParentID="${lastPpid}" is "${avgSum}"\n"
echo -e "$result" | tail -n +2 > 6.out

