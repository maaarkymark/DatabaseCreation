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

create table Member.Member(
member_no smallint identity(1,1) not null,
firstName varchar(20) not null,
lastName varchar(20) not null,
middleInitial char (4) null,
birthDate date not null,
isAdult char(1) not null
)
;
go

create table Member.Adult(
id smallint identity(1,1) not null,
email varchar(20) not null,
phone varchar(15) null,
street varchar(20) not null,
city varchar(20) not null,
USstate char(2) not null,
zip char(5) not null,
photo varbinary(max) null
)
;
go
create table Member.Juvenile(
id smallint identity(1,1) not null,
adult_member_no smallint not null
)
;
go

create table Member.AdultMember(
adultId smallint not null,
member_no smallint not null
)
;
go

create table Member.JuvenileMember(
juvenileId smallint not null,
member_no smallint not null
)
;
go
