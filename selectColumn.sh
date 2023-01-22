#!/bin/bash

columnName=$(whiptail --title "Table Records" --inputbox "Enter Column Name" 8 45 3>&1 1>&2 2>&3)
checkColumnFound=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$columnName'") print i}}}' ./DataBase/$dbName/$tableName)
if [[ $checkColumnFound == "" ]]; then
    whiptail --title "Error Message" --msgbox "Column doesn't exist" 8 45
else
    columnrecord=$(awk -F"|" '{print $"'$checkColumnFound'"}' ./DataBase/$dbName/$tableName)
    whiptail --title "Table Column Record" --msgbox "$columnrecord" 35 70
fi
