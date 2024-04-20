#1/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
FILENAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$FILENAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"


VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2...failed"
        exit 1
    else 
        echo "$2---success"
    fi 
}

if [ $USERID -ne 0 ]
then 
    echo -e " $R you are not a super user please use root crediantials $N"
    exit 1
else 
    echo -e " $G you are superuser $N"
fi 

dnf install mysql -y &>>$LOGFILE
VALIDATION $? "Instalation of mysql" 
 
