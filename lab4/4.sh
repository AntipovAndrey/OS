#!/bin/bash
taskset -c 1 ./script.sh > /dev/null &pid1=$!
taskset -c 1 ./script.sh > /dev/null &pid2=$!

sudo renice 7 $pid1 > /dev/null

echo "Enter any text to kill processes"
read kek

kill $pid1
kill $pid2


