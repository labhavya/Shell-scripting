#!/bin/bash
USER=$(id -u)
if [ $USER -ne 0 ]
then 
    echo "ERROR:: user doens't have permission to install"
    exit 1
fi 
INSTALLATION () 
{
        dnf list installed $1
        if [ $? -ne 0 ]
        then
            dnf install $1 -y
            VALIDATE $? $1
        else
            echo "$1 is already installed"
        fi
}
VALIDATE() 
{
    if [ $1 -eq 0 ]
    then 
        echo "$2 install is success"
        
    else 
        echo "$2 install is failed"
        exit 1
    fi
}
INSTALLATION $1

