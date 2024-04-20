#1/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
FILENAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$FILENAME-$TIMESTAMP.log



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
    echo " you are not a super user please use root crediantials"
    exit 1
else 
    echo " you are superuser"
fi 

dnf install mysql -y &>>$LOGFILE
VALIDATION $? "Instalation of mysql" 
 
