-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 16, 2017 at 03:14 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Orders`
--

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE `Company` (
  `Comp. No.` int(11) NOT NULL,
  `Comp. Name` varchar(40) NOT NULL,
  `Comp. Slogan` varchar(40) NOT NULL,
  `Comp. Address` varchar(40) NOT NULL,
  `Comp. City` varchar(30) NOT NULL,
  `Comp. State` char(2) NOT NULL,
  `Comp. Zip` char(5) NOT NULL,
  `Comp. Phone` varchar(12) NOT NULL,
  `Comp. Fax` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Company`
--

INSERT INTO `Company` (`Comp. No.`, `Comp. Name`, `Comp. Slogan`, `Comp. Address`, `Comp. City`, `Comp. State`, `Comp. Zip`, `Comp. Phone`, `Comp. Fax`) VALUES
(1, 'Acme Corporation', 'We''re serious about Acme Corporation', '364 Hilldale St.', 'Zeeland', 'MI', '49464', '616-239-1068', '616-396-0575'),
(2, 'Globex Corporation', 'We are global', '9910 John Court', 'Glenview', 'IL', '60025', '847-486-0247', '847-486-0532'),
(3, 'Soylent Corp', 'Let the soylent corp begin', '209 Oakland Avenue', 'Sarasota', 'FL', '34231', '941-316-2176', '941-894-7603'),
(4, 'Initech', 'Get the initech habit', '8276 Bear Hill St.', 'Bozeman', 'MT', '59715', '406-586-6517', '406-522-7715'),
(5, 'Umbrella Corporation', 'Get under the umbrella', '951 Branch Lane', 'Green Bay', 'WI', '54302', '920-544-1461', '920-436-9495'),
(6, 'Hooli', 'Hooli is fun', '7481 Piper St.', 'Norwood', 'MA', '02062', '781-702-4086', '781-440-1171'),
(7, 'Cyberdyne Systems', 'The coolest system on the planet', '806 Stonybrook Road', 'Rosemount', 'MN', '55068', '507-429-4796', '507-552-5118'),
(8, 'Wayne Enterprises', 'Wayne enterprises, give chance a chance', '8283 North Lyme St.', 'Schererville', 'IN', '46375', '812-732-4982', '812-415-9056'),
(9, 'Wonka Industries', 'Best always comes from wonka industries', '498 Sussex Dr.', 'New York', 'NY', '10002', '212-648-5805', '212-722-7876'),
(10, 'Stark Industries', 'Power everything', '3 Shore Dr.', 'Linden', 'NJ', '07036', '908-862-0762', '908-494-0985');

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Cust. No.` int(11) NOT NULL,
  `Cust. Name` varchar(40) NOT NULL,
  `Cust. Address` varchar(40) NOT NULL,
  `Cust. City` varchar(30) NOT NULL,
  `Cust. State` char(2) NOT NULL,
  `Cust. Zip` char(5) NOT NULL,
  `Cust. Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Cust. No.`, `Cust. Name`, `Cust. Address`, `Cust. City`, `Cust. State`, `Cust. Zip`, `Cust. Phone`) VALUES
(1, 'Thomas S. Chambers', '2350 Dovetail Estates', 'Oklahoma City', 'OK', '73135', '580-901-9984'),
(2, 'Lloyd A. Alexander', '3533 University Street', 'Seattle', 'WA', '98109', '206-391-1631'),
(3, 'Donald M. Gaither', '4450 Mount Tabor', 'Yonkers', 'NY', '10701', '914-476-2063'),
(4, 'Mark L. Lindley', '3232 Late Avenue', 'Enid', 'OK', '73703', '580-732-5501'),
(5, 'Gail J. Bellamy', '1813 Yorkshire Circle', 'Morehead City', 'NC', '28557', '252-247-1511'),
(6, 'Carol R. Lawson', '2814 Colonial Drive', 'Houston', 'TX', '77036', '979-859-7111'),
(7, 'Albert A. Aguilar', '2047 Front Street', 'Marysville', 'MI', '48040', '810-364-9029'),
(8, 'Louis C. Jones', '1900 Leo Street', 'Centennial', 'CO', '80112', '720-979-2965'),
(9, 'Desiree C. Martin', '347 Delaware Avenue', 'San Francisco', 'CA', '94115', '415-292-2802'),
(10, 'Stacey R. Roderick', '2991 Glenview Drive', 'Corpus Christi', 'TX', '78476', '361-590-3360');

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `Item No.` int(11) NOT NULL,
  `Order No.` int(11) NOT NULL,
  `Item Description` varchar(40) NOT NULL,
  `Qty.` int(11) NOT NULL,
  `Item Taxed` tinyint(1) NOT NULL,
  `Item Cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`Item No.`, `Order No.`, `Item Description`, `Qty.`, `Item Taxed`, `Item Cost`) VALUES
