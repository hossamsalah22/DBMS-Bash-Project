#!/bin/bash

if [[ $dbName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    if [[ -d ./DataBase/$dbName ]]; then
        whiptail --title "Connect to Database" --msgbox "Connected Successfully" 8 45
        tableMainMenu
    else
        whiptail --title "Connect to Database" --msgbox "Database Doesn't Exist" 8 45
        mainMenu
    fi
else
    whiptail --title "Connect to Database" --msgbox "DataBase Name Validaton Error" 8 45
fi
