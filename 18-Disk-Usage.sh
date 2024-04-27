#!/bin/bash 

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
