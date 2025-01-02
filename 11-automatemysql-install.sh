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
dnf list installed git
if [ $? -ne 0 ]
then
     echo "installing git"
     dnf install git -y
     if [ $? -eq 0 ]
     then 
         echo "git installation is successfull"
    else
        echo  "git installation failed......................"
        exit 1
    fi
else
    echo "git is already installed"
fi