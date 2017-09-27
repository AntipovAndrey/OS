#!/bin/bash
currentDir=$PWD
cd /proc
pids="$(ls --format single-column | grep -E '^[0-9]+')"
for pid in $pids
do
        if [[ ! -d "$pid" ]] 
        then
            continue
        fi
    ppid="$(cat ${pid}/status | grep -E '^PPid' | cut -f2)"
    slpavg="$(cat ${pid}/sched | grep avg_atom | grep -oP '[^\ ]*$')"
    preparedString="ProcessID="${pid}" : Parent_ProcessID="${ppid}" : Average_Sleeping_Time="${slpavg}"\n"
    result=${result}$preparedString
done
echo -e "$result"| sort --field-separator='=' -n -k 3 | tail -n +2 > ${currentDir}/5.out

