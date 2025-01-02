#!/bin/bash
USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
if [ $USER -ne 0 ]
then 
    echo "ERROR:: user doens't have permission to install"
    exit 1
fi 
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo -e "$2....$G success"
        
    else 
        echo -e "$2....$R failed"
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
    echo -e "mysql is already ... $Y installed"
fi
dnf list installed git
if [ $? -ne 0 ]
then
     echo "installing git"
     dnf install git -y
     VALIDATE $? "GIT INSTALL IS"
else
    echo -e "git is already... $Y installed"
fi