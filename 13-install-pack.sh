USERID=$(id -u)
TIMESTAME=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAME.log

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


for i in $@
do 
   echo "package to install: $i"
   dnf list installed $i &>>$LOGFILE
done 