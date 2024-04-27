#!/bin/bash 

#direct directory give and gip the files, move the files 
SOURCE_DIRECTORY=/tmp/app_dir
TARGET_DIRECTORY=/tmp/app_dir/zip-move


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"

TIMESTAME=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAME.log


if [ -d $SOURCE_DIRECTORY ]
then
   echo "you source directory exits"
else 
   echo " you need to create the directory "
fi 

FILE=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while IFS= read -r line 
do 
  #echo "Deleting file: $line"
#  rm -rf $line  # remove the file 
   echo -e "$G gziping file: $line $N" &>>$LOGFILE
   gzip $line &>>$LOGFILE #gzip the file 
   
done <<<$FILE 

FILE1=$(find $SOURCE_DIRECTORY -name "*.gz*" -mtime +14)

while IFS= read -r line 
do 
  echo -e "$Y move the files: $line to $TARGET_DIRECTORY $N" &>>$LOGFILE 
  mv $line $TARGET_DIRECTORY  &>>$LOGFILE
done <<<$FILE1 

#LOCATION=$(find / -type d -iname "zip-move")

#echo "$LOGFILE"   | mail -s "zip file info" nagarjun676@gmail.com  <$LOGFILE

 mutt -a "/tmp/$LOGFILE" -s "zip logfile" -- nagarjun676@gmail.co

#$ echo "Message body" | mutt -a "/path/to/file.to.attach" -s "subject of message" -- email_address

#$ echo "Message body" | mutt -a "/tmp/16-zip-log-move-2024-04-27-09-39-59.log" -s "attachedfile" -- nagarjun676@gmail.com 

#mail -s "zip file info" nagarjun676@gmail.com  <$LOGFILE

 #mutt -s "Test Email" nagarjun676@gmail.com < /dev/null 


#==========================================

#location to find & zip the files , move the zip the file to diffrent location  

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "you are not a super user please use root access"
else 
    echo "you are a superuser"
fi 



SOURCE_LOCATION=$(find / -type d -iname "app_dir") 
FIND_LOCATION=$(find / -type d -iname "zip-move") # find the location of zip-move folder 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"

TIMESTAME=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAME.log


if [ -d $SOURCE_DIRECTORY ]
then
   echo "you source directory exits"
else 
   echo " you need to create the directory "
fi 

FILE=$(find $SOURCE_LOCATION -name "*.log" -mtime +14)

while IFS= read -r line 
do 
  #echo "Deleting file: $line"
#  rm -rf $line  # remove the file 
   echo -e "$G gziping file: $line $N" &>>$LOGFILE
   gzip $line &>>$LOGFILE #gzip the file 
   
done <<<$FILE 

FILE1=$(find $SOURCE_LOCATION -name "*.gz*" -mtime +14)

while IFS= read -r line 
do 
  echo -e "$Y move the files: $line to $FIND_LOCATION $N" &>>$LOGFILE 
  mv $line $FIND_LOCATION  &>>$LOGFILE
done <<<$FILE1 

echo "$LOGFILE"   | mail -s "zip file info" nagarjun676@gmail.com

#LOCATION=$(find / -type d -iname "zip-move")