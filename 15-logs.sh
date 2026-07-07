#!/bin/bash 

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
 


LOGS_FOLDER="var/log/expense-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

echo "Script is executed at:: $TIMESTAMP" &>>$LOGS_FILE_NAME

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R Failure $N"
    else
        echo -e "$2 ... $G Success $N"
    fi 
}

if [ $? -ne 0 ]
then
    echo "You must have root access to execute this script"
    exit 1
fi

dnf list installed mysql &>>$LOGS_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOGS_FILE_NAME
    VALIDATE $? "Installing Mysql"
else
    echo -e "Mysql is already ... $Y Installed $N"
fi 

dnf list installed git &>>$LOGS_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOGS_FILE_NAME
    VALIDATE $? "Installing git"
else
    echo "git is already ... Installed"
fi 



