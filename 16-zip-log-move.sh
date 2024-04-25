#!/bin/bash 

SOURCE_DIRECTORY=/tmp/app_dir
$TARGET_DIRECTORY=/tmp/app_dir/zip-move

FIND_LOCATION=$(find / -type d -iname "zip-move") $>>LOCATION

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"


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
   echo "gziping file: $line"
   gzip $line  #gzip the file 
done <<<$FILE 

FILE1=$(find $SOURCE_DIRECTORY -name "*.gz" -mtime +14)

while IFS= read -r line 
do 
  echo "move the files: $line"
  mv $line $LOCATION
done <<<$FILE1 

#LOCATION=$(find / -type d -iname "zip-move")