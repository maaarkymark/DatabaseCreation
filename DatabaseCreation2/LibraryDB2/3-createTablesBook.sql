/*Create LibrabryProject database
Script date: November 12, 2017
Developed by 
Vera Yeni, 
Anirban Bhattacharjee,
Jamie Alexander,
Marc Louis Aberin
*/
use LibraryDB2
;
go

create table Book.Copy(
id smallint identity(1,1) not null,
itemId smallint not null,
onLoan char(1) not null,
loanable char(1) not null
)
;

go
create table Book.Item(
id smallint identity(1,1) not null,
textId smallint not null,
title varchar(30) not null,
lang char(10) not null,
isbn int not null,
cover char(1) not null,
numberCopies smallint not null
)
;

go
create table Book.Text(
id smallint identity(1,1) not null,
titleInEng varchar(30) not null,
synopsis varchar(500) not null
)
;

go
create table Book.Author(
id smallint identity(1,1) not null,
firstName varchar(30) not null,
lastName varchar(30) not null,
)
;

go
create table Book.AuthorPerText(
authorId smallint not null,
textId smallint not null,
)
;
go