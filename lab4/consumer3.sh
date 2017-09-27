#!/bin/bash
echo $$ > .pid

result=1


onKill()
    {
       echo "Process was terminated by Higher Power"
       echo "Result is $result"
       exit
    }

usr1()
    {
       let result=$result+2
       echo "Result is $result"
    }

usr2()
    {
        let result=$result*2
        echo "Result is $result"
    }

trap 'onKill' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2

while true ; do
    sleep 1
done
