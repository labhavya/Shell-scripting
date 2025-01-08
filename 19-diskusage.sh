#!/bin/bash
DISKUSAGE=$(df -hT |grep xfs)
DISK_THRESHOLD=5 # real project, we monitor for 70
while read -r line
do
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" f1)  # -F here is filed separator.
  PARTITION=$(echo $line | awk -F " " '{print $NF}')
  
  echo "partiiton:$PARTITION; Usage:$USAGE"

  
done <<<$DISKUSAGE