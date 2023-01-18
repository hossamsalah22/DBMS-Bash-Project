#!/bin/bash

if [[ -d ./DataBase/$currentName ]]; then
    if [[ -d ./DataBase/$newName ]]; then
        whiptail --title "Rename Databse Message" --msgbox "Cannot Rename Database, $dbName Already Exists" 8 45
    else
        if [[ $newName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
            mv ./DataBase/$currentName ./DataBase/$newName
            whiptail --title "Rename Databse Message" --msgbox "Database Renamed Succesfully" 8 45
        else
            whiptail --title "Rename Databse Message" --msgbox "DataBase Name Validation Error" 8 45
        fi
    fi
else
    whiptail --title "Rename Databse Message" --msgbox "Database Does't Exist" 8 45
fi
