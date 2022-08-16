-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 26, 2021 at 07:23 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblautonumber`
--

DROP TABLE IF EXISTS `tblautonumber`;
CREATE TABLE IF NOT EXISTS `tblautonumber` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AUTOSTART` varchar(11) NOT NULL,
  `AUTOINC` int(11) NOT NULL,
  `AUTOEND` int(11) NOT NULL,
  `AUTOKEY` varchar(12) NOT NULL,
  `AUTONUM` int(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblautonumber`
--

INSERT INTO `tblautonumber` (`ID`, `AUTOSTART`, `AUTOINC`, `AUTOEND`, `AUTOKEY`, `AUTONUM`) VALUES
(1, '2017', 1, 67, 'PROID', 10),
(2, '0', 1, 104, 'ordernumber', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

DROP TABLE IF EXISTS `tblcategory`;
CREATE TABLE IF NOT EXISTS `tblcategory` (
  `CATEGID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORIES` varchar(255) NOT NULL,
  PRIMARY KEY (`CATEGID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`CATEGID`, `CATEGORIES`) VALUES
(26, 'Coffee'),
(27, 'Machines'),
(28, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

DROP TABLE IF EXISTS `tblcustomer`;
CREATE TABLE IF NOT EXISTS `tblcustomer` (
  `CUSTOMERID` int(11) NOT NULL AUTO_INCREMENT,
  `FNAME` varchar(30) NOT NULL,
  `LNAME` varchar(30) NOT NULL,
  `CITYADD` text NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `CUSUNAME` varchar(20) NOT NULL,
  `CUSPASS` varchar(90) NOT NULL,
  `CUSPHOTO` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'customer_image/user.png',
  `TERMS` tinyint(4) NOT NULL,
  `DATEJOIN` date NOT NULL,
  PRIMARY KEY (`CUSTOMERID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`CUSTOMERID`, `FNAME`, `LNAME`, `CITYADD`, `GENDER`, `PHONE`, `CUSUNAME`, `CUSPASS`, `CUSPHOTO`, `TERMS`, `DATEJOIN`) VALUES
(1, 'simo', 'srennou', 'rabat', 'Male', '+212689438990', 'ssimo', '12dea96fec20593566ab75692c9949596833adc9', 'customer_image/61wue5TFfTL._AC_SL1500_.jpg', 1, '2015-11-26'),
(10, 'test', 'test', 'Rabat', 'Male', '2', 'test', '51abb9636078defbf888d8457a7c76f85c8f114c', 'customer_image/user.png', 1, '2021-12-17'),
(11, 'test2', 'test2', 'Rabat', 'Male', '2128885894', 'test2', '51abb9636078defbf888d8457a7c76f85c8f114c', 'customer_image/user.png', 1, '2021-12-17');

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

DROP TABLE IF EXISTS `tblorder`;
CREATE TABLE IF NOT EXISTS `tblorder` (
  `ORDERID` int(11) NOT NULL AUTO_INCREMENT,
  `PROID` int(11) NOT NULL,
  `ORDEREDQTY` int(11) NOT NULL,
  `ORDEREDPRICE` double NOT NULL,
  `ORDEREDNUM` int(11) NOT NULL,
  PRIMARY KEY (`ORDERID`),
  KEY `PROID` (`PROID`),
  KEY `ORDEREDNUM` (`ORDEREDNUM`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`ORDERID`, `PROID`, `ORDEREDQTY`, `ORDEREDPRICE`, `ORDEREDNUM`) VALUES
(9, 201754, 1, 63, 100),
(10, 201758, 5, 375, 101),
(11, 201754, 1, 63, 102),
(12, 201759, 1, 600, 103);

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

DROP TABLE IF EXISTS `tblproduct`;
CREATE TABLE IF NOT EXISTS `tblproduct` (
  `PROID` int(11) NOT NULL,
  `PRODESC` varchar(255) DEFAULT NULL,
  `PROQTY` int(11) DEFAULT NULL,
  `ORIGINALPRICE` double NOT NULL,
  `PROPRICE` double DEFAULT NULL,
  `CATEGID` int(11) DEFAULT NULL,
  `IMAGES` varchar(255) DEFAULT NULL,
  `PROSTATS` varchar(30) DEFAULT NULL,
  `OWNERNAME` varchar(90) NOT NULL,
  `OWNERPHONE` varchar(90) NOT NULL,
  PRIMARY KEY (`PROID`),
  KEY `CATEGID` (`CATEGID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`PROID`, `PRODESC`, `PROQTY`, `ORIGINALPRICE`, `PROPRICE`, `CATEGID`, `IMAGES`, `PROSTATS`, `OWNERNAME`, `OWNERPHONE`) VALUES
(201754, 'FOREST ALMOND FLAVOUR                      ', 71, 63, 63, 26, 'uploaded_photos/ww_all_ol_festive_forest_almond_flavour_capsule_002_3q_transpbg_21-xx_1.png', 'Available', 'srennou', '212655223366'),
(201755, 'VIENNA LINIZIO LUNGO', 53, 54, 54, 26, 'uploaded_photos/VIENNA LINIZIO LUNGO.png', 'Available', 'srennou', '21255223366'),
(201756, 'BUENOS AIRES LUNGO', 90, 54, 54, 26, 'uploaded_photos/BUENOS AIRES LUNGO.png', 'Available', 'srennou', '21255994455'),
(201758, 'SHANGHAI LUNGO', 85, 75, 75, 26, 'uploaded_photos/SHANGHAI LUNGO.png', 'Available', 'srennou', '21255889944'),
(201759, 'CitiZ&Milk', 46, 600, 600, 27, 'uploaded_photos/CitiZ&Milk.png', 'Available', 'srennou', '21255447788'),
(201761, 'LATTISSIMA ONE', 4, 3490, 3490, 27, 'uploaded_photos/LATTISSIMA ONE.png', 'Available', 'srennou', '212655889977'),
(201762, 'ESSENZA MINI', 6, 1400, 1400, 27, 'uploaded_photos/ESSENZA MINI.png', 'Available', 'srennou', '212655664422'),
(201763, 'Touch Travel Mug, Gold', 6, 210, 210, 28, 'uploaded_photos/Touch Travel Mug, Gold.png', 'Available', 'srennou', '212655991144'),
(201764, 'AEROCCINO 3', 6, 810, 810, 28, 'uploaded_photos/AEROCCINO 3.png', 'Available', 'srennou', '212655448899'),
(201765, 'VIEW Espresso', 8, 200, 200, 28, 'uploaded_photos/VIEW Espresso.png', 'Available', 'srennou', '212699774433');

-- --------------------------------------------------------

--
-- Table structure for table `tblpromopro`
--

DROP TABLE IF EXISTS `tblpromopro`;
CREATE TABLE IF NOT EXISTS `tblpromopro` (
  `PROMOID` int(11) NOT NULL AUTO_INCREMENT,
  `PROID` int(11) NOT NULL,
  `PRODISCOUNT` double NOT NULL,
  `PRODISPRICE` double NOT NULL,
  PRIMARY KEY (`PROMOID`),
  UNIQUE KEY `PROID` (`PROID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpromopro`
--

INSERT INTO `tblpromopro` (`PROMOID`, `PROID`, `PRODISCOUNT`, `PRODISPRICE`) VALUES
(9, 201754, 0, 63),
(10, 201755, 0, 54),
(11, 201756, 0, 54),
(12, 201757, 0, 70),
(13, 201758, 0, 75),
(14, 201759, 0, 600),
(16, 201761, 0, 3490),
(17, 201762, 10, 1260),
(18, 201763, 0, 210),
(19, 201764, 0, 810),
(20, 201765, 0, 200);

-- --------------------------------------------------------

--
-- Table structure for table `tblsetting`
--

DROP TABLE IF EXISTS `tblsetting`;
CREATE TABLE IF NOT EXISTS `tblsetting` (
  `SETTINGID` int(11) NOT NULL AUTO_INCREMENT,
  `PLACE` text NOT NULL,
  `BRGY` varchar(90) NOT NULL,
  `DELPRICE` double NOT NULL,
  PRIMARY KEY (`SETTINGID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsetting`
--

INSERT INTO `tblsetting` (`SETTINGID`, `PLACE`, `BRGY`, `DELPRICE`) VALUES
(1, 'rabat', 'Brgy. 1', 50),
(2, 'Casablanca', 'Brgy. 1', 70),
(3, 'temara', 'Brgy 1', 20),
(4, 'agadir', 'Brgy 2', 100);

-- --------------------------------------------------------

--
-- Table structure for table `tblsummary`
--

DROP TABLE IF EXISTS `tblsummary`;
CREATE TABLE IF NOT EXISTS `tblsummary` (
  `SUMMARYID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDEREDDATE` datetime NOT NULL,
  `CUSTOMERID` int(11) NOT NULL,
  `ORDEREDNUM` int(11) NOT NULL,
  `DELFEE` double NOT NULL,
  `PAYMENT` double NOT NULL,
  `PAYMENTMETHOD` varchar(30) NOT NULL,
  `ORDEREDSTATS` varchar(30) NOT NULL,
  `ORDEREDREMARKS` varchar(125) NOT NULL,
  `CLAIMEDADTE` datetime NOT NULL,
  `HVIEW` tinyint(4) NOT NULL,
  PRIMARY KEY (`SUMMARYID`),
  UNIQUE KEY `ORDEREDNUM` (`ORDEREDNUM`),
  KEY `CUSTOMERID` (`CUSTOMERID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsummary`
--

INSERT INTO `tblsummary` (`SUMMARYID`, `ORDEREDDATE`, `CUSTOMERID`, `ORDEREDNUM`, `DELFEE`, `PAYMENT`, `PAYMENTMETHOD`, `ORDEREDSTATS`, `ORDEREDREMARKS`, `CLAIMEDADTE`, `HVIEW`) VALUES
(4, '2021-12-17 05:49:42', 10, 101, 20, 375, 'Cash on Delivery', 'Confirmed', 'Your order has been confirmed.', '2021-12-17 00:00:00', 0),
(5, '2021-12-17 05:52:44', 11, 102, 100, 163, 'Cash on Delivery', 'Confirmed', 'Your order has been confirmed.', '2021-12-17 00:00:00', 0),
(6, '2021-12-17 05:53:01', 11, 103, 50, 650, 'Cash on Delivery', 'Confirmed', 'Your order has been confirmed.', '2021-12-17 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbluseraccount`
--

DROP TABLE IF EXISTS `tbluseraccount`;
CREATE TABLE IF NOT EXISTS `tbluseraccount` (
  `USERID` int(11) NOT NULL AUTO_INCREMENT,
  `U_NAME` varchar(122) NOT NULL,
  `U_USERNAME` varchar(122) NOT NULL,
  `U_PASS` varchar(122) NOT NULL,
  `U_ROLE` varchar(30) NOT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluseraccount`
--

INSERT INTO `tbluseraccount` (`USERID`, `U_NAME`, `U_USERNAME`, `U_PASS`, `U_ROLE`) VALUES
(124, 'srennou', 'srennou', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator'),
(128, 'simo', 'simo', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator'),
(129, 'user3', 'user3', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `tblwishlist`
--

DROP TABLE IF EXISTS `tblwishlist`;
CREATE TABLE IF NOT EXISTS `tblwishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CUSID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  `WISHDATE` date NOT NULL,
  `WISHSTATS` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblwishlist`
--

INSERT INTO `tblwishlist` (`id`, `CUSID`, `PROID`, `WISHDATE`, `WISHSTATS`) VALUES
(3, 1, 201754, '2021-12-16', '0'),
(4, 10, 201754, '2021-12-17', '0'),
(5, 10, 201755, '2021-12-17', '0'),
(6, 1, 201759, '2021-12-18', '0');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
