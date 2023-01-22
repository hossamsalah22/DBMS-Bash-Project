#!/bin/bash
echo -e "Table Name: \c"
  read tableName
  if [[ -f $tableName ]]; then
    echo "table already existed ,choose another name"
  fi
  if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    echo -e "Number of Columns: \c"
    read colsNum
    sep=","
    for (( i=0 ; i<$colsNum ; i++ )); 
      do
      echo -e "enter column name number $i: \c"
    read colName

    echo -e "enter type of column number $colName: \c"
      select datatype in int str
      do 
          case $datatype in
          int) colType="int"
          break;;
          str) colType="str"
          break;;
          *) echo "You entered wrong datatype, enter either int or str"
          break;; 
          esac
      done 
    tableData+="$colName$sep$colType$sep"
      done
  fi
  echo $tableData
  touch DataBase/$dbName/$tableName
  echo -e $tableDate >> $tableName




