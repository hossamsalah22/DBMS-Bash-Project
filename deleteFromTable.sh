#!/bin/bash
# if ! [[ -f ./DataBase/$dbName/$tableName ]]; then
#   echo -e "Table doesn't Exist \c"
# else

if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
  if ! [[ -f ./DataBase/$dbName/$tableName ]]; then
    whiptail --title "Error Message" --msgbox "Table Not Found" 8 45
    tableMainMenu
  else
    # echo -e "Enter Condition Column name: \c"
    # read field
    # #Search for field index
    # field_index=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$field'") print i}}}' ./DataBase/$dbName/$tableName 2>>./.error.log)
    colname=$(whiptail --title "Delete From Table" --inputbox "Enter Condition Column name" 8 45 3>&1 1>&2 2>&3)
    checkcolumnfound=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$colname'") print i}}}' ./DataBase/$dbName/$tableName)
    # #Didn't find Condition column
    # if [[ $field_index == "" ]]; then
    #   echo "Not Found"
    #   tableMainMenu
    if [[ $checkcolumnfound == "" ]]; then
      whiptail --title "Error Message" --msgbox "Column Not Found" 8 45
    else
      # echo -e "Enter Condition Value: \c"
      # read condition_value
      # res=$(awk 'BEGIN{FS="|"}{if ($'$field_index'=="'$condition_value'") print $'$field_index'}' ./DataBase/$dbName/$tableName 2>>./.error.log)
      value=$(whiptail --title "Delete From Table" --inputbox "Enter Condition Value" 8 45 3>&1 1>&2 2>&3)
      recordNo=$(awk 'BEGIN{FS="|"}{if ($'$checkcolumnfound'=="'$value'") print NR}' ./DataBase/$dbName/$tableName)
      # if [[ $res == "" ]]; then
      #   echo "Value Not Found"
      #   tableMainMenu
      if [[ $recordNo == 1 ]]; then
        whiptail --title "Error Message" --msgbox "Value Not Found" 8 45
        #       else
        #       NR=$(awk 'BEGIN{FS="|"}{if ($'$field_index'=="'$condition_value'") print NR}' ./DataBase/$dbName/$tableName 2>>./.error.log)
        #       sed -i ''$NR'd' ./DataBase/$dbName/$tableName 2>>./.error.log
        #       echo "Row has been Deleted Successfully"
        #       tableMainMenu
        #     fi
        #   fi
        # fi
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
