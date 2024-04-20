USERID=$(id -u)

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2..failed"
        exit 1
    else 
        echo "$2..success"
    fi
}

if [ $USERID -ne 0]
then 
    echo "you are not a superuser please use root crediantails"
    exit 1
else
    echo "you are a super user"
fi

dnf remove mysql -y 
VALIDATION $? "deinstalation of mysql"

dnf remove git -y 
VALIDATION $? "deinstalation of git"

dnf install mysql -y
VALIDATION $? "instalation of mysql"

dnf install git -y 
VALIDATION $? "instalation of git"

