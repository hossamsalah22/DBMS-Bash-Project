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

<h3> Create Table </h3>
In create table query
first column is always the primary column.

1- ask about table name
if table existed, echo table already existed

2- ask about number of columns

3- ask names of columns iterative with data type

then create table in DataBase dir fill with the new column names and types

- <h4>next is an example for file content</h4>
    id|int|PK
    name|str|
    
- the separator is comma ,

<h4>Metadata files in Database Dir</4>
metadata files are ones who are starts with dot notation. These files are created in parrallel besides to tables file, for example: 
- if you created table student, then two files are created, student and .student

.student file holds the columns data, which are column name, column data type, if a column a PK or not
every column is stored in a single row in the following pattern:
- name|string|
- id|int|PK

# Team of 2:
- Mariam Zayed: https://github.com/MariamZayed
- Hossam Salah: https://github.com/hossamsalah22
