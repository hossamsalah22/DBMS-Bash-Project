#!/bin/bash
# cd ./DataBase/$dbName

# echo -e "Table Name: \c"
# read tableName

# if ! [[ -f $tableName ]]; then
#     echo "Table $tableName isn't existed ,choose another Table"
#     tablesMenu
# fi #continue if user insert correct table name

# colsNum=$(awk 'END{print NR}' .$tableName)
# fieldSep="|"
# recordSep="\n"

if [[ $tableName =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; then
    if [[ -f ./DataBase/$dbName/$tableName ]]; then
        numberOfColumns=$(awk 'END {print NR}' ./DataBase/$dbName/.$tableName)
        separator="|"

        # for ((i = 1; i <= $colsNum; i++)); do #Loop in hidden metadata file to ask user to insert with same column names and types
        #     colName=$(awk 'BEGIN{FS="|"}{ if(NR=='$i') print $1}' .$tableName)
        #     colType=$(awk 'BEGIN{FS="|"}{if(NR=='$i') print $2}' .$tableName)
        #     colPK=$(awk 'BEGIN{FS="|"}{if(NR=='$i') print $3}' .$tableName)
        #     echo -e "$colName ($colType) = \c"
        #     read data

        for ((i = 1; i <= $numberOfColumns; i++)); do
            checkcolname=$(awk 'BEGIN {FS="|"}{if ( NR=='$i' ) print $1 }' ./DataBase/$dbName/.$tableName)
            checkdatatype=$(awk 'BEGIN {FS="|"}{if ( NR=='$i' ) print $2 }' ./DataBase/$dbName/.$tableName)
            checkisprimary=$(awk 'BEGIN {FS="|"}{if ( NR=='$i' ) print $3 }' ./DataBase/$dbName/.$tableName)
            record=$(whiptail --title "Your Data" --inputbox "Enter data for $checkcolname with in data type ($checkdatatype)" 8 45 3>&1 1>&2 2>&3)

            # # Validate Input
            # if [[ $colType == "int" ]]; then
            #     while ! [[ $data =~ ^[0-9]*$ ]]; do
            #         echo -e "invalid input to datatype!"
            #         echo -e "$colName ($colType) = \c"
            #         read data
            #     done
            # fi
            if [[ $checkdatatype == "int" ]]; then
                while ! [[ $record =~ ^[0-9]+$ ]]; do
                    whiptail --title "Error Message" --msgbox "Not integer, Enter Record Again" 8 45
                    record=$(whiptail --title "Your Data" --inputbox "Enter data for $checkcolname with in data type ($checkdatatype)" 8 45 3>&1 1>&2 2>&3)
                done

            # if [[ $colType == "str" ]]; then
            #     while ! [[ $data =~ ^[A-Za-z_]{1}+([A-Za-z0-9]*)$ ]]; do
            #         echo -e "invalid input to datatype!"
            #         echo -e "$colName ($colType) = \c"
            #         read data
            #     done
            # fi
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
                # echo $record
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
            if [[ $checkisprimary == "yes" ]]; then
                while [[ true ]]; do
                    if [[ $record =~ ^[$(awk 'BEGIN{FS="|" ; ORS=" "}{if(NR != 1)print $(('$i'-1))}' ./DataBase/$dbName/$tableName)]$ ]]; then
                        whiptail --title "Error Message" --msgbox "Primary key can't be duplicated" 8 45
                    else
                        break
                    fi
                    record=$(whiptail --title "Your Data" --inputbox "Enter data for $checkcolname with in data type ($checkdatatype)" 8 45 3>&1 1>&2 2>&3)
                done
            fi

            #     #Set row
            #     if [[ $i == $colsNum ]]; then #when reaching last column then put record seperator
            #         row+=$data$recordSep
            #     else #Put field seperator
            #         row+=$data$fieldSep
            #     fi

            # done #end of for loop

            if ! [[ $i == $numberOfColumns ]]; then
                echo -n $record$separator >>./DataBase/$dbName/$tableName
            else
                echo $record >>./DataBase/$dbName/$tableName
                whiptail --title "Success Message" --msgbox "Your record inserted successfully" 8 45
            fi
        done
    # echo -e $row"\c" >>$tableName
    # if [[ $? == 0 ]]; then
    #     echo "Data Inserted Successfully"
    # else
    #     echo "Error Inserting Data into Table $tableName"
    # fi
    # tablesMenu

    else
        whiptail --title "Error Message" --msgbox "Table Not Found" 8 45
        tableMainMenu
    fi
else
    whiptail --title "Error Message" --msgbox "Table Name Validaton Error" 8 45
fi
