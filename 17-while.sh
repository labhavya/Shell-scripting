#/bin/bash
while read -r line
do
echo "$line"
done < 16-delete-old-logs.sh

echo "entering into second while loop"

SOURCE_DIR="/home/ec2-user/app-log"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Fiels to be deleted is:: $FILES_TO_DELETE" 
while read -r file
do
   echo "deleting file......$file"
   rm -rf $file
done <<< $FILES_TO_DELETE