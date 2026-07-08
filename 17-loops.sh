#!/bin/bash 

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOGS_FOLDER="/var/log/shell-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
LOGS_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
TIMESTAMP=$(date +%Y-%d-%m-%H-%M-%S)


mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ... Failure"
    else
        echo "$2 ... Success"
    fi 
}

if [ $USERID -ne 0 ]
then
    echo "you must have root access to execute this script"
fi 

for package in $@ 
do
    dnf list installed $package &>>$LOGS_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$LOGS_FILE_NAME
        VALIDATE $? "Installing $package"
    else
        echo "$package already ... installed"
    fi 
done



