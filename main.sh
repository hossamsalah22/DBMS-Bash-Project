#!/bin/bash

mkdir DataBases 2>> ./.error.log
clear
echo "Welcome To DBMS"
function mainMenu {
  echo -e "\n+---------Main Menu-------------+"
  echo "| 1. Select DB                  |"
  echo "| 2. Create DB                  |"
  echo "| 3. Rename DB                  |"
  echo "| 4. Drop DB                    |"
  echo "| 5. Show DBs                   |"
  echo "| 6. Exit                       |"
  echo "+-------------------------------+"
  echo -e "Enter Choice: \c"
  read ch
  case $ch in
    1)  . selectDB.sh ;;
    2)  . createDB.sh ;;
    3)  . renameDB.sh ;;
    4)  . dropDB.sh ;;
    5)  ls ./DataBases ; mainMenu;;
    6) exit ;;
    *) echo " Wrong Choice " ; mainMenu;
  esac
}

mainMenu
