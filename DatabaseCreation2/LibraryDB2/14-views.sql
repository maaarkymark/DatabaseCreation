/*Create LibrabryProject database
Script date: November 25, 2017
Developed by 
Vera Yeni, 
Anirban Bhattacharjee,
Jamie Alexander,
Marc Louis Aberin
*/
use LibraryDB2
;
go

--1. mailing list

--mailing information for all adults
SELECT 
M.firstName, 
M.middleInitial, 
M.lastName, 
A.email as 'email', 
A.street as 'street', 
A.city as 'city', 
A.USstate as 'state', 
A.zip as 'zip'
FROM 
Member.Member as M
inner join Member.AdultMember 
ON M.member_no = AdultMember.member_no
inner join Member.Adult as A
ON A.id = AdultMember.adultId


--function to get address details of corresponding adult basing on adult member_no
--assuming juvenile members have the address of their corresponding adult members
create function getJuvenileAdress
(
	@adultMemberNo int
)
returns table
as
return
(
	-- to compute the return value
	select 
	A.email as 'email', 
	A.street as 'street', 
	A.city as 'city', 
	A.USstate as 'state', 
	A.zip as 'zip' 
	
	from 
	Member.Member as M
	inner join Member.AdultMember 
	ON M.member_no = Member.AdultMember.member_no
	left JOIN Member.Adult as A
	ON A.id = AdultMember.adultId
	where M.member_no = @adultMemberNo
)
;
go


--get address details for juvenile members
SELECT M.firstName, M.lastName, 
(select email from getJuvenileAdress(J.adult_member_no)) as 'email',
(select street from getJuvenileAdress(J.adult_member_no)) as 'street',
(select city from getJuvenileAdress(J.adult_member_no)) as 'city',
(select [state] from getJuvenileAdress(J.adult_member_no)) as 'state',
(select zip from getJuvenileAdress(J.adult_member_no)) as 'zip'
from Member.Member as M
inner JOIN Member.JuvenileMember 
ON M.member_no = Member.JuvenileMember.member_no
inner join Member.Juvenile as J
on J.id = Member.JuvenileMember.juvenileId
;
go


--2. Copies
SELECT 
C.id as 'Copy number', 
I.isbn as 'ISBN', 
iif(C.onLoan = 'Y', 'on loan', 'not on loan') as 'On loan', 
iif(C.loanable = 'Y', 'loanable', 'not loanable') as 'Loanable', 
I.title as 'Title', 
I.lang as 'Language', 
iif(I.cover = 'H', 'hard cover', 'paper back') as 'Cover'
FROM Book.Item as I
full outer join Book.Copy as C
ON I.id = C.itemId
WHERE I.isbn in (1, 500, 1000)
ORDER BY I.isbn
;
GO


--3. Reservations

SELECT 
M.firstName as 'First name', 
M.middleInitial as 'Middle name', 
M.lastName as 'Last name', 
M.member_no as 'Member number', 
I.isbn as 'ISBN', 
R.reservationDate as 'Reservation Date' 
FROM 
Member.Member as M
full outer join Operation.Reservation as R
ON M.member_no = R.member_no
full outer join Book.Item as I
ON R.itemId = I.id
WHERE M.member_no in (250, 341, 1675)
ORDER BY M.member_no
;
go

--4. Create adult view
CREATE VIEW AdultwideView
AS
SELECT Member.firstName, Member.middleInitial, Member.lastName, Adult.street, Adult.city, Adult.USstate, Adult.zip FROM ((Member.Member
INNER JOIN Member.AdultMember ON Member.member_no = AdultMember.member_no)
INNER JOIN Member.Adult ON Adult.id = AdultMember.adultId)
;
go

select * from AdultwideView;

--5 Create child view 
CREATE VIEW ChildwideView
AS
SELECT M.firstName, M.lastName, 
(select street from getJuvenileAdress(J.adult_member_no)) as 'street',
(select city from getJuvenileAdress(J.adult_member_no)) as 'city',
(select [state] from getJuvenileAdress(J.adult_member_no)) as 'state',
(select zip from getJuvenileAdress(J.adult_member_no)) as 'zip'
from Member.Member as M
inner JOIN Member.JuvenileMember 
ON M.member_no = Member.JuvenileMember.member_no
inner join Member.Juvenile as J
on J.id = Member.JuvenileMember.juvenileId
;
go

select * from ChildwideView;

--6 Create CopywideView
CREATE VIEW CopywideView
AS
select 
C.id as 'Copy number', 
I.isbn as 'ISBN', 
iif(C.onLoan = 'Y', 'on loan', 'not on loan') as 'On loan', 
iif(C.loanable = 'Y', 'loanable', 'not loanable') as 'Loanable', 
I.title as 'Title', 
I.lang as 'Language', 
iif(I.cover = 'H', 'hard cover', 'paper back') as 'Cover',
T.titleInEng as 'Title in English',
T.synopsis as 'Synopsis',
A.firstName as 'Author first name',
A.lastName as 'Author last name'
from
Book.Copy as C  
inner join Book.Item as I
on C.itemId = I.id
inner join Book.Text as T
on I.textId = T.id
inner join Book.AuthorPerText
on Book.AuthorPerText.textId = T.id
inner join Book.Author as A
on Book.AuthorPerText.authorId = A.id
;
go

select * from CopywideView;


--7. Create LoanableView
create or alter view LoanableView 
as
select *
from CopywideView
where loanable = 'loanable'

select * from LoanableView;


--8 Create OnshelfView 
create view OnshelfView 
as
select *
from CopywideView
where [on loan] ='not on loan'

select * from OnshelfView;


--9 Create OnloanView (members and copy) 

create or alter view OnloanView 
as
select 
M.member_no as 'Member number', 
M.firstName as 'First name', 
M.lastName as 'Last name', 
M.middleInitial as 'Middle initial', 
M.birthDate as 'Date of birth', 
M.isAdult,
L.startDate, 
L.dueDate, 
L.returnDate,
L.numberDaysOverdue as 'Number days the book is overdue',
I.title, 
I.isbn as 'ISBN',
C.id as 'Loaned copyId', 
C.onLoan,
C.loanable
from Book.Copy C
inner join Book.Item as I
on I.id=C.itemId
inner join Operation.CopyPerLoan as CPL
on CPL.copyId=C.id
inner join Operation.Loan as L
on L.id=CPL.loanId
inner join Member.Member as M
on M.member_no=L.member_no
where C.onLoan='Y'
and L.returnDate is null
;
go

select * from OnloanView;

--10 Create OverdueView 
create or alter view OverdueView 
as
select *
from OnloanView
where dueDate<GETDATE()
;
go

select * from OverdueView;