#!/bin/bash 

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"


if [ $USERID -ne 0 ]
then
    echo -e " $R Error::$N You must have root access to execute script"
    exit 1
fi


dnf list installed mysql 
if [ $? -ne 0 ]
then
    dnf install mysql -y 
    if [ $? -ne 0 ]
    then 
        echo "installing Mysql ... Failure"
    else
        echo "Installing mysql ... Success"
    fi 
else
    echo "Mysql is Already ... Installed"
fi 


dnf list installed git 
if [ $? -ne 0 ]
then
    dnf install mysql -y 
    if [ $? -ne 0 ]
    then 
        echo "installing Git ... Failure"
    else
        echo "Installing Git ... Success"
    fi 
else
    echo "Git is Already ... Installed"
fi 