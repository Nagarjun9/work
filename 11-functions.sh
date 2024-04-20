#!/bin/bash 


VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2..Failed"
    else 
        echo "$2..success"
    fi 
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "you are not superuser please run the script with root user"
    exit 1
else 
    echo "you are a super user"
fi

dnf install mysql -y
VALIDATION $? "instalation of mysql"


if [ $? -ne 0 ]
then 
    echo "instlation on mysql...failed"
    exit 1
else 
    echo "instlation of mysql...success"
fi 
