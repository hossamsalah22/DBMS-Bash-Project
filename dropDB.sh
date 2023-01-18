#!/bin/bash

# if [[ -d ./DataBase/$dbName ]]; then
#     rm -r ./DataBase/$dbName
#     whiptail --title "Delete Databse Message" --msgbox "DataBase Deleted!" 8 45
# else
#     whiptail --title "Delete Databse Message" --msgbox "DataBase $dbName Doesn't Exist" 8 45
# fi
if [[ -d ./DataBase/$dbName ]]; then
    if (whiptail --title "Are You Sure?" --yesno "Are You Sure You want to delete $dbName Database?" 8 45); then
        rm -r ./DataBase/$dbName
        whiptail --title "Delete Databse Message" --msgbox "DataBase Deleted!" 8 45
    else
        whiptail --title "Delete Databse Message" --msgbox "You Canceled" 8 45
    fi
else
    whiptail --title "Delete Databse Message" --msgbox "DataBase $dbName Doesn't Exist" 8 45
fi
