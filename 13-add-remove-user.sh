#!/bin/bash 

USERID=$(id -u)
TIMESTAME=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAME.log 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2...failed"
    else 
        echo "$2...success"
    fi 
}


if [ $USERID -ne 0 ]
then 
    echo -e "$R you are not a superuser use root crediantials $N"
else 
    echo -e "$G you are a superuser $N"
fi 

for i in $@
do 
  echo -e "need to crate user:$G $i $N"
  id $i &>>$LOGFILE
  if [ $? -ne 0 ]
  then 
      useradd $i &>>$LOGFILE
      VALIDATION $? " $i user added"
  else 
      echo -e "$B user already exit...SKIPPING $N"
  fi 
done 
