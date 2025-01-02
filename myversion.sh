#!/bin/bash
USER=$(id -u)
if [ $USER -ne 0 ]
then 
    echo "ERROR:: user doens't have permission to install"
    exit 1
fi 
INSTALL() {
dnf list installed $1
if [ $? -ne 0 ]
then
    dnf install $1 -y
     VALIDATE $? $1
else
    echo "$1 is already installed"
}
VALIDATE() {
    if [ $2 -eq 0 ]
    then 
        echo "$3 install is success"
        
    else 
        echo "$3 install is failed"
        exit 1
    fi
}

