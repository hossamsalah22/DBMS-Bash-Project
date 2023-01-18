#!/bin/bash

function mainMenu() {

  mainMenu=$(whiptail --title "BDMS Menu" --fb --menu "Choose an option" 15 60 4 \
    "1" "Select Database" \
    "2" "Create Database" \
    "3" "Rename Database" \
    "4" "Drop Database" \
    "5" "Display Databases" \
    "6" "Exit" 3>&1 1>&2 2>&3)

  case $mainMenu in
  1)
    mainMenu
    ;;
  2)
    echo "Create Database"
    dbName=$(whiptail --title "Create DataBase" --inputbox "Enter Database Name: " 8 45 3>&1 1>&2 2>&3)
    . ./createDB.sh
    mainMenu
    ;;
  3)
    echo "Rename Database"
    currentName=$(whiptail --title "Rename DataBase" --inputbox "Enter Database Current Name: " 8 45 3>&1 1>&2 2>&3)
    newName=$(whiptail --title "Rename DataBase" --inputbox "Enter Database New Name: " 8 45 3>&1 1>&2 2>&3)
    . ./renameDB.sh
    mainMenu
    ;;
  4)
    echo "Delete Database"
    dbName=$(whiptail --title "Delete DataBase" --inputbox "Enter Database Name: " 8 45 3>&1 1>&2 2>&3)
    . ./dropDB.sh
    mainMenu
    ;;
  5)
    dataBasse=$(ls ./DataBase)
    whiptail --title "List of DataBases" --msgbox "$dataBasse" 30 45
    mainMenu
    ;;
  6)
    exit
    ;;
  esac
}
mainMenu
