#!/bin/bash
cd ./DataBase/$dbName

# echo -e "Table Name: \c"
# read tableName
if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
  if [[ -f $tableName ]]; then
    # echo "table already existed ,choose another name"
    whiptail --title "Create Table Message" --msgbox "Table $tableName Already Exist" 8 45
    # fi
  else
    # [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]
    columns=$(whiptail --title "Columns Number" --inputbox "Enter Number Of Columns" 8 45 3>&1 1>&2 2>&3)
    touch $tableName

    i=1
    datatype=""
    isPrimary=""
    primarykeyMenu="2"
    separator="|"
    tableInfo=$colName$separator$datatype$separator$isPrimary

    # echo -e "Number of Columns: \c"
    # read colsNum
    # sep=","
    # for ((i = 0; i < $colsNum; i++)); do
    #   echo -e "enter column name number $i: \c"
    #   read colName

    #   echo -e "enter type of column number $colName: \c"
    #   select datatype in int str; do
    #     case $datatype in
    #     int)
    #       colType="int"
    #       break
    #       ;;
    #     str)
    #       colType="str"
    #       break
    #       ;;
    #     *)
    #       echo "You entered wrong datatype, enter either int or str"
    #       break
    #       ;;
    #     esac
    #   done
    #   tableData+="$colName$sep$colType$sep"
    # done
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
          isPrimary="PK"
          ;;
        2)
          isPrimary=""
          ;;
        esac
      fi

      if [[ i -eq $colNumber ]]; then
        echo $colName >>$tableName
        echo $colName$separator$datatype$separator$isPrimary >>.$tableName

      else
        echo -n $colName$separator >>$tableName
        echo $colName$separator$datatype$separator$isPrimary$separator >>.$tableName
      fi
      ((i++))
      isPrimary=""
    done
    whiptail --title "Create table Message" --msgbox "You created $tableName sucessfully" 8 45
  fi
fi

# echo $tableData
# touch DataBase/$dbName/$tableName
# echo -e $tableDate >>$tableName

cd ../..
