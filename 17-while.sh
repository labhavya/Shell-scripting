#/bin/bash
while read -r line
do
echo "$line"
done < 16-delete-old-logs.sh

echo "entering into second while loop"

FILE=16-delete-old-logs.sh
while read -r line
do
echo "$line"
done < "$FILE"