#!/bin/bash 

USAGE=$(df -hT | grep xfs)

while read -r line
do 
    echo $line
done <<< $USAGE