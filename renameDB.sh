#!/bin/bash

if [[ -d ./DataBase/$currentName ]]; then
    newName=$(whiptail --title "Rename Database" --inputbox "Enter Database New Name: " 8 45 3>&1 1>&2 2>&3)
    if [[ -d ./DataBase/$newName ]]; then
        whiptail --title "Rename Database Message" --msgbox "Cannot Rename Database, $dbName Already Exists" 8 45
    else
        if [[ $newName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
            mv ./DataBase/$currentName ./DataBase/$newName
            whiptail --title "Rename Database Message" --msgbox "Database Renamed Successfully" 8 45
        else
            whiptail --title "Rename Database Message" --msgbox "Database Name Validation Error" 8 45
        fi
    fi
else
    whiptail --title "Rename Database Message" --msgbox "Database Doesn't Exist" 8 45
fi
