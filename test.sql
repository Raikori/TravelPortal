-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2019 at 12:40 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `mscity`
--

CREATE TABLE `mscity` (
  `cityID` int(10) NOT NULL,
  `cityname` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mscity`
--

INSERT INTO `mscity` (`cityID`, `cityname`, `country`) VALUES
(1, 'Banjarmasin', 'Indonesia'),
(3, 'Bandung', 'Indonesia'),
(4, 'Osaka', 'Japan'),
(5, 'Makassar', 'Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `msticket`
--

CREATE TABLE `msticket` (
  `ticketID` int(10) NOT NULL,
  `airline` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromLoc` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toLoc` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departDate` date DEFAULT NULL,
  `economyPrice` int(11) NOT NULL,
  `businessPrice` int(11) NOT NULL,
  `availSeat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `msticket`
--

INSERT INTO `msticket` (`ticketID`, `airline`, `fromLoc`, `toLoc`, `departDate`, `economyPrice`, `businessPrice`, `availSeat`) VALUES
(1, 'Garuda Indonesia', 'Osaka', 'Bandung', '2019-05-24', 2000000, 2000000, 180),
(5, 'Lion Air', 'Banjarmasin', 'Bandung', '2019-05-06', 123, 234, 190),
(6, 'Garuda Indonesia', 'Banjarmasin', 'Bandung', '2019-05-21', 200, 400, 5),
(7, 'Lion Air', 'Osaka', 'Bandung', '2019-05-24', 200, 400, 5),
(8, 'Garuda Indonesia', 'Osaka', 'Bandung', '2019-05-24', 200, 400, 5),
(9, 'Singapore Airlines', 'Osaka', 'Bandung', '2019-05-24', 500, 1000, 5),
(10, 'Singapore Airlines', 'Osaka', 'Bandung', '2019-05-24', 250, 450, 5),
(11, 'City Link', 'Osaka', 'Bandung', '2019-05-24', 250, 450, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mstransaction`
--

CREATE TABLE `mstransaction` (
  `transID` int(10) NOT NULL,
  `userID` int(11) NOT NULL,
  `invoiceNumber` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transDate` date DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mstransaction`
--

INSERT INTO `mstransaction` (`transID`, `userID`, `invoiceNumber`, `transDate`, `status`) VALUES
(1, 7, 'INV/20181219/01', '2019-05-23', 'Canceled'),
(2, 7, 'INV/20181219/02', '2019-05-23', 'Canceled'),
(3, 8, 'INV/20181219/03', '2019-05-23', 'Canceled'),
(9, 8, 'INV/20181219/94686', '2019-05-24', 'Rejected'),
(10, 8, 'INV/20181219/27165', '2019-05-24', 'Approve'),
(11, 8, 'INV/20181219/13640', '2019-05-24', 'Canceled');

-- --------------------------------------------------------

--
-- Table structure for table `msuser`
--

CREATE TABLE `msuser` (
  `userID` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `msuser`
--

INSERT INTO `msuser` (`userID`, `name`, `email`, `password`, `gender`, `role`) VALUES
(3, 'admin2', 'admin@admin.com', 'admin1', 'Male', 'Admin'),
(7, 'Jeremy', 'Jeremy@asd.com', 'asdasd', 'Male', 'User'),
(8, 'Evelyn', 'Evelyn@asd.com', 'Eugenia', 'Female', 'User'),
(10, 'Steven Fredian', 'SF@asd.com', 'asdasd', 'Male', 'User'),
(11, 'Belinda', 'BD@asd.com', 'asdasd', 'Female', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `trpassenger`
--

CREATE TABLE `trpassenger` (
  `passengerID` int(10) NOT NULL,
  `transID` int(10) NOT NULL,
  `title` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trpassenger`
--

INSERT INTO `trpassenger` (`passengerID`, `transID`, `title`, `name`, `nationality`) VALUES
(2, 1, 'Mrs.', 'Evelyn', 'Laos'),
(30, 9, 'Mr', 'Evelyn', 'Indonesia'),
(31, 10, 'Mr', 'Joshua', 'Indonesia'),
(32, 10, 'Mr', 'Evelyn', 'Indonesia'),
(33, 11, 'Mr', 'Jeremy', 'Malaysia'),
(34, 11, 'Mr', 'Evelyn', 'Singapore');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mscity`
--
ALTER TABLE `mscity`
  ADD PRIMARY KEY (`cityID`);

--
-- Indexes for table `msticket`
--
ALTER TABLE `msticket`
  ADD PRIMARY KEY (`ticketID`);

--
-- Indexes for table `mstransaction`
--
ALTER TABLE `mstransaction`
  ADD PRIMARY KEY (`transID`),
  ADD KEY `checkUserID` (`userID`);

--
-- Indexes for table `msuser`
--
ALTER TABLE `msuser`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `trpassenger`
--
ALTER TABLE `trpassenger`
  ADD PRIMARY KEY (`passengerID`),
  ADD KEY `cekTransID` (`transID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mscity`
--
ALTER TABLE `mscity`
  MODIFY `cityID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `msticket`
--
ALTER TABLE `msticket`
  MODIFY `ticketID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mstransaction`
--
ALTER TABLE `mstransaction`
  MODIFY `transID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `msuser`
--
ALTER TABLE `msuser`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trpassenger`
--
ALTER TABLE `trpassenger`
  MODIFY `passengerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mstransaction`
--
ALTER TABLE `mstransaction`
  ADD CONSTRAINT `checkUserID` FOREIGN KEY (`userID`) REFERENCES `msuser` (`userID`) ON UPDATE NO ACTION;

--
-- Constraints for table `trpassenger`
--
ALTER TABLE `trpassenger`
  ADD CONSTRAINT `cekTransID` FOREIGN KEY (`transID`) REFERENCES `mstransaction` (`transID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
