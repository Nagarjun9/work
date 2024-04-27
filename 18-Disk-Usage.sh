#!/bin/bash 



DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, Current usage: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "Disk Usage Alert" nagarjun67@gmail.com 

# echo "body" | mail -s "subject" to-address

DISKSPACE=$(df -hT | grep xfs)
DISK_THROSHOLD=6
MASSAGE=""

while IFS= read -r line 
do 
  USAGE=$(echo $line | awk -F " " '{print $6F}')
  FOLDER=$(echo $line | awk -F " " '{print $NF}')
  if [ $USAGE -ge $DISK_THROSHOLD ]
  then 
      MASSAGE+="$FOLDER is more then $DISK_THROSHOLD, Current usage: $USAGE \n"
  fi 
done <<$DISKSPACE

echo -e "Massage usage: $MASSAGE

echo "$MASSAGE" | mail -s "Diskusage" nagarjun67@gmail.com 
###

