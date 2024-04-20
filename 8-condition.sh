#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 10 ]
then 
    echo "given number is grater then 10"
else 
    echo "given number is less then 10"
fi

if [ NUMBER -lt 10]
then 
   echo "given number is less then 10"
else
   echo "given number is grater then 10"
fi

echo " number of variable passed $#"