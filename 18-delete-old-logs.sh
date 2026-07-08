#!/bin/bash 



SOURCE_DIR="/home/ec2-user/app-logs"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"


echo "$LOG_FILE_NAME"

mkdir -p $SOURCE_DIR


FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)



while read -r files
do 
    echo "Files to be deleted:: $files"
    rm -rf $files
    echo "Files deleting:: $files

done <<< $FILES



