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


-- create a trigger on update in Loan table
-- when a member returns a book, if it is overdue, the systme inserts number of days that the book was overdue
-- and writes a message
 
CREATE OR ALTER TRIGGER Operation.issueOverdueMessage
ON Operation.Loan
FOR UPDATE
AS
BEGIN
	declare @returnDate date;
	declare @dueDate date;
	declare @numberOvedueDays smallint;
	declare @id smallint;


	select @returnDate = i.returnDate from inserted i;	
	select @dueDate = i.dueDate from inserted i;	
	select  @numberOvedueDays = datediff(day, i.dueDate, i.returnDate) from inserted i;
	select @id = i.id from inserted i;	

	if(@numberOvedueDays > 0)
		begin
			update Operation.Loan
				set numberDaysOverdue = @numberOvedueDays
				where id =  @id;
			PRINT 'Book overdue:'+ cast(@numberOvedueDays as varchar)+' day(s)';
		end
END

--test
update Operation.Loan
set returnDate = '2017-01-05'
where id = 4

select * from Operation.Loan


--create a trigger that checks Yes and No values for inserts and updates of the Copy table
--if value is not Y or N, aborts transaction

create or alter trigger checkCopyValues
on Book.Copy
for insert, update
as
	begin
		-- declare variables
		declare @loanable as char(1),
				@onLoan as char(1)
		
		-- compute the returned value
		select @loanable = loanable,
			@onLoan = onLoan
		from inserted
		
		-- making decision
		if(@loanable not in ('Y', 'N') or @onLoan not in ('Y', 'N'))
			begin
				raiserror('Loanable and onLoan fields may only contain Y or N values', 16, 10);
				ROLLBACK TRANSACTION;
				RETURN;
			end
	end
;
go

--test
insert into Book.Copy
values (1, 'H', 'F');

insert into Book.Copy
values (1, 'Y', 'N');

select * from Book.Copy