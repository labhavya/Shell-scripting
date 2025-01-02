#!/bin/bash
USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 |cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME
if [ $USER -ne 0 ]
then 
    echo "ERROR:: user doens't have permission to install"
    exit 1
fi 
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo -e "$2....$G success $N"
        
    else 
        echo -e "$2....$R failed $N"
        exit 1
    fi
}
dnf list installed | grep mysql-server
if [ $? -ne 0 ]
then
    echo "going to install mysql.........."
    dnf install mysql-server -y &>>$LOG_FILE_NAME
    VALIDATE $? "MYSQL INSTALL IS"
    
else
    echo -e "mysql is already ... $Y installed $N"
fi
dnf list installed git
if [ $? -ne 0 ]
then
     echo "installing git"
     dnf install git -y &>>$LOG_FILE_NAME
     VALIDATE $? "GIT INSTALL IS"
else
    echo -e "git is already... $Y installed $N"
fi