#!/bin/bash

columnName=$(whiptail --title "Table Records" --inputbox "Enter Column Name" 8 45 3>&1 1>&2 2>&3)
checkColumnFound=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$columnName'") print i}}}' ./DataBase/$dbName/$tableName)
if [[ $checkColumnFound == "" ]]; then
    whiptail --title "Error Message" --msgbox "Column doesn't exist" 8 45
else
    value=$(whiptail --title "Column Record" --inputbox "Enter Value To Search For" 8 45 3>&1 1>&2 2>&3)
    record=$(awk 'BEGIN{FS="|"}{if ($'$checkColumnFound'=="'$value'")  print $0}' ./DataBase/$dbName/$tableName)
    if [[ $record == "" ]]; then
        whiptail --title "Error Message" --msgbox "Record not found" 8 45
    else
        whiptail --title "Record" --msgbox "$record" 15 45
    fi
fi
