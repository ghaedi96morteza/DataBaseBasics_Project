-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2019 at 09:19 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databasebasic_project`
--
CREATE DATABASE IF NOT EXISTS `databasebasic_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `databasebasic_project`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `InserIntoBoats`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InserIntoBoats` (IN `name` VARCHAR(50), IN `color` VARCHAR(50))  INSERT INTO boats (boats.name,boats.color) VALUES (name,color)$$

DROP PROCEDURE IF EXISTS `InserIntoSailors`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InserIntoSailors` (IN `name` VARCHAR(50), IN `birth` DATE, IN `grade` INT)  INSERT INTO sailors (sailors.name,sailors.birth,sailors.grade) VALUES (name,birth,grade)$$

DROP PROCEDURE IF EXISTS `InsertIntoReservation`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertIntoReservation` (IN `incdate` DATE, IN `expdate` DATE, IN `scode` INT, IN `bcode` INT)  INSERT INTO reservation (reservation.reservedate,reservation.expiredate,reservation.sailorscode,reservation.boatscode) VALUES (incdate,expdate,scode,bcode)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `boats`
--

DROP TABLE IF EXISTS `boats`;
CREATE TABLE `boats` (
  `name` varchar(50) NOT NULL,
  `code` int(11) NOT NULL,
  `color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `boats`
--

INSERT INTO `boats` (`name`, `code`, `color`) VALUES
('salar', 0, 'blue');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `reservecode` int(11) NOT NULL,
  `reservedate` date DEFAULT NULL,
  `expiredate` date DEFAULT NULL,
  `sailorscode` int(11) DEFAULT NULL,
  `boatscode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservecode`, `reservedate`, `expiredate`, `sailorscode`, `boatscode`) VALUES
(1, '2019-12-06', '2019-12-31', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sailors`
--

DROP TABLE IF EXISTS `sailors`;
CREATE TABLE `sailors` (
  `name` varchar(50) NOT NULL,
  `code` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sailors`
--

INSERT INTO `sailors` (`name`, `code`, `grade`, `birth`) VALUES
('ali', 1, 10, '2019-07-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boats`
--
ALTER TABLE `boats`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservecode`),
  ADD KEY `sailorscode` (`sailorscode`),
  ADD KEY `boatscode` (`boatscode`);

--
-- Indexes for table `sailors`
--
ALTER TABLE `sailors`
  ADD PRIMARY KEY (`code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`sailorscode`) REFERENCES `sailors` (`code`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`boatscode`) REFERENCES `boats` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
