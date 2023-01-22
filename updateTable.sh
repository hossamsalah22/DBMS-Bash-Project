#!/bin/bash

if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    if [[ -f ./DataBase/$dbName/$tableName ]]; then
        columnName=$(whiptail --title "Table Records" --inputbox "Enter Column Name" 8 45 3>&1 1>&2 2>&3)
        checkColumnFound=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$columnName'") print i}}}' ./DataBase/$dbName/$tableName)

        if [[ $checkColumnFound == "" ]]; then
            whiptail --title "Error Message" --msgbox "Column doesn't exist" 8 45
            tableMainMenu
        else
            condvalue=$(whiptail --title "Column Record" --inputbox "Enter Your condition Value" 8 45 3>&1 1>&2 2>&3)
            condrecordNo=$(awk 'BEGIN{FS="|"}{if ($'$checkColumnFound'=="'$condvalue'") print $'$checkColumnFound'}' ./DataBase/$dbName/$tableName)
            recordNo=$(awk 'BEGIN{FS="|"}{if ($'$checkColumnFound'=="'$condvalue'") print NR}' ./DataBase/$dbName/$tableName)
            if [[ $condrecordNo == "" ]]; then
                whiptail --title "Error Message" --msgbox "This value dosen't Exist" 8 45
            else
                if [[ $recordNo == 1 ]]; then
                    whiptail --title "Error Message" --msgbox "This record can't be delete" 8 45
                    tableMainMenu
                else
                    field=$(whiptail --title "Field Name" --inputbox "Enter field name" 8 45 3>&1 1>&2 2>&3)
                    checkfieldfound=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$field'") print i}}}' ./DataBase/$dbName/$tableName)

                    if [[ $checkfieldfound == "" ]]; then
                        whiptail --title "Error Message" --msgbox "Field Not found" 8 45
                        tableMainMenu
                    else
                        newrecord=$(whiptail --title "Field Name" --inputbox "Enter new record" 8 45 3>&1 1>&2 2>&3)
                        #recordNo=$(awk 'BEGIN{FS="|"}{if ($'$checkColumnFound'=="'$condvalue'") print NR}' ./DataBase/$dbName/$tableName)
                        oldrecord=$(awk 'BEGIN{FS="|"}{if(NR=='$recordNo'){for(i=1;i<=NF;i++){if(i=='$checkfieldfound') print $i}}}' ./DataBase/$dbName/$tableName)
                        sed -i ''$recordNo's/'$oldrecord'/'$newrecord'/g' ./DataBase/$dbName/$tableName
                        whiptail --title "Record" --msgbox "record updated sucessfully" 8 45

                    fi
                fi
            fi

            else
            whiptail --title "Table Records" --msgbox "Table Doesn't Exist" 8 45
            tableMainMenu
        fi
    else
        whiptail --title "Table Records" --msgbox "Table Name Doesn't Meet Minimum Requirements" 8 45
        tableMainMenu
    fi
else
    whiptail --title "Connect to Table" --msgbox "Table Name Validaton Error" 8 45
fi
