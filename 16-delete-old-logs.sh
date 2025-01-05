#!/bin/bash


#set colours
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#setup log folder:

SOURCE_DIR="/home/ec2-user/app-logs"
mkdir -p /var/log/shellscript-logs
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 |cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

CHECK_ROOT()
{
   USERID=$(id -u)
   if [ $USERID -ne 0 ]
    then
        echo "user doesn't have root access"
        exit 1
    fi
}

VALIDATE(){
if [ $1 -eq 0 ]
   then
   echo -e "$2......$G success $N"
else
   echo -e "$2.......$R failed $N"
   exit 1
fi
}

echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Fiels to be deleted is:: $FILES_TO_DELETE" 

for everyfile in $FILES_TO_DELETE
do
   echo -e "deleting file $everyfile"
rm -rf $everyfile
done
