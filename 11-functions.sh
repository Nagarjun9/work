#1/bin/bash


VALIDATION(){
         if [ $1 -ne 0 ]
         then 
             echo "$2...failed"
             exit 1
         else
             echo "$2...success"  
         fi   
}

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "you are not a super user please use root credeiantila"
    exit 1
else 
    echo "you are a super user"
fi 

dnf install mysql -y 
VALIDATION $? "instalation of mysql"
