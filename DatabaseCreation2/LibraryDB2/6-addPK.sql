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

--Book
alter table Book.Author
add constraint pk_Author primary key clustered (
id asc
)
;
go

alter table Book.AuthorPerText
add constraint pk_AuthorPerText primary key clustered (
authorId asc,
textId asc
)
;
go

alter table Book.Copy
add constraint pk_Copy primary key clustered (
id asc
)
;
go

alter table Book.Item
add constraint pk_Item primary key clustered (
id asc
)
;
go

alter table Book.Text
add constraint pk_Text primary key clustered (
id asc
)
;
go


--Member
alter table Member.Adult
add constraint pk_Adult primary key clustered (
id asc
)
;
go
alter table Member.Juvenile
add constraint pk_Juvenile primary key clustered (
id asc
)
;
go
alter table Member.Member
add constraint pk_Member primary key clustered (
member_no asc
)
;
go

alter table Member.JuvenileMember
add constraint pk_JuvenileMember primary key clustered (
juvenileId asc,
member_no asc
)
;
go

alter table Member.AdultMember
add constraint pk_AdultMember primary key clustered (
adultId asc,
member_no asc
)
;
go

--Operation
alter table Operation.CopyPerLoan
add constraint pk_CopyPerLoan primary key clustered (
loanId asc,
copyId asc
)
;
go

alter table Operation.Inscription
add constraint pk_Inscription primary key clustered (
member_no asc,
startDate asc
)
;
go

alter table Operation.Loan
add constraint pk_Loan primary key clustered (
id asc
)
;
go

alter table Operation.Notice
add constraint pk_Notice primary key clustered (
id asc
)
;
go

alter table Operation.Reservation
add constraint pk_Reservation primary key clustered (
id asc
)
;
go