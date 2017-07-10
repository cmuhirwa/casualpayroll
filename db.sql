-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 10, 2017 at 12:07 AM
-- Server version: 5.5.55-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `casualpayroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `managerCode` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `createdBy` int(11) NOT NULL,
  `updatedDate` date NOT NULL,
  `updatedBy` int(11) NOT NULL,
  `archivedDate` date NOT NULL,
  `archivedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `managerCode`, `createdDate`, `createdBy`, `updatedDate`, `updatedBy`, `archivedDate`, `archivedBy`) VALUES
(1, 'Kimironko', 1, '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `casuals`
--

CREATE TABLE IF NOT EXISTS `casuals` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `nid` varchar(30) NOT NULL,
  `categoryCode` int(11) NOT NULL,
  `branchCode` int(11) NOT NULL,
  `createDate` date NOT NULL,
  `createdBy` int(11) NOT NULL,
  `updatedDate` date NOT NULL,
  `updatedBy` int(11) NOT NULL,
  `archivedDate` date NOT NULL,
  `archivedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `casuals`
--

INSERT INTO `casuals` (`id`, `name`, `phone`, `nid`, `categoryCode`, `branchCode`, `createDate`, `createdBy`, `updatedDate`, `updatedBy`, `archivedDate`, `archivedBy`) VALUES
(1, 'Erik', '0788558877', '1179520458870014', 2, 1, '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0),
(2, 'Vicent', '07854552', '20973092', 1, 1, '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `casualview`
--
CREATE TABLE IF NOT EXISTS `casualview` (
`name` varchar(30)
,`phone` varchar(30)
,`nid` varchar(30)
,`categoryCode` int(11)
,`branchCode` int(11)
,`categoty` varchar(30)
,`condition` varchar(30)
,`amount` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL,
  `condition` varchar(30) NOT NULL,
  `createdDate` date NOT NULL,
  `createdBy` int(11) NOT NULL,
  `updatedDate` date NOT NULL,
  `updatedBy` int(11) NOT NULL,
  `archivedDate` date NOT NULL,
  `archivedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `amount`, `condition`, `createdDate`, `createdBy`, `updatedDate`, `updatedBy`, `archivedDate`, `archivedBy`) VALUES
