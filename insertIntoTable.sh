#!/bin/bash
cd ./DataBase/$dbName

echo -e "Table Name: \c"
read tableName
if ! [[ -f $tableName ]];
then
    echo "Table $tableName isn't existed ,choose another Table"
    tablesMenu
fi #continue if user insert correct table name

colsNum=`awk 'END{print NR}' .$tableName`
fieldSep="|"
recordSep="\n"

for (( i = 1; i <= $colsNum; i++ )); 
do  #Loop in hidden metadata file to ask user to insert with same column names and types 
    colName=$(awk 'BEGIN{FS="|"}{ if(NR=='$i') print $1}' .$tableName) 
    colType=$(awk 'BEGIN{FS="|"}{if(NR=='$i') print $2}' .$tableName)
    colPK=$(awk 'BEGIN{FS="|"}{if(NR=='$i') print $3}' .$tableName)
    echo -e "$colName ($colType) = \c"
    read data

    # Validate Input
    if [[ $colType == "int" ]];
    then
    while ! [[ $data =~ ^[0-9]*$ ]]; do
        echo -e "invalid input to datatype!"
        echo -e "$colName ($colType) = \c"
        read data
    done
    fi
    if [[ $colType == "str" ]];
    then
    while ! [[ $data =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; do
        echo -e "invalid input to datatype!"
        echo -e "$colName ($colType) = \c"
        read data
    done
    fi

    # if [[ $colKey == "PK" ]];
    # then
    #     while [[ true ]]; 
    #     do
    #         if [[ $data =~ ^[`awk 'BEGIN{FS="|" ; ORS=" "}{if(NR != 1)print $(('$i'-1))}' $tableName`]$ ]];
    #         then
    #             echo -e "invalid input for Primary Key !!"
    #         else
    #             break;
    #         fi
    #         echo -e "$colName ($colType) = \c"
    #         read data
    #     done
    # fi

    #Set row
    if [[ $i == $colsNum ]];
    then #when reaching last column then put record seperator
        row+=$data$recordSep
    else #Put field seperator
        row+=$data$fieldSep
    fi

done #end of for loop 

echo -e $row"\c" >> $tableName
if [[ $? == 0 ]]
then
    echo "Data Inserted Successfully"
else
    echo "Error Inserting Data into Table $tableName"
fi
tablesMenu