#!/bin/bash 

USERID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAME=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAME.log
R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"



VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$R $2...failed $N"
    else 
        echo -e "$G $2...succes $N"
    fi  
}


if [ $USERID -ne 0 ]
then 
    echo -e "$R you are not a supper user please user root crediantials $N"
else 
    echo -e "$B you are a super user $N"
fi 


for i in $@
do 
   echo -e "need to remove:$G $i $N"
   dnf list installed $i -y &>>$LOGFILE
   if [ $? -eq 0 ]
   then 
        dnf remove $i -y &>>$LOGFILE
        VALIDATION $? "removeing of $i"
    else 
        echo -e  "$B $i alredy removed $N" 
    fi 
done 

#sudo sh 13-remove-pack.sh mysql python gcp
 #you are a super user
#need to remove: mysql
 #mysql alredy removed
#need to remove: python
 #python alredy removed
#need to remove: gcp
 #gcp alredy removed
