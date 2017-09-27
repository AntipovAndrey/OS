#!/bin/bash

trashPath=${HOME}"/.trash"
logPath=${HOME}"/.trash.log"

if [[ ! -d "$trashPath" ]] ; then
    echo "Trash dir does not exist"
    exit
fi
allLog="$(grep -E "/"${1}"\:[0-9]+$" "$logPath")"
for LINE in $allLog
do
    filePath="$(echo "$LINE" | cut -d : -f 1)"
    fileName="$(basename "$filePath")"
    fileDir="$(dirname "$filePath")"
    trashName="$(echo "$LINE" | cut -d : -f 2)"
    echo -e "Do you want to restore \033[4m$filePath\033[0m [\033[1mY\033[0m/n]?"
    read USERINPUT
    if [[ "$USERINPUT" == "n" || "$USERINPUT" == "N" ]]
    then
        echo "File won't be restored"
        newLog=${newLog}${LINE}"\n"
    else
        if [[ -f "$filePath" || ! -d "$fileDir" ]]
        then
            echo -e "Can not restore this file to old dir, do you want to restore it to home? [\033[1mY\033[0m/n]"
            read USERINPUT
            if [[ "$USERINPUT" != "n" && "$USERINPUT" != "N" ]] 
            then
                if [[ -f "$HOME/$fileName" ]] 
                then
                   echo -e "There is file with same name, add id to file name, or pass it? [\033[1mY\033[0m/n]"
                   read USERINPUT
                   if [[ "$USERINPUT" != "n" && "$USERINPUT" != "N" ]] 
                   then
                      id="$(echo "$LINE" | grep -oP '[0-9]+$')"
                      ln "$trashPath/$trashName" "$HOME/$fileName${id}" && echo -e "File $fileName \033[32mwas\033[0m restored in home dir with name \033[4m$fileName${id}\033[0m"
                       rm "$trashPath/$trashName"
                   else
                        newLog=${newLog}${LINE}"\n"                 
                    fi
                else
                   ln "$trashPath/$trashName" "$HOME/$fileName" && echo -e "File $fileName \033[32mwas\033[0m restored in home dir"
                   rm "$trashPath/$trashName"
                fi  
            else
                newLog=${newLog}${LINE}"\n"           
            fi          
        else
            ln "$trashPath/$trashName" "$filePath" && echo -e "File $filePath \033[32mwas\033[0m restored" || echo -e "File $filePath \033[31mwasn't\033[0m restored!"
            rm "$trashPath/$trashName"
        fi
    fi
done
echo -e "$newLog" > "$logPath"
