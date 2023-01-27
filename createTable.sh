#!/bin/bash

if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
  if [[ -f ./DataBase/$dbName/$tableName ]]; then
    whiptail --title "Create Table Message" --msgbox "Table $tableName Already Exist" 8 45
  else
    columns=$(whiptail --title "Columns Number" --inputbox "Enter Number Of Columns" 8 45 3>&1 1>&2 2>&3)
    touch ./DataBase/$dbName/$tableName

    i=1
    datatype=""
    isPrimary=""
    primarykeyMenu="2"
    separator="|"
    tableInfo=$colName$separator$datatype$separator$isPrimary

    while [ $i -le $columns ]; do
      colName=$(whiptail --title "column Name" --inputbox "Enter Column $i Name " 8 45 3>&1 1>&2 2>&3)
      datatypeMenu=$(whiptail --title "Data Type Menu " --fb --menu "select Data Type" 15 60 4 \
        "1" "int" \
        "2" "str" \
        "3" "boolean" 3>&1 1>&2 2>&3)
      case $datatypeMenu in
      1)
        datatype="int"
        ;;
      2)
        datatype="str"
        ;;
      3)
        datatype="boolean"
        ;;
      esac
      if [[ $primarykeyMenu == "2" ]]; then

        primarykeyMenu=$(whiptail --title "Primary Key Menu" --fb --menu "Is column primary key?" 15 60 4 \
          "1" "yes" \
          "2" "no" 3>&1 1>&2 2>&3)
        case $primarykeyMenu in
        1)
          isPrimary="yes"
          ;;
        2)
          isPrimary="no"
          ;;
        esac
      fi

      if [[ i -eq $columns ]]; then
        echo $colName$separator >>./DataBase/$dbName/$tableName
        echo $colName$separator$datatype$separator$isPrimary >>./DataBase/$dbName/.$tableName
      else
        echo -n $colName$separator >>./DataBase/$dbName/$tableName
        echo $colName$separator$datatype$separator$isPrimary$separator >>./DataBase/$dbName/.$tableName
      fi
      ((i++))
      isPrimary="no"
    done
    whiptail --title "Create table Message" --msgbox "You created $tableName sucessfully" 8 45
  fi
else
  whiptail --title "Create table Message" --msgbox "Name Validation Error" 8 45
fi
