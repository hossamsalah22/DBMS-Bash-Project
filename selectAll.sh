#!/bin/bash

if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    if [[ -f ./DataBase/$dbName/$tableName ]]; then
        tableData=$(cat ./DataBase/$dbName/$tableName)
        whiptail --title "Table Records" --scrolltext --msgbox "$tableData" 35 70
    else
        whiptail --title "Table Records" --msgbox "Table Doesn't Exist" 8 45
    fi
else
    whiptail --title "Table Records" --msgbox "Table Name Doesn't Meet Minimum Requirements" 8 45
fi
