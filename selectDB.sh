#!/bin/bash

if [[ -d ./DataBase/$dbName ]]; then
    whiptail --title "Connect to Database" --msgbox "Connected Successfully" 8 45
    tableMainMenu
else
    whiptail --title "Connect to Database" --msgbox "Database Doesn't Exist" 8 45
    mainMenu
fi
