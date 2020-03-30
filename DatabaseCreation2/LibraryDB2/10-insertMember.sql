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

INSERT INTO Member.Adult
(email,phone,street,city,USstate,zip,photo)
VALUES
('leejacobs@gmail.com', '509-352-3390', '3324 Goodwin Avenue', 'Spokane', 'WA', '99201', convert(VARBINARY(max), '')),
('mgonzales@yahoo.com', '360-470-3555', '4422 Boone Croc Lane', 'Elma', 'WA', '98541', convert(VARBINARY(max), '')),
('ranreid@hotmail.com', '425-702-9529', '3349 Main Street', 'Redmond', 'NY', '98052', convert(VARBINARY(max), '')),
('mmckinney@gmail.com', '509-306-5945', '3455 Goodwine Avenue', 'Ellensburg', 'WA', '98926', convert(VARBINARY(max), '')),
('ianharmon@gmail.com', '206-680-6679', '1620 Union Street', 'Seattle', 'WA', '98109', convert(VARBINARY(max), '')),
('donwatkins@gmail.com', '360-240-5058', '1274 Chardonay Drive', 'Oak Harbor', 'LA', '98277', convert(VARBINARY(max), '')),
('mnewman@yahoo.com', '206-276-0113', '2796 Ryder Avenue', 'Seattle', 'WA', '98109', convert(VARBINARY(max), ''))
;
GO

INSERT INTO Member.Member
(firstName,lastName,birthDate,middleInitial,isAdult)
VALUES
('Lee', 'Jacobs', '1973-08-07', '', 'Y'),
('Marcia', 'Gonzales', '1975-02-03', 'R.', 'Y'),
('Randolph', 'Reid', '1976-02-26', '', 'Y'),
('Mitchell', 'Mckinney', '1980-09-29', 'A.', 'Y'),
('Ian', 'Harmon', '1982-07-01', 'K.', 'Y'),
('Don', 'Watkins', '1987-10-09', 'B.', 'Y'),
('Minnie', 'Newman', '1988-06-06', 'D.', 'Y'),
('Corey', 'Gordon', '2000-09-22', 'T.', 'N'),
('Edith', 'Thornton', '2005-10-12', 'B.', 'N'),
('Arturo', 'Alvarado', '2002-01-10', '', 'N')
;
GO


INSERT INTO Member.Juvenile
(adult_member_no)
VALUES
(4),
(5),
(6)
;
GO

INSERT INTO Member.AdultMember
(adultId, member_no)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7)
;
GO

INSERT INTO Member.JuvenileMember
(juvenileId, member_no)
VALUES
(1, 8),
(2, 9),
(3, 10)
;
GO