#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: You must have root access to execute script"
fi


dnf install mysqll -y 

dnf install git -y 
