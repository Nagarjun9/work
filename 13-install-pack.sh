USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "you are not a superuser please use root access"
else 
    echo "you are a superuser"
fi 


# echo "all variables $@" #if i give outside variables its show 

# now i need to loop the all vaiable use for loop 
for i in $@
do 
   echo "package to install: $i"
done 

