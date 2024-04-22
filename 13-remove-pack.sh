USERID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAME=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAME.log




VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2...failed"
    else 
        echo "$2...succes"
    fi  
}


if [ $USERID -ne 0 ]
then 
    echo "you are not a supper user please user root crediantials"
else 
    echo "you are a super user"
fi 


for i in $@
do 
   echo "need to remove: $i"
   dnf list installed $i -y &>>$LOGFILE
   if [ $? -eq 0 ]
   then 
        dnf remove $i -y &>>$LOGFILE
        VALIDATION $? "removeing of $i"
    else 
        echo "$i alredy removed" 
    fi 
done 