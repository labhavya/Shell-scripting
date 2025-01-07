#!/bin/bash
DISKUSAGE=$(df -hT |grep xfs)
while read -r line
do
  echo $line
  USAGE=$(echo $line | awk -F " " '{print $6F}')
  PARTITION=$(echo $line | awk -F " " '{print $NF}')
  echo "partiiton:$PARTITION; Usage:$USAGE"
done <<<$DISKUSAGE