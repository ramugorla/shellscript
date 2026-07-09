#!/bin/bash 

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESSHOLD=5

while read -r line
do 
    USAGE=$(echo $line | awk -F " " '{print $6F}')
    PARTION=$(echo $line | awk -F " " '{print $NF}')
    echo "Partion is $PARTION, and Usage is $USAGE"

done <<< $DISK_USAGE