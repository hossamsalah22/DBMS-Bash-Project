#!/bin/bash

if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    if [[ -f ./DataBase/$dbName/$tableName ]]; then
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
    else
        whiptail --title "Table Records" --msgbox "Table Doesn't Exist" 8 45
    fi
else
    whiptail --title "Table Records" --msgbox "Table Name Doesn't Meet Minimum Requirements" 8 45
fi
