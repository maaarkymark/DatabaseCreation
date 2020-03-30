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

create table Operation.Inscription(
member_no smallint not null,
startDate date not null,
endDate date not null
)
;
go
create table Operation.Reservation(
id smallint identity (1,1) not null,
member_no smallint not null,
itemId smallint not null,
reservationDate date not null
)
;
go
create table Operation.Loan(
id smallint identity (1,1) not null,
member_no smallint not null,
startDate datetime not null,
dueDate date not null,
returnDate date null,
numberDaysOverdue smallint null
)
;
go
create table Operation.CopyPerLoan(
loanId smallint not null,
copyId smallint not null,
)
;
go
create table Operation.Notice(
id smallint identity (1,1) not null,
loanId smallint not null,
issueDate date not null,
emailText varchar(300) not null
)
;
go