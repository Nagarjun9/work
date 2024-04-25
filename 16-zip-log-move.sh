#!/bin/bash 

#SOURCE_DIRECTORY=/tmp/app_dir
#$TARGET_DIRECTORY=/tmp/app_dir/zip-move

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
   mv *.gz *.gz-$TIMESTAME  &>>$LOGFILE
done <<<$FILE 

FILE1=$(find $SOURCE_DIRECTORY -name "*.gz*" -mtime +14)

while IFS= read -r line 
do 
  echo -e "$Y move the files: $line to $FIND_LOCATION $N" &>>$LOGFILE 
  mv $line $FIND_LOCATION  &>>$LOGFILE
done <<<$FILE1 

#LOCATION=$(find / -type d -iname "zip-move")