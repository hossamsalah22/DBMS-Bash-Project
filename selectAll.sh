#!/bin/bash

table=$(cat ./DataBase/$dbName/$tableName)
whiptail --title "Table Records" --scrolltext --msgbox "$table" 35 70
