USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "you are not a superuser please use root access"
else 
    echo "you are a superuser"
fi 


echo "all variables $@"