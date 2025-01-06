R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 |cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
mkdir -p /home/ec2-user/shellscript-logs

SOURCEDIR=$1
DESTDIR=$2
DAYS=${3:-14}    # if user is not providing number of days, we are taking 14 as default
USAGE(){
       echo -e "$R USAGE:: $N..sh <sourcedir> <destdir> ,number of days (optional)"
       exit 1

}
if [ $# -lt 2 ]
   then
   USAGE
fi

if [ ! -d $SOURCEDIR  ]   # if soruce directory doesn't exist; -d $SOURCEDIR the source directory exists.
   then
   echo -e " $N SOURCEDIR $R $SOURCEDIR.. $N doesn't exists"
   exit 1
fi

if [ ! -d $DESTDIR ]
   then
   echo -e " $N DestinationDIR $R $DESTDIR.. $N doesn't exists"
   exit 1
fi

echo -e "$G Started $N executing the script at : $TIMESTAMP" &>>$LOG_FILE_NAME
FILES=$(find $SOURCEDIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ]  #true if there are files to zip
   then
        echo "printing files:: $FILES"
        ZIP_FILE="$DESTDIR/app-logs-$TIMESTAMP.zip"
        find $SOURCEDIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
            if [ -f "$ZIP_FILE" ]
            then
               echo -e "$G successfully $N created zip file"
               while read -r filepath
                do
                    rm -rf $filepath
                    echo "Deleted file:: $filepath
               done <<<$FILES
            else
               echo -e "$R FAILED ....$N to create ZIP file"
               exit 1
            fi
   else
        echo -e "no files found older than $R $DAYS"
        exit 1
fi