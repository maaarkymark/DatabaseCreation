/*Create LibrabryProject database
Script date: November 15, 2017
Developed by 
Vera Yeni, 
Anirban Bhattacharjee,
Jamie Alexander,
Marc Louis Aberin
*/
use LibraryDB2
;
go



--addition for specific member_no
SET IDENTITY_INSERT Member.Member ON;

INSERT INTO Member.Member
(member_no, firstName,lastName,birthDate,middleInitial,isAdult)
VALUES
(250, 'Ada', 'Smith', '1973-08-01', '', 'Y'),
(341, 'Kate', 'Moth', '1975-01-03', 'R.', 'Y'),
(1675, 'Billy', 'Milligan', '1972-02-26', '', 'Y')
;
go

SET IDENTITY_INSERT Member.Member OFF;

INSERT INTO Member.Adult
(email,phone,street,city,USstate,zip,photo)
VALUES
('adaSmith@gmail.com', '509-352-3333', '33 Goodwin Avenue', 'Spokane', 'WA', '99201', convert(VARBINARY(max), '')),
('kateMoth@yahoo.com', '360-470-3522', '22 Boone Croc Lane', 'Elma', 'WA', '98541', convert(VARBINARY(max), '')),
('billym@hotmail.com', '425-702-9533', '39 Main Street', 'Redmond', 'VT', '982', convert(VARBINARY(max), ''))
;
go

INSERT INTO Member.AdultMember
(adultId, member_no)
VALUES
(9, 250),
(10, 341),
(11, 1675)
;
go


insert into Operation.CopyPerLoan
(loanId, copyId)
values 
(11, 8),
(11, 9),
(12, 4),
(12, 5),
(2, 1),
(2, 4),
(13, 8)
;
go


insert into Operation.Loan
(member_no, startDate, dueDate, returnDate)
values
(1, '2015-09-06 12:34:00', '2015-09-20', '2015-09-15'),
(1, '2015-03-06 10:34:00', '2015-03-20', '2015-03-21'),
(2, '2015-09-09 14:23:00', '2015-09-23', '2015-09-20')
;
go

insert into Operation.Reservation
values
(250, 7, '2017-09-08'),
(250, 8, '2017-09-08'),
(341, 1, '2017-10-08')
;
go

insert into Operation.Loan 
values
(10, '2017-11-10 12:34:00', '2017-11-24', null, null),
(8, '2017-11-09 14:23:00', '2017-11-30', null, null)
;
go


insert into Operation.CopyPerLoan
values
(19, 1),
(19, 2),
(20, 4)

insert into Operation.Reservation
values
(250, 7, '2017-09-08'),
(250, 8, '2017-09-08'),
(341, 1, '2017-10-08')
;
go