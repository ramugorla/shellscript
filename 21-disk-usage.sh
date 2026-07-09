#!/bin/bash 

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESSHOLD=5
MSG=""
while read -r line
do 
    USAGE=$(echo $line | awk -F " " '{print $6F}')
    PARTION=$(echo $line | awk -F " " '{print $NF}' | cut -d "%" -f1)
    echo "Partion is $PARTION, and Usage is $USAGE"
    if [ $USAGE -ge $DISK_THRESSHOLD ]
    then
        MSG="High Disk usage is $PARTION and Usage is $USAGE"
    fi

done <<< $DISK_USAGE

echo "Message:: $MSG"

