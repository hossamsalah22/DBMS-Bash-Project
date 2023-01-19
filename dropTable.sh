#!/bin/bash

if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    if [[ -f ./DataBase/$dbName/$tableName ]]; then
        if (whiptail --title "Are You Sure?" --yesno "Are You Sure You want to delete $tableName Table?" 8 45); then
            rm ./DataBase/$dbName/$tableName
            whiptail --title "Delete Table Message" --msgbox "Table Deleted!" 8 45
        else
            whiptail --title "Delete Table Message" --msgbox "You Canceled" 8 45
        fi
    else
        whiptail --title "Delete Table Message" --msgbox "Table $tableName Doesn't Exist" 8 45
    fi
fi
