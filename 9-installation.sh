#!/bin/bash

#you user super user or not we need to check 
#previews commend success or not 
# if super user id -u give 0 if ofher then super user give other then 0
#if commend success its 0 echo "$?" if failer give number 

#i need install dnf install mysql -y 
#i need install dnf install git -y


USER=(id -u)

if [ $USER -ne 0 ]
then 
   echo "please run the script with root user"
   exit 1 # manualy exit
else 
   echo "you are a super user"
fi 

dnf install mysql -y 

if [ $? -ne 0 ]
then 
   echo "instalation of mysql...failer"
   exit 1
else 
   echo "instalation of mysql success"
fi 

dnf install git -y 

if [ $? -ne 0 ]
then 
   echo "instalation of git...failed"
else 
   echo "instalation of git...success"
fi
