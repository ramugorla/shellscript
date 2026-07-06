#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Error: you must have root access"
    exit 1 
fi 


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ... Failure"
    else
        echo "$2 ... Success"
    fi
}


dnf list installed mysql 
if [ $? -ne 0 ]
then 
    dnf install mysql -y 
    VALIDATE $? "Installing Mysql"
else
    echo "Mysql is Already ... Installed"
fi 

dnf list installed git 
if [ $? -ne 0 ]
then 
    dnf install git -y 
    VALIDATE $? "Installing git"
else
    echo "git is Already ... Installed"
fi