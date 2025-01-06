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
   echo -e " $R SOURCEDIR $SOURCEDIR.. $N doesn't exists"
   exit 1
fi

if [ ! -d $DESTDIR ]
   then
   echo -e " $R DestinationDIR $DESTDIR.. $N doesn't exists"
   exit 1
fi