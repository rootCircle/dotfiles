#!/bin/bash

# Intallation Script
# mkdir ~/Scripts && cp findAndcdIntoDir.sh ~/Scripts/
# Add alias ficd = 'source ~/Scripts/findAndcdIntoDir.sh' into your rc or config file of bash and enjoy

if [ -z "$1" ]
then 
    echo -n "Enter Project Name : " 
    read -r NAME
else
    NAME=$1
fi

output_dir_="$(fd --prune --type=d --max-results 1 $NAME ~/Documents/Coding)"
is_not_exist_output="${#output_dir_}"

if [ $is_not_exist_output -ne 0 ]
then
    \builtin cd "$output_dir_" || exit
else
    echo "No such Project Found"
fi
