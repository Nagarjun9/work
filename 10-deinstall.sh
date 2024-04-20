#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "your are not a superuser please run root user"
    exit 1
else
    echo "you are a super user"
fi

dnf remove mysql -y

if [ $? -ne 0 ]
then 
    echo "deinstalation of mysql...failed"
    exit 1
else 
    echo "deinstalation of mysql...success"