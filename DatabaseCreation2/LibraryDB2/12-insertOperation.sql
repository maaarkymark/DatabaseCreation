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


INSERT INTO Operation.Inscription
(member_no, startDate, endDate)
VALUES
(1, '2016-01-26', '2017-01-26'),
(2, '2016-03-17', '2017-03-17'),
(3, '2016-06-15', '2017-06-15'),
(4, '2016-08-04', '2017-08-04'),
(5, '2016-11-05', '2017-11-05'),
(6, '2016-11-24', '2017-11-24'),
(7, '2017-09-02', '2018-09-02'),
(8, '2017-11-11', '2018-11-11'),
(9, '2017-11-27', '2018-11-27'),
(9, '2016-11-27', '2017-11-26'),
(10, '2017-12-05', '2018-12-05'),
(10, '2016-12-05', '2017-12-04'),
(10, '2015-12-05', '2016-12-03')
;
GO

INSERT INTO Operation.Loan
(member_no, startDate, dueDate, returnDate)
VALUES
(1, '2016-01-27 12:10:00', '2016-02-10', '2016-02-10'),
(2, '2016-07-17 12:13:00', '2016-07-31', '2016-07-29'),
(3, '2016-08-07 13:10:00', '2016-08-21', '2016-08-15'),
(4, '2016-12-19 14:15:00', '2017-01-02', '2017-01-11'),
(5, '2017-05-10 11:34:00', '2017-05-24', null),
(6, '2017-05-30 14:41:00', '2017-06-13', '2017-06-25'),
(7, '2017-12-05 16:20:00', '2017-12-19', '2017-12-18'),
(8, '2017-12-28 12:18:00', '2018-01-11', null),
(9, '2017-12-10 11:46:00', '2017-12-24', null),
(10, '2017-12-25 17:55:00', '2018-01-08', '2018-01-19')
;
GO

INSERT INTO Operation.Notice
(loanId, issueDate, emailText)
VALUES
(1, '2016-02-17', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'),
(2, '2016-08-07', 'Tortor at auctor urna nunc. Blandit cursus risus at ultrices.'),
(3, '2016-08-28', 'Sed risus ultricies tristique nulla aliquet enim tortor.'),
(4, '2017-01-09', 'Risus ultricies tristique nulla aliquet enim tortor.'),
(5, '2017-05-31', 'Amet venenatis urna cursus eget.'),
(6, '2017-06-20', 'Aliquam ut porttitor leo a diam sollicitudin tempor id.'),
(7, '2017-12-26', 'Dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu.'),
(8, '2018-01-18', 'Felis bibendum ut tristique et egestas quis ipsum suspendisse.'),
(9, '2017-12-31', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.'),
(10, '2018-01-15', 'Morbi non arcu risus quis varius quam. Ac odio tempor orci dapibus.')
;
GO

INSERT INTO Operation.Reservation
(member_no, itemId, reservationDate)
VALUES
(1, 1, '2016-01-26'),
(1, 4, '2016-01-26'),
(2, 2, '2016-06-03'),
(3, 3, '2016-06-23'),
(3, 7, '2016-07-23'),
(4, 4, '2016-10-20'),
(5, 5, '2017-02-05'),
(6, 6, '2017-03-15'),
(6, 1, '2017-03-18'),
(7, 7, '2017-09-14'),
(8, 8, '2017-11-20'),
(9, 9, '2017-12-15'),
(10, 10, '2017-12-12')
;
GO

INSERT INTO Operation.CopyPerLoan
(loanId, copyId)
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 2),
(2, 6),
(3, 3),
(3, 1),
(3, 8),
(4, 4),
(4, 1),
(5, 5),
(5, 2),
(6, 6)
;
GO