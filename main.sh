#!/bin/bash

if [[ -d ./DataBase ]]; then
  echo "Welcome to Our System"
else
  mkdir ./DataBase
fi

function mainMenu() {

  mainMenu=$(whiptail --title "BDMS Menu" --fb --menu "Choose an option" 15 60 6 \
    "1" "Select Database" \
    "2" "Create Database" \
    "3" "Rename Database" \
    "4" "Drop Database" \
    "5" "Display Databases" \
    "6" "Exit" 3>&1 1>&2 2>&3)

  case $mainMenu in
  1)
    dbName=$(whiptail --title "Connect to Database" --inputbox "Enter Database Name: " 8 45 3>&1 1>&2 2>&3)
    . ./selectDB.sh
    mainMenu
    ;;
  2)
    dbName=$(whiptail --title "Create Database" --inputbox "Enter Database Name: " 8 45 3>&1 1>&2 2>&3)
    . ./createDB.sh
    mainMenu
    ;;
  3)
    currentName=$(whiptail --title "Rename Database" --inputbox "Enter Database Current Name: " 8 45 3>&1 1>&2 2>&3)
    newName=$(whiptail --title "Rename Database" --inputbox "Enter Database New Name: " 8 45 3>&1 1>&2 2>&3)
    . ./renameDB.sh
    mainMenu
    ;;
  4)
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
  tableMainMenu=$(whiptail --title "Table Menu" --fb --menu "Choose an option" 25 50 9 \
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
    tableName=$(whiptail --title "Create Table" --inputbox "Enter Table Name: " 8 45 3>&1 1>&2 2>&3)
    . ./createTable.sh
    tableMainMenu
    ;;

  2)
    tables=$(ls ./DataBase/$dbName)
    whiptail --title "List of Tables in Database $dbName" --msgbox "$tables" 30 45
    tableMainMenu
    ;;

  3)
    tableName=$(whiptail --title "Drop Table" --inputbox "Enter Table Name: " 8 45 3>&1 1>&2 2>&3)
    . ./dropTable.sh
    tableMainMenu
    ;;

  4)
    tableName=$(whiptail --title "Insert Into Table" --inputbox "Enter Table Name: " 8 45 3>&1 1>&2 2>&3)
    . ./insertIntoTable.sh
    tableMainMenu
    ;;

  5)
    tableName=$(whiptail --title "Select From Table" --inputbox "Enter Table Name: " 8 45 3>&1 1>&2 2>&3)
    if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
      if [[ -f ./DataBase/$dbName/$tableName ]]; then
        tableSelectMenu
      else
        whiptail --title "Table Records" --msgbox "Table Doesn't Exist" 8 45
        tableMainMenu
      fi
    else
      whiptail --title "Table Records" --msgbox "Table Name Doesn't Meet Minimum Requirements" 8 45
      tableMainMenu
    fi
    ;;

  6)
    tableName=$(whiptail --title "Delete from Table" --inputbox "Enter Table Name: " 8 45 3>&1 1>&2 2>&3)
    . ./deleteFromTable.sh
    tableMainMenu
    ;;

  7)
    tableName=$(whiptail --title "Update Table" --inputbox "Enter Table Name: " 8 45 3>&1 1>&2 2>&3)
    . ./updateTable.sh
    tableMainMenu
    ;;

  8)
    mainMenu
    ;;

  9)
    exit
    ;;
  esac
}

function tableSelectMenu() {

  tableSelectMenu=$(
    whiptail --title "Select From Table Menu" --fb --menu "Choose an option" 25 50 6 \
      "1" "Select All Columns" \
      "2" "Select Specific Column" \
      "3" "Select With Specific Value" \
      "4" "Back to Table Menu" \
      "5" "Back to Main Menu" \
      "6" "Exit" 3>&1 1>&2 2>&3
  )

  case $tableSelectMenu in
  1)

    . ./selectAll.sh
    tableSelectMenu
    ;;

  2)
    . ./selectColumn.sh
    tableSelectMenu
    ;;

  3)
    . ./selectWhere.sh
    tableSelectMenu
    ;;
  4)
    tableMainMenu
    ;;
  5)
    . ./main.sh
    ;;
  6)
    exit
    ;;
  esac
}

mainMenu
