#!/bin/bash
USER=$(id -u)
if [ $USER -ne 0 ]
then 
    echo "ERROR:: user doens't have permission to install"
    exit 1
fi 
RESULT=$(dnf list installed | grep mysql)
echo "$RESULT"