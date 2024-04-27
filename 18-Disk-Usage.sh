#!/bin/bash 



# echo "body" | mail -s "subject" to-address

DISKSPACE=$(df -hT | grep xfs)
DISK_THROSHOLD=6
MASSAGE=""

while IFS= read -r line 
do 
   USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 ) 
   FOLDER=$(echo $line | awk -F " " '{print $NF}')
   if [ $USAGE -ge $DISK_THROSHOLD ]
   then 
      MASSAGE+="$FOLDER is more then $DISK_THROSHOLD, Current usage: $USAGE \n"
  fi 
done <<<$DISKSPACE

echo -e "Massage usage: $MASSAGE"

echo "$MASSAGE" | mail -s "Diskusage" nagarjun676@gmail.com 
###


DISKUSGE=$(df -hT |grep xfs)
THROSHOULD=5
MASSAGE=""

while IFS= read line 
do 
   USAGE=$( echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
   FOLDER=$( echo $line | awk -F " " '{print $NF}')
  if [ $DISKUSAGE -ge $USAGE ]
  then 
      MASSAGE+="$FOLDER is more then $THROSHOULD, Current usage: $USAGE \n"
  fi
done <<<$DISKUSAGE

echo "$MASSAGE" | mail -s "Diskusage1" nagarjun676@gmail.com 