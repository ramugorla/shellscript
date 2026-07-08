#!/bin/bash 


SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

USAGE(){
    echo "sh 20-backup.sh <SOURCE_DIT> <DEST_DIR> <DAYS(Optional)>"
    exit 1
}

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

if [ $# -ne 2 ]
then
    USAGE
fi 

if [ ! -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR does not exist ... please check"
fi 

if [ ! -d $DEST_DIR ]
then 
    echo "$DEST_DIR does not exist ... please check"
fi 