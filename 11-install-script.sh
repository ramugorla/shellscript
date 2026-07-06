#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: You must have root access to execute script"
    exit 1
fi


dnf install mysql -y 
if [ $? -ne 0 ]
then
    echo "Installing Mysql ... Failure"
else
    echo "Installing Mysql ... Success"
fi 

dnf install git -y 
if [ $? -ne 0 ]
then
    echo "Installing Mysql ... Failure"
else
    echo "Installing Mysql ... Success"
fi