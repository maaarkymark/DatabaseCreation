/*Create LibraryDB database
Script date: November 12, 2017
Developed by 
Vera Yeni, 
Anirban Bhattacharjee,
Jamie Alexander,
Marc Louis Aberin
*/
use master
create database LibraryDB2
on primary(
name = 'LibraryDB2',
filename ='/Users/Marky/Desktop/CCCS 330/LibraryDB2/LibraryDB2.mdf',
size = 10MB,
filegrowth = 2MB,
maxsize = 100MB
)
log on(
name = 'LibrabryDB2_log',
filename ='/Users/Marky/Desktop/CCCS 330/LibraryDB2/LibraryDB2.ldf',
size = 2MB,
filegrowth = 10%,
maxsize = 20MB
)