#!/bin/bash
DISKUSAGE=$(df -hT |grep xfs)
DISK_THRESHOLD=5 # real project, we monitor for 70
MSG=""
while read -r line
do
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)  # -F here is filed separator.
  PARTITION=$(echo $line | awk -F " " '{print $NF}')
  if [ $USAGE -ge $DISK_THRESHOLD ] 
   then 
      MSG+="High disk usage on partition: $PARTITION; Usage is: $USAGE
      #echo "partiiton:$PARTITION; Usage:$USAGE"
  fi
  done <<<$DISKUSAGE