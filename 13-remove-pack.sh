USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "you are not a supper user please user root crediantials"
else 
    echo "you are a super user"
fi 


for i in $@
do 
   echo "need to install: $i"
done 