(1, 'Casuals', 5000, 'Daily', '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0),
(2, 'StaffA', 150000, 'monthly', '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0),
(3, 'StaffB', 280000, 'monthly', '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0),
(4, 'StaffC', 320000, 'monthly', '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE IF NOT EXISTS `payroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payfrom` date NOT NULL,
  `payto` date NOT NULL,
  `status1` varchar(30) NOT NULL,
  `status2` varchar(30) NOT NULL,
  `status3` varchar(30) NOT NULL,
  `createDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `payfrom`, `payto`, `status1`, `status2`, `status3`, `createDate`) VALUES
(1, '2017-01-01', '2017-01-31', 'approved', 'approved', 'approved', '2017-01-31'),
(2, '2017-02-01', '2017-02-28', 'approved', 'approved', 'approved', '2017-02-28'),
(3, '2017-03-01', '2017-03-31', 'approved', 'approved', 'approved', '2017-03-31'),
(4, '2017-04-01', '2017-04-30', 'approved', 'approved', 'approved', '2017-04-30'),
(5, '2017-05-01', '2017-05-31', 'approved', 'approved', 'approved', '2017-05-31'),
(6, '2017-06-01', '2017-06-30', 'approved', 'approved', 'approved', '2017-06-30');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Payrolls`
--
CREATE TABLE IF NOT EXISTS `Payrolls` (
`payfrom` date
,`payto` date
,`payrollId` varchar(11)
,`casuals` bigint(21)
,`SUM(total)` decimal(42,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `payrollTransactions`
--
CREATE TABLE IF NOT EXISTS `payrollTransactions` (
`name` varchar(30)
,`categoty` varchar(30)
,`condition` varchar(30)
,`amount` int(11)
,`multiples` int(11)
,`total` bigint(21)
,`payrollId` varchar(11)
,`payfrom` date
,`payto` date
,`status` varchar(30)
);
-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `casualCode` bigint(50) NOT NULL,
  `multiples` int(11) NOT NULL,
  `payrollId` varchar(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `transactionId` varchar(30) NOT NULL,
  `createdDate` date NOT NULL,
  `createdBy` int(11) NOT NULL,
  `updatedDate` date NOT NULL,
  `updatedBy` int(11) NOT NULL,
  `archivedDate` date NOT NULL,
  `archivedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `casualCode`, `multiples`, `payrollId`, `status`, `transactionId`, `createdDate`, `createdBy`, `updatedDate`, `updatedBy`, `archivedDate`, `archivedBy`) VALUES
(1, 1, 1, '3', 'approved', '1145', '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0),
(2, 1, 1, '1', 'rejected', '1', '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0),
(3, 2, 17, '3', 'approved', '1', '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0),
(4, 1, 12, '2', 'waiting', '1', '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0),
(5, 1, 21, '2', 'approved', '1', '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `level` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `lastlogedIn` date NOT NULL,
  `createdDate` date NOT NULL,
  `createdBy` int(11) NOT NULL,
  `updatedDate` date NOT NULL,
  `updatedBy` int(11) NOT NULL,
  `archivedDate` date NOT NULL,
  `archivedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `username`, `password`, `level`, `status`, `lastlogedIn`, `createdDate`, `createdBy`, `updatedDate`, `updatedBy`, `archivedDate`, `archivedBy`) VALUES
(1, 'Clement MUHIRWA', 'muhirwaclement@gmail.com', '0784848236', 'cmuhirwa', 'clement123', 'admin', 'active', '2017-07-09', '2017-07-09', 1, '0000-00-00', 0, '0000-00-00', 0),
(2, 'test', 'test@test.test', '078', 'test', 'test', 'test', 'test', '2017-07-09', '0000-00-00', 0, '0000-00-00', 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Structure for view `casualview`
--
DROP TABLE IF EXISTS `casualview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `casualview` AS select `cs`.`name` AS `name`,`cs`.`phone` AS `phone`,`cs`.`nid` AS `nid`,`cs`.`categoryCode` AS `categoryCode`,`cs`.`branchCode` AS `branchCode`,`ct`.`name` AS `categoty`,`ct`.`condition` AS `condition`,`ct`.`amount` AS `amount` from (`casuals` `cs` join `categories` `ct` on((`ct`.`id` = `cs`.`categoryCode`))) where 1;

-- --------------------------------------------------------

--
-- Structure for view `Payrolls`
--
DROP TABLE IF EXISTS `Payrolls`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Payrolls` AS select `payrollTransactions`.`payfrom` AS `payfrom`,`payrollTransactions`.`payto` AS `payto`,`payrollTransactions`.`payrollId` AS `payrollId`,count(`payrollTransactions`.`name`) AS `casuals`,sum(`payrollTransactions`.`total`) AS `SUM(total)` from `payrollTransactions` group by `payrollTransactions`.`payrollId`;

-- --------------------------------------------------------

--
-- Structure for view `payrollTransactions`
--
DROP TABLE IF EXISTS `payrollTransactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `payrollTransactions` AS select `cs`.`name` AS `name`,`ct`.`name` AS `categoty`,`ct`.`condition` AS `condition`,`ct`.`amount` AS `amount`,`tr`.`multiples` AS `multiples`,(`ct`.`amount` * `tr`.`multiples`) AS `total`,`tr`.`payrollId` AS `payrollId`,`pr`.`payfrom` AS `payfrom`,`pr`.`payto` AS `payto`,`tr`.`status` AS `status` from (((`transactions` `tr` join `casuals` `cs` on((`cs`.`id` = `tr`.`casualCode`))) join `categories` `ct` on((`ct`.`id` = `cs`.`categoryCode`))) join `payroll` `pr` on((`pr`.`id` = `tr`.`payrollId`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
