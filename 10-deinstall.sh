#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then 
    echo " you are not super user please use root crediantional"
    exit 1
else
    echo "you are super user"

dnf remove mysql -y 

if [ $? -ne 0]
then 
    echo " deinstalation of your mysql..failed"
    exit 1
then 
    echo " deinstalation of your mysql...success"
fi 