#1/bin/bash

USERID=$(id -u)
TIME=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIME.log


VALIDATION(){
         if [ $1 -ne 0 ]
         then 
             echo "$2...failed"
             exit 1
         else
             echo "$2...success"  
         fi   
}


if [ $USERID -ne 0 ]
then
    echo "you are not a super user please use root credeiantila"
    exit 1
else 
    echo "you are a super user"
fi 

dnf remove mysql -y &>>$LOGFILE
VALIDATION $? "deinstalation of mysql"

dnf remove git -y &>>$LOGFILE
VALIDATION $? "deinstalation of git"

dnf install mysql -y &>>$LOGFILE
VALIDATION $? "instalation of mysql"

dnf install git -y  &>>$LOGFILE
VALIDATION $? "instalation of git"

