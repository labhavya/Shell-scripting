#!/bin/bash
DISKUSAGE=$(df -hT |grep xfs)
while read -r line
do
  echo $line
done <<<$DISKUSAGE