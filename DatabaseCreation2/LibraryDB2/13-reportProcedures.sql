/*Create LibrabryProject database
Script date: November 23, 2017
Developed by 
Vera Yeni, 
Anirban Bhattacharjee,
Jamie Alexander,
Marc Louis Aberin
*/
use LibraryDB2
;
go

--1. How many loans did the library do last year?
--loans starting and ending in the year 2016 

create procedure getNumberLoansLastYear
as
   SELECT COUNT(id) as 'Number of loans last year'
	FROM Operation.Loan
	where 
	year(startDate) >= YEAR(GETDATE())-1 and year(startDate) < YEAR(GETDATE()) and
	year(returnDate) >= YEAR(GETDATE())-1 and year(returnDate) < YEAR(GETDATE())
;
go

execute getNumberLoansLastYear
; 
go 


--2. What percentage of the membership borrowed at least one book?
-- assuming that a loan with no books is impossible

create procedure getPercentageMembersWhoBorrowedLastYear
as
	select ROUND(cast(count(distinct L.member_no) as float) / cast(count(distinct M.member_no) as float) * 100, 2) as 'Percentage of members that borrowed at least one book'
	from Operation.Loan as L FULL OUTER JOIN Member.Member as M
	on L.member_no = M.member_no
;
go

execute getPercentageMembersWhoBorrowedLastYear
; 
go 

--3. What was the greatest number of books borrowed by any one individual?
-- assuming what is meant is the total number of books borrowed by each member

create procedure getMaxBooksByOneMember
as
	select 
	L.member_no as 'Member number', 
	M.firstName as 'First name', 
	M.lastName as 'Last name', 
	count(CPL.loanId) as 'Total of borrowed books'
	from Operation.Loan as L
	inner join Operation.CopyPerLoan as CPL
	on L.id = CPL.loanId
	inner join Member.Member as M
	on L.member_no = M.member_no
	group by L.member_no, M.firstName, M.lastName
	order by count(CPL.copyId) desc
;
go 

execute getMaxBooksByOneMember
; 
go 


--4. What percentage of the books was loaned out at least once last year?
-- assuming that books are copies

create procedure getPercentageBooksLoanedOnceLastYear
as
	select round(cast(count(distinct CPL.copyId) as float) / cast(count(C.id) as float) * 100, 2) as 'Percentage of books loaned at least once last yeat'
	from
	Operation.Loan as L
	full outer join Operation.CopyPerLoan as CPL
	on L.id = CPL.loanId
	full outer join Book.Copy as C
	on C.id = CPL.copyId
	where 
	year(L.startDate) >= YEAR(GETDATE())-1 and year(L.startDate) < YEAR(GETDATE()) and
	year(L.returnDate) >= YEAR(GETDATE())-1 and year(L.returnDate) < YEAR(GETDATE())
;  
GO 

execute getPercentageBooksLoanedOnceLastYear
; 
go 


--5. What percentage of all loans eventually becomes overdue?
create procedure getPercentageOverdueLoans
as
	select 
	round(cast((
		select count(id)
		from Operation.Loan
		where returnDate > dueDate
	)as float) / cast(count(id) as float) * 100, 2) as 'Percentage of books that are overdue'
	from Operation.Loan
;
go

execute getPercentageOverdueLoans
; 
go 

--6. What is the average length of a loan?
create procedure getAvgLoanLength
as
	select
	round(cast(sum(datediff(day, startDate, returnDate)) as float)/cast(count(id) as float), 2) as 'Average length of a loan'
	from Operation.Loan
	;
go

execute getAvgLoanLength
; 
go 

--7. What are the library peak hours for loans?
--select 3 most loaded hours

create procedure getPeakLoanHours
as
	select top 3
	DATEPART(HOUR, startDate) as 'Hour',  count(DATEPART(HOUR, startDate)) as 'Number of loans'
	from Operation.Loan
	group by  DATEPART(HOUR, startDate)
	order by count(DATEPART(HOUR, startDate)) desc
;
go

execute getPeakLoanHours
; 
go 
