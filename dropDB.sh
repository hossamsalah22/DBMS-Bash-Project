#!/bin/bash

if [[ $dbName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    if [[ -d ./DataBase/$dbName ]]; then
        if (whiptail --title "Are You Sure?" --yesno "Are You Sure You want to delete $dbName Database?" 8 45); then
            rm -r ./DataBase/$dbName
            whiptail --title "Delete Database Message" --msgbox "DataBase Deleted!" 8 45
        else
            whiptail --title "Delete Database Message" --msgbox "You Canceled" 8 45
        fi
    else
        whiptail --title "Delete Database Message" --msgbox "DataBase $dbName Doesn't Exist" 8 45
    fi
else
    whiptail --title "Delete Databse Message" --msgbox "DataBase Name Validation Error" 8 45
fi
