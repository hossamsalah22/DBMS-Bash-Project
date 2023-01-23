#!bin/bash
echo -e "Enter Table Name: \c"
read tableName
field_index = awk -F,'{
  if(NR==1){
    
  } }'