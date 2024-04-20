USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
#R="\e[31m"
#G="\e[32m"
#N="\e[0m"
R="\e[31m"
G="\e[32m"
N="\e[0m"


VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2..$R failed $N"
        exit 1
    else 
        echo -e "$2..$G success $N"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo -e  "you are not a $G superuser $N please use $R root $N crediantails"
    exit 1
else
    echo -e "you are a $G super user $N"
fi

dnf remove mysql -y &>>LOGFILE
VALIDATION $? "deinstalation of mysql"

dnf remove git -y &>>LOGFILE
VALIDATION $? "deinstalation of git"

dnf install mysql -y &>>LOGFILE
VALIDATION $? "instalation of mysql"

dnf install git -y &>>LOGFILE
VALIDATION $? "instalation of git"




