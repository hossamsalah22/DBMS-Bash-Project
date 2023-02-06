<div align="center">
 
 ![Database Management System]

</div>

<h3 align="center">Database Management System</h3>

<div align="center">

[![GitHub contributors](https://img.shields.io/github/contributors/hossamsalah22/DBMS-Bash-Project)](https://github.com/hossamsalah22/DBMS-Bash-Project/contributors)
[![GitHub issues](https://img.shields.io/github/issues/hossamsalah22/DBMS-Bash-Project)](https://github.com/hossamsalah22/DBMS-Bash-Project/issues)
[![GitHub forks](https://img.shields.io/github/forks/hossamsalah22/DBMS-Bash-Project)](https://github.com/hossamsalah22/DBMS-Bash-Project/network)
[![GitHub stars](https://img.shields.io/github/stars/hossamsalah22/DBMS-Bash-Project)](https://github.com/hossamsalah22/DBMS-Bash-Project/stargazers)
[![GitHub license](https://img.shields.io/github/license/hossamsalah22/DBMS-Bash-Project)](https://github.com/hossamsalah22/DBMS-Bash-Project/blob/master/LICENSE)

</div>



# DBMS-Bash-Project

## How to run Project
- after cloning project, go to BMS-Bash-Project dir and open your terminal then type <code>. main.sh</code>

## Create Database

## Create Table
In create table query

1- ask about table name
if table existed, echo table already existed.

2- ask about number of columns.

3- ask names of columns iterative with data type
- then create table in DataBase dir fill with the new column names.

- For this project we used meta-file to describe the coulmn datatype and whether it's primary or not.
 next is an example for table file<br>
    ![image](https://user-images.githubusercontent.com/66179261/217010804-3c8ebb69-db62-4d5d-a264-7c40dc45dcbd.png)<br>

- next is an example for table meta file<br>
    ![image](https://user-images.githubusercontent.com/66179261/217010856-b854198a-cdc6-4270-b0d5-a6a414f5179e.png)<br>

- Filed separator is pipline seperator  | .

- Metadata files in Database Dir <br>
-- metadata files are ones who are starts with dot notation. These files are created in parrallel besides to tables file, for example: if you created table student, then two files are created, student and .student<br>
![image](https://user-images.githubusercontent.com/66179261/217010672-eb641dbd-e9b6-4069-b5b7-f3d7ab425da7.png)

## Insert into table 
- It will ask iteratively about data to which belongs to table name, checking about if data inserted matches column datatype
- Insert data goes to main table file, for example student
> data is stored in this pattern<br>
  ![image](https://user-images.githubusercontent.com/66179261/217018203-800528b7-5db7-4934-9ff9-880dab15d45e.png)

# Team of 2:
- Mariam Zayed: https://github.com/MariamZayed
- Hossam Salah: https://github.com/hossamsalah22
