USERID=$(id -u)
TIMESTAME=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAME.log

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2...failed"
    else 
        echo "$2...success"
    fi 
}

if [ $USERID -ne 0 ]
then 
    echo "you are not a superuser please use root access"
else 
    echo "you are a superuser"
fi 


# echo "all variables $@" # 1st if i give outside variables its show 

# now i need to loop the all vaiables/parameters use for loop 
#for i in $@
#do 
 #  echo "package to install: $i"
#done 


#now we need to check package installed or not 


#for i in $@
do 
   echo "package to install: $i"
   dnf list installed $i &>>$LOGFILE
   if [ $? -eq 0 ]
   then 
       echo "$i alredy installed...SKIPPED"
    else 
       echo "$i need to installed"
       #dnf install $i -y >>$LOGFILE
       #VALIDATION $? "installlation of $i"
    fi 
done 