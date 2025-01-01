#!/bin/bash
USERID=$(id -u)
if ( $USERID -ne 0 )
then
     echo "ERROR:: you must have sudo access to execute this script"
     exit 1 #other than 0
fi
dnf install mysqll -y
if [ $? -ne 0 ]
then 
    echo "installing mysql .....Failure"
    exit 1
else
    echo "installing mysql ....Success"
fi

dnf install git -y

if [ $? -ne 0]
then
     echo "installing Git ......Failure"
     exit 11
else
    echo "installing Git ........Success"
fi
