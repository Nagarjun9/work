#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 10 ]
then 
    echo "given number is grater then 10"
else 
    echo "given number is less then 10"
fi

if [ $NUMBER -lt 10 ]
then 
   echo "given number is less then 10"
else
   echo "given number is grater then 10"
fi

if [ $NUMBER -eq 10 ]
then 
   echo "give number is equal to 10"
else
   echo "give number is not equal to 10"
fi 

if [ $NUMBER -ge 10 ]
then 
   echo "give number grater then equal to 10"
 else 
   echo "give number not grater then equal to 10"
fi

if [ $NUMBER -le 10 ]
then 
   echo "give number less then equal to 10"
else 
   echo "give number not less then equal to 10"
fi 

echo " number of variable passed $#"