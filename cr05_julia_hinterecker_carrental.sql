-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2019 at 11:25 AM
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
-- Database: `cr05_julia_hinterecker_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additionalfee`
--

CREATE TABLE `additionalfee` (
  `addFeeID` int(11) NOT NULL,
  `addfee_name` varchar(500) NOT NULL,
  `addfee_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `additionalfee`
--

INSERT INTO `additionalfee` (`addFeeID`, `addfee_name`, `addfee_price`) VALUES
(1, 'Late Drop Off', 30),
(2, 'Empty Gas', 50),
(3, 'Brocken Radio', 40),
(4, 'Brocken Heater', 80),
(5, 'Dirty Inside', 30),
(6, 'Dirty Outside', 20);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `carID` int(11) NOT NULL,
  `car_model` varchar(50) NOT NULL,
  `car_color` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`carID`, `car_model`, `car_color`) VALUES
(1, 'Toyota', 'yellow'),
(2, 'Ferrari', 'green'),
(3, 'DeLorean', 'black'),
(4, 'Tesla', 'gray'),
(5, 'Trabant', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_adresse` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `customer_name`, `customer_adresse`) VALUES
(1, 'john doe', '1001 helldrive,usa'),
(2, 'Jane Doe', '1001 Heavendrive, USA'),
(3, 'Hannibal Lecter', '2002 Helldrive, USA'),
(4, 'Captain America', '2002 Heavendrive, USA'),
(5, 'Francis Dolarhyde', '3003 Helldrive, USA');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceID` int(11) NOT NULL,
  `invoice_price` float DEFAULT NULL,
  `customerID` int(11) NOT NULL,
  `reservationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoiceID`, `invoice_price`, `customerID`, `reservationID`) VALUES
(1, 20, 1, 1),
(2, 30.5, 2, 2),
(3, 35, 3, 3),
(4, 38.5, 4, 4),
(5, 40, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locationID` int(11) NOT NULL,
  `location_adresse` varchar(500) DEFAULT NULL,
  `carID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationID`, `location_adresse`, `carID`) VALUES
(1, 'Disneyland', 1),
(2, 'Burgerking', 2),
(3, 'Hollywood', 3),
(4, 'Quantico, FBI Headquarter', 4),
(5, 'Hollywood', 5);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservationID` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `customerID` int(11) NOT NULL,
  `carID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservationID`, `startdate`, `enddate`, `customerID`, `carID`) VALUES
(1, '0000-00-00', '0000-00-00', 1, 0),
(2, '0000-00-00', '0000-00-00', 2, 0),
(3, '0000-00-00', '0000-00-00', 3, 0),
(4, '0000-00-00', '0000-00-00', 4, 0),
(5, '0000-00-00', '0000-00-00', 5, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additionalfee`
--
ALTER TABLE `additionalfee`
  ADD PRIMARY KEY (`addFeeID`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`carID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `reservationID` (`reservationID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationID`),
  ADD KEY `carID` (`carID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservationID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `carID` (`carID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`reservationID`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`carID`) REFERENCES `car` (`carID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
