#!/bin/bash
if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    if [[ -f ./DataBase/$dbName/$tableName ]]; then
        numberOfColumns=$(awk 'END {print NR}' ./DataBase/$dbName/.$tableName)
        separator="|"
        for ((i = 1; i <= $numberOfColumns; i++)); do
            checkcolname=$(awk 'BEGIN {FS="|"}{if ( NR=='$i' ) print $1 }' ./DataBase/$dbName/.$tableName)
            checkdatatype=$(awk 'BEGIN {FS="|"}{if ( NR=='$i' ) print $2 }' ./DataBase/$dbName/.$tableName)
            checkisprimary=$(awk 'BEGIN {FS="|"}{if ( NR=='$i' ) print $3 }' ./DataBase/$dbName/.$tableName)
            record=$(whiptail --title "Your Data" --inputbox "Enter data for $checkcolname with in data type ($checkdatatype)" 8 45 3>&1 1>&2 2>&3)
            if [[ $checkdatatype == "int" ]]; then
                while ! [[ $record =~ ^[0-9]+$ ]]; do
                    whiptail --title "Error Message" --msgbox "Not integer, Enter Record Again" 8 45
                    record=$(whiptail --title "Your Data" --inputbox "Enter data for $checkcolname with in data type ($checkdatatype)" 8 45 3>&1 1>&2 2>&3)
                done
            elif [[ $checkdatatype == "str" ]]; then
                while ! [[ $record =~ ^[A-Za-z]+$ ]]; do
                    whiptail --title "Error Message" --msgbox "Not String, Enter Record Again" 8 45
                    record=$(whiptail --title "Your Data" --inputbox "Enter data for $checkcolname with in data type ($checkdatatype)" 8 45 3>&1 1>&2 2>&3)
                done
            elif [[ $checkdatatype == "boolean" ]]; then
                while ! [[ $record = "true" || $record = "false" || $record = "TRUE" || $record = "FALSE" || $record = "True" || $record = "False" || $record = "yes" || $record = "no" ]]; do
                    whiptail --title "Error Message" --msgbox "Not a boolean; Enter true , false , TRUE , FALSE , True , False , yes or no only" 8 45
                    record=$(whiptail --title "Your Data" --inputbox "Enter data for $checkcolname with in data type ($checkdatatype)" 8 45 3>&1 1>&2 2>&3)
                done
            fi
            if [[ $checkisprimary == "PK" ]]; then
                while [[ true ]]; do
                    if [[ $record =~ ^[$(awk 'BEGIN{FS="|" ; ORS=" "}{if(NR != 1)print $(('$i'-1))}' ./DataBase/$dbName/$tableName)]$ ]]; then
                        whiptail --title "Error Message" --msgbox "Primary key can't be duplicated" 8 45
                    else
                        break
                    fi
                    record=$(whiptail --title "Your Data" --inputbox "Enter data for $checkcolname with in data type ($checkdatatype)" 8 45 3>&1 1>&2 2>&3)
                done
            fi
            if ! [[ $i == $numberOfColumns ]]; then
                echo -n $record$separator >>./DataBase/$dbName/$tableName
            else
                echo $record >>./DataBase/$dbName/$tableName
                whiptail --title "Success Message" --msgbox "Your record inserted successfully" 8 45
            fi
        done
    else
        whiptail --title "Error Message" --msgbox "Table Not Found" 8 45
        tableMainMenu
    fi
else
    whiptail --title "Error Message" --msgbox "Table Name Validaton Error" 8 45
fi