(1, 1, 'candies', 10, 0, '9.95'),
(2, 2, 'oranges', 20, 0, '10.25'),
(3, 3, 'windows', 30, 1, '40.50'),
(4, 4, 'tires', 40, 1, '50.00'),
(5, 5, 'batteries', 50, 1, '10.75'),
(6, 6, 'sunglasses', 60, 1, '45.50'),
(7, 7, 'sketch pads', 25, 1, '5.95'),
(8, 8, 'toothpastes', 15, 1, '2.95'),
(9, 9, 'cellphones', 45, 0, '30.00'),
(10, 10, 'lamp shades', 70, 0, '15.35'),
(11, 1, 'corks', 100, 0, '0.50'),
(12, 2, 'knives', 50, 1, '3.95'),
(13, 3, 'flowers', 100, 0, '2.00'),
(14, 4, 'nails', 100, 0, '0.25'),
(15, 5, 'flags', 80, 1, '3.85'),
(16, 6, 'stockings', 35, 1, '2.30'),
(17, 7, 'televisions', 10, 0, '225.00'),
(18, 8, 'pencils', 23, 1, '1.25'),
(19, 9, 'video games', 65, 0, '32.50'),
(20, 10, 'computer monitors', 20, 0, '105.25'),
(21, 1, 'hair brushes', 35, 1, '3.95'),
(22, 2, 'lotion', 35, 0, '2.75'),
(23, 3, 'picture frames', 30, 1, '9.25'),
(24, 4, 'tomatoes', 50, 0, '1.50'),
(25, 5, 'vases', 40, 1, '7.30'),
(26, 6, 'helmets', 15, 1, '39.50'),
(27, 7, 'radios', 30, 0, '22.50'),
(28, 8, 'keyboards', 35, 0, '19.25'),
(29, 9, 'clamps', 55, 1, '4.75'),
(30, 10, 'books', 95, 0, '12.95'),
(31, 1, 'clothes', 95, 0, '6.00'),
(32, 2, 'sandals', 100, 0, '19.00'),
(33, 3, 'doors', 5, 1, '50.00'),
(34, 4, 'clocks', 45, 0, '11.25'),
(35, 5, 'flowers', 200, 0, '1.25'),
(36, 6, 'carrots', 75, 0, '1.00'),
(37, 7, 'tables', 30, 0, '49.50'),
(38, 8, 'pants', 25, 1, '32.50'),
(39, 9, 'lamps', 60, 1, '13.75'),
(40, 10, 'apples', 100, 0, '0.50');

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `Order No.` int(11) NOT NULL,
  `Cust. No.` int(11) NOT NULL,
  `Comp. No.` int(11) NOT NULL,
  `Order Date` date NOT NULL,
  `Payment` decimal(10,2) NOT NULL,
  `Comments` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Order`
--

INSERT INTO `Order` (`Order No.`, `Cust. No.`, `Comp. No.`, `Order Date`, `Payment`, `Comments`) VALUES
(1, 9, 2, '2017-03-15', '0.00', ''),
(2, 1, 10, '2017-03-30', '0.00', ''),
(3, 3, 4, '2017-05-17', '0.00', ''),
(4, 5, 8, '2017-03-24', '0.00', ''),
(5, 6, 3, '2017-06-07', '0.00', ''),
(6, 7, 5, '2017-08-09', '0.00', ''),
(7, 2, 1, '2017-05-09', '0.00', ''),
(8, 8, 6, '2017-11-14', '0.00', ''),
(9, 10, 7, '2018-01-18', '0.00', ''),
(10, 4, 9, '2017-03-18', '0.00', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Company`
--
ALTER TABLE `Company`
  ADD PRIMARY KEY (`Comp. No.`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Cust. No.`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`Item No.`),
  ADD KEY `Order No.` (`Order No.`);

--
-- Indexes for table `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`Order No.`),
  ADD KEY `Customer No.` (`Cust. No.`),
  ADD KEY `Company No.` (`Comp. No.`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Items`
--
ALTER TABLE `Items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`Order No.`) REFERENCES `Order` (`Order No.`);

--
-- Constraints for table `Order`
--
ALTER TABLE `Order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Cust. No.`) REFERENCES `Customer` (`Cust. No.`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Comp. No.`) REFERENCES `Company` (`Comp. No.`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
