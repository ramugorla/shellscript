#!/bin/bash 


SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

USAGE(){
    echo "sh 20-backup.sh <SOURCE_DIT> <DEST_DIR> <DAYS(Optional)>"
    exit 1
}

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}'| cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

if [ $# -lt 2 ]
then
    USAGE
fi 

if [ ! -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR does not exist ... please check"
    exit 1
fi 

if [ ! -d $DEST_DIR ]
then 
    echo "$DEST_DIR does not exist ... please check"
    exit 1
fi 


FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

echo "Files to be deleted:: $FILES"

if [ -n "$FILES" ]
then 
    echo "Files are :: $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo "Successfully created zip file for files older than $DAYS"
        while read -r files
        do 
            echo "Files to be deleted:: $files"
            rm -rf $files
            echo "Files deleting:: $files"

        done <<< $FILES
    else
        echo -e "$R Error:: $N Failed to create ZIP file "
        exit 1
    fi
else
    echo "No Files found older than $DAYS"
    exit 1
fi