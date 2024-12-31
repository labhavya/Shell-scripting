#!/bin/bash

NUMBER1=$1
NUMBER2=$2
TIMESTAMP=$(date)   # PUT YOUR COMMAND INSIDE BRACES and preceed with $ to assign to a variable.
echo "script executed at: $TIMESTAMP"
SUM=$(($NUMBER1+$NUMBER2))
echo "Sum of 2 numbers $NUMBER1, $NUMBER2 is : $SUM"
