/*Create LibrabryProject database
Script date: November 14, 2017
Developed by 
Vera Yeni, 
Anirban Bhattacharjee,
Jamie Alexander,
Marc Louis Aberin
*/
use LibraryDB2
;
go

-- DEFAULTS
alter table Member.Adult
add constraint df_state default ('WA') for USstate
;
go

-- CHECKS
alter table Operation.Loan 
add constraint check_dueDate_later_startDate
check (dueDAte > startDate)
; 
go

alter table Operation.Loan 
add constraint check_returnDate_later_startDate
check (returnDate > startDate)
; 
go

alter table Operation.Inscription 
add constraint check_endDate_later_startDate
check (endDate > startDate)
; 
go

--PHONE FORMAT allowed 333 333 3333 or 333-333 3333 or 333 333-3333 or 333-333-3333
alter table Member.Adult
add constraint check_phone_format
check (phone like '[0-9][0-9][0-9][- ][0-9][0-9][0-9][- ][0-9][0-9][0-9][0-9]')
; 
go


--FOREIGN KEYS

--Member
alter table Member.Juvenile
add constraint fk_Juvenile_Member foreign key(adult_member_no)
references Member.Member (member_no)
;
go


alter table Member.AdultMember
add constraint fk_AdultMember_Adult foreign key(adultId)
references Member.Adult (id)
;
go

alter table Member.JuvenileMember
add constraint fk_JuvenileMember_Juvenile foreign key(juvenileId)
references Member.Juvenile (Id)
;
go

alter table Member.JuvenileMember
add constraint fk_JuvenileMember_Member foreign key(member_no)
references Member.Member (member_no)
;
go

alter table Member.AdultMember
add constraint fk_AdultMember_Member foreign key(member_no)
references Member.Member (member_no)
;
go


--Operation
alter table Operation.CopyPerLoan
add constraint fk_CopyPerLoan_Loan foreign key(loanId)
references Operation.Loan (id)
;
go

alter table Operation.CopyPerLoan
add constraint fk_CopyPerLoan_Copy foreign key(copyId)
references Book.Copy (id)
;
go

alter table Operation.Inscription
add constraint fk_Inscription_Member foreign key(member_no)
references Member.Member (member_no)
;
go

alter table Operation.Loan
add constraint fk_Loan_Member foreign key(member_no)
references Member.Member (member_no)
;
go

alter table Operation.Reservation
add constraint fk_Reservation_Member foreign key(member_no)
references Member.Member (member_no)
;
go

alter table Operation.Reservation
add constraint fk_Reservation_Item foreign key(itemId)
references Book.Item (id)
;
go

alter table Operation.Notice
add constraint fk_Notice_Loan foreign key(loanId)
references Operation.Loan (id)
;
go

--Book
alter table Book.AuthorPerText
add constraint fk_AuthorPerText_Author foreign key(authorId)
references Book.Author (id)
;
go

alter table Book.AuthorPerText
add constraint fk_AuthorPerText_Text foreign key(textId)
references Book.Text (id)
;
go

alter table Book.Copy
add constraint fk_Copy_Item foreign key(itemId)
references Book.Item (id)
;
go

alter table Book.Item
add constraint fk_Item_Text foreign key(textId)
references Book.Text (id)
;
go