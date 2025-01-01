#!/bin/bash
USER=$(id -u)
if [ $USER -ne 0 ]
then 
    echo "ERROR:: user doens't have permission to install"
    exit 1
fi 
dnf list installed | grep mysql-server
if [ $? -ne 0 ]
then
    echo "going to install mysql.........."
    dnf install mysql-server -y
    if [ $? -eq 0 ]
    then 
        echo "mysql installed successfully"
        exit 1
    else 
        echo "mysql installation failed"
        exit 1
    fi
else
    echo "mysql is already installed"
fi