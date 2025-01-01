#!/bin/bash
USER=$(id -u)
if [ $USER -ne 0 ]
then 
    echo "ERROR:: user doens't have permission to install"
    exit 1
fi 
dnf list installed | grep mysql
if [ $? -ne 0 ]
then
    dns install mysql -y
    exit 1
else
    echo "mysql is already installed"
fi