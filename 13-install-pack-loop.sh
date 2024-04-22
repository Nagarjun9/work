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
        echo -e "$R $2...failed $N"
    else 
        echo -e "$G $2...success $N"
    fi 
}

if [ $USERID -ne 0 ]
then 
    echo -e "$R you are not a superuser please use root access $N"
else 
    echo -e "$Y you are a superuser $N"
fi 


# echo "all variables $@" # 1st if i give outside variables its show 

# now i need to loop the all vaiables/parameters use for loop 
#for i in $@
#do 
 #  echo "package to install: $i"
#done 


#now we need to check package installed or not 


for i in $@
do 
   echo -e "$Y package to install: $i  $N"
   dnf list installed $i &>>$LOGFILE
   if [ $? -eq 0 ]
   then 
       echo -e "$G $i alredy installed...SKIPPED $N"
    else 
       #echo -e " $B $i need to installed $N"
       dnf install $i -y &>>$LOGFILE
       VALIDATION $? "installlation of $i"
    fi 
done 



#sudo sh 13-install-pack.sh  mysql git python
# you are a superuser
 #package to install: mysql
 #mysql alredy installed...SKIPPED
 #package to install: git
 #git alredy installed...SKIPPED
 #package to install: python
 # python need to installed
