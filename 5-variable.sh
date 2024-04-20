#1/bin/bash

# i am creating this file enter username & password

echo "please enter the Username"

read -s USERNAME  #we are giving the username

echo "please enter the Password" 

read -s PASSWORD  #we are giving password -s not visible 

echo "Username is: $USERNAME, Password is: $PASSWORD" #what are the password enter visbel to us i use echo 

#visble to password when enter the password 
echo "please enter the lockname"

read LOCKNAME

echo "please enter the Password"

read PASWORD 

echo "Lockname is: $LOCKNAME, Password is: $PASSWORD"