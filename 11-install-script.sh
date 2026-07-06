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


dnf install mysql -y 
if [ $? -ne 0 ]
then
    echo -e "Installing Mysql ... $R Failure $N"
else
    echo -e "Installing Mysql ... $G Success $N"
fi 

dnf install git -y 
if [ $? -ne 0 ]
then
    echo -e "Installing Git ... $R Failure $N"
else
    echo -e "Installing Git ... $G Success $N"
fi