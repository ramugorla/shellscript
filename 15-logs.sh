#!/bin/bash 

USERID=$(id -u)

if [ $? -ne 0 ]
then
    echo "You must have root access to execute this script"
    exit 1
fi 


LOGS_FOLDER="var/log/expense-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER
echo $LOG_FILE
echo $TIMESTAMP

