#!/bin/bash
MSG="SCRIPT 1"
GREET="Hi from SCRIPT-1"
source 21-script2.sh
echo "Hello from: $MSG"

# sh 21-script2.sh  # in this case vairalbes can't be accessed form one script to other script.
