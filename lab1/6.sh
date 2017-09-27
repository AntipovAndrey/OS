#!/bin/bash
if [[ $PWD == $HOME ]]
then echo "$PWD"
exit 0
else
echo "Error"
exit 1
fi
