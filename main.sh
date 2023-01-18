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
    echo "Connect ro Database"
    dbName=$(whiptail --title "Connect to Database" --inputbox "Enter Database Name: " 8 45 3>&1 1>&2 2>&3)
    . ./selectDB.sh
    ;;
  2)
    echo "Create Database"
    dbName=$(whiptail --title "Create Database" --inputbox "Enter Database Name: " 8 45 3>&1 1>&2 2>&3)
    . ./createDB.sh
    mainMenu
    ;;
  3)
    echo "Rename Database"
    currentName=$(whiptail --title "Rename Database" --inputbox "Enter Database Current Name: " 8 45 3>&1 1>&2 2>&3)
    newName=$(whiptail --title "Rename Database" --inputbox "Enter Database New Name: " 8 45 3>&1 1>&2 2>&3)
    . ./renameDB.sh
    mainMenu
    ;;
  4)
    echo "Delete Database"
    dbName=$(whiptail --title "Delete Database" --inputbox "Enter Database Name: " 8 45 3>&1 1>&2 2>&3)
    . ./dropDB.sh
    mainMenu
    ;;
  5)
    dataBasse=$(ls ./DataBase)
    whiptail --title "List of Databases" --msgbox "$dataBasse" 30 45
    mainMenu
    ;;
  6)
    exit
    ;;
  esac
}

function tableMainMenu() {

  tableMainMenu=$(whiptail --title "Table Menu" --fb --menu "Choose an option" 15 60 4 \
    "1" "Create Table" \
    "2" "List Tables" \
    "3" "Drop Table" \
    "4" "Insert into Table" \
    "5" "Select From Table" \
    "6" "Delete From Table" \
    "7" "Update Table" \
    "8" "Back to Main Menu" \
    "9" "Exit" 3>&1 1>&2 2>&3)

  case $tableMainMenu in
  1)
    whiptail --title "Rename Database Message" --msgbox "Database Doesn't Exist" 8 45
    ;;

  2)
    whiptail --title "Rename Database Message" --msgbox "Database Doesn't Exist" 8 45
    ;;

  3)
    whiptail --title "Rename Database Message" --msgbox "Database Doesn't Exist" 8 45
    ;;

  4)
    whiptail --title "Rename Database Message" --msgbox "Database Doesn't Exist" 8 45
    ;;

  5)
    whiptail --title "Rename Database Message" --msgbox "Database Doesn't Exist" 8 45
    ;;

  6)
    whiptail --title "Rename Database Message" --msgbox "Database Doesn't Exist" 8 45
    ;;

  7)
    whiptail --title "Rename Database Message" --msgbox "Database Doesn't Exist" 8 45
    ;;

  8)
    cd ../../
    mainMenu
    ;;

  9)
    exit
    ;;
  esac
}

mainMenu
tableMainMenu
