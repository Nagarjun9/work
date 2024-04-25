#!/bin/bash 

SOURCE_DIRECTORY=/tmp/app_dir

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
  echo "Deleting file: $line"
  rm -rf $line 
done <<<$FILE 