#!/bin/bash
echo "What do you want?"
echo "1) Start nano"
echo "2) Start vi"
echo "3) Start links"
echo "4) Exit"
input=0
read input
while [[ input -lt 1 || input -gt 4 ]]
do
echo "Incorrect input"
read input
done

case $input in
1)
/bin/nano
;;
2)
/usr/bin/vi
;;
3)
/usr/bin/links
;;
4)
exit 0
;;
esac
