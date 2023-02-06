#!/bin/bash
if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
  if ! [[ -f ./DataBase/$dbName/$tableName ]]; then
    whiptail --title "Error Message" --msgbox "Table Not Found" 8 45
    tableMainMenu
  else
    colname=$(whiptail --title "Delete From Table" --inputbox "Enter Condition Column name" 8 45 3>&1 1>&2 2>&3)
    checkcolumnfound=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$colname'") print i}}}' ./DataBase/$dbName/$tableName)
    if [[ $checkcolumnfound == "" ]]; then
      whiptail --title "Error Message" --msgbox "Column Not Found" 8 45
    else
      value=$(whiptail --title "Delete From Table" --inputbox "Enter Condition Value" 8 45 3>&1 1>&2 2>&3)
      recordNo=$(awk 'BEGIN{FS="|"}{if ($'$checkcolumnfound'=="'$value'") print NR}' ./DataBase/$dbName/$tableName)
      if [[ $recordNo == 1 ]]; then
        whiptail --title "Error Message" --msgbox "Value Not Found" 8 45
      else
        if [[ $recordNo == "" ]]; then
          whiptail --title "Error Message" --msgbox "Record doesn't exist" 8 45
        else
          sed -i ''$recordNo'd' ./DataBase/$dbName/$tableName
          whiptail --title "Record" --msgbox "record deleted sucessfully" 8 45
        fi
      fi
    fi
  fi
else
  whiptail --title "Error Message" --msgbox "Table Name Validaton Error" 8 45
fi
