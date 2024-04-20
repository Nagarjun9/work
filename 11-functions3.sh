#1/bin/bash

USERID=$(id -u)

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2...failed"
        exit 1
    else 
        echo "$2---success"
}

if [ $USERID -ne 0 ]
then 
    echo " you are not a super user please use root crediantials"
    exit 1
else 
    echo " you are superuser"
fi 

dnf install mysql -y 
VALIDATION $? "Instalation of mysql"
 
