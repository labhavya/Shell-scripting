#!/bin/bash
USER=$(id -u)
if [ $USER -ne 0 ]
then 
    echo "ERROR:: user doens't have permission to install"
    exit 1
fi 
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo "$2  success"
        
    else 
        echo "$2 failed"
        exit 1
    fi
}
dnf list installed | grep mysql-server
if [ $? -ne 0 ]
then
    echo "going to install mysql.........."
    dnf install mysql-server -y
    VALIDATE $? "MYSQL INSTALL IS"
    
else
    echo "mysql is already installed"
fi
dnf list installed git
if [ $? -ne 0 ]
then
     echo "installing git"
     dnf install git -y
     VALIDATE $? "GIT INSTALL IS"
else
    echo "git is already installed"
fi