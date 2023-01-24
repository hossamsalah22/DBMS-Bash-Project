#!/bin/bash

if ! [[ -f ./DataBase/$dbName/$tableName ]]; then
    echo -e "Table doesn't Exist \c" 
else
  echo -e "Enter Condition Column name: \c"
  read field
  #Search for field index
  field_index=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$field'") print i}}}' ./Database/iti/$tableName)

  #Didn't find Condition column 
  if [[ $field_index == "" ]]
  then
    echo "Not Found"
    tableMainMenu
  else
    echo -e "Enter Condition Value: \c"
    read condition_value
    res=$(awk 'BEGIN{FS="|"}{if ($'$field_index'=="'$condition_value'") print $'$field_index'}' ./Database/iti/$tableName 2>>./.error.log)
    if [[ $res == "" ]]
    then
      echo "Value Not Found"
      tableMainMenu
    else
      NR=$(awk 'BEGIN{FS="|"}{if ($'$field_index'=="'$condition_value'") print NR}' ./Database/iti/$tableName 2>>./.error.log)
      sed -i ''$NR'd' ./Database/iti/$tableName 2>>./.error.log
      echo "Row has been Deleted Successfully"
      tableMainMenu
    fi
  fi
fi