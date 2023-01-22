#!/bin/bash

tableData=$(cat ./DataBase/$dbName/$tableName)
whiptail --title "Table Records" --scrolltext --msgbox "$tableData" 35 70
