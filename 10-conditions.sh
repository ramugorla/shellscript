#!/bin/bash 

# Print the given number is even or odd 

NUMBER=$1
G="\e[32m"
N="\e[0m"
R="\e[31m"



if [ $(($NUMBER%2)) -eq 0 ]
then
    echo -e "Given number $NUMBER is $G EVEN $N"
else
    echo -e "Given number $NUMBER is $R ODD $N"
fi 

