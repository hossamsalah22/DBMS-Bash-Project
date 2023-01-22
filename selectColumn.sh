#!/bin/bash

if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    if [[ -f ./DataBase/$dbName/$tableName ]]; then
        colname=$(whiptail --title "Table Records" --inputbox "Enter Column Name" 8 45 3>&1 1>&2 2>&3)
        checkcolumnfound=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$colname'") print i}}}' ./DataBase/$dbName/$tableName)
        if [[ $checkcolumnfound == "" ]]; then
            whiptail --title "Error Message" --msgbox "Column doesn't exist" 8 45
        else
            columnrecord=$(awk -F"|" '{print $"'$checkcolumnfound'"}' ./DataBase/$dbName/$tableName)
            whiptail --title "Table Column Record" --msgbox "$columnrecord" 35 70
        fi
    else
        whiptail --title "Table Records" --msgbox "Table Doesn't Exist" 8 45
    fi
else
    whiptail --title "Table Records" --msgbox "Table Name Doesn't Meet Minimum Requirements" 8 45
fi
