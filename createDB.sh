#!/bin/bash
if [[ $dbName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    if [[ -d ./DataBase/$dbName ]]; then
        whiptail --title "Create Databse Message" --msgbox "DataBase $dbName Already Exists" 8 45
    else
        mkdir ./DataBase/$dbName
        whiptail --title "Create Databse Message" --msgbox "DataBase $dbName sucessfully created" 8 45
    fi
else
    whiptail --title "Create Databse Message" --msgbox "DataBase Name Validation Error" 8 45
fi
