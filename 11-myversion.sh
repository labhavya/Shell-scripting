#!/bin/bash
USER=$(id -u)
if [ USER -ne 0 ]
then 
    echo "ERROR:: user doens't have permission to install"
    exit 1
dnf install mysql -y
if [ $? -ne 0 ]
then
    echo " ERROR:: mysql installation failed...................."
else
    echo "mysql installation successful......"
fi