-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2021 at 08:48 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trymanageforms`
--

-- --------------------------------------------------------

--
-- Table structure for table `addmission`
--

CREATE TABLE `addmission` (
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobno` bigint(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `jee` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `addmission`
--
DELIMITER $$
CREATE TRIGGER `cancel_addmission` BEFORE DELETE ON `addmission` FOR EACH ROW insert into deladd set dtime =now(),first_name=old.first_name,last_name=old.last_name,email=old.email,fname=old.fname
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `deladd`
--

CREATE TABLE `deladd` (
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `dtime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delfaculty`
--

CREATE TABLE `delfaculty` (
  `name` text DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `course` varchar(30) DEFAULT NULL,
  `dtime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_add`
--

CREATE TABLE `faculty_add` (
  `name` text DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobno` bigint(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `paf` varchar(30) DEFAULT NULL,
  `course` varchar(30) DEFAULT NULL,
  `dp` tinyint(4) DEFAULT NULL,
  `exp` tinyint(4) DEFAULT NULL,
  `dcy` tinyint(4) DEFAULT NULL,
  `uni` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `faculty_add`
--
DELIMITER $$
CREATE TRIGGER `cancel_faculty_addmission` BEFORE DELETE ON `faculty_add` FOR EACH ROW insert into delfaculty set dtime =now(),name=old.name,email=old.email,course=old.course
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `sel_faculty`
-- (See below for the actual view)
--
CREATE TABLE `sel_faculty` (
`name` text
,`email` varchar(30)
,`paf` varchar(30)
,`course` varchar(30)
,`dp` tinyint(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sel_students`
-- (See below for the actual view)
--
CREATE TABLE `sel_students` (
`first_name` varchar(30)
,`last_name` varchar(20)
,`email` varchar(50)
,`jee` tinyint(4)
);

-- --------------------------------------------------------

--
-- Structure for view `sel_faculty`
--
DROP TABLE IF EXISTS `sel_faculty`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sel_faculty`  AS SELECT `faculty_add`.`name` AS `name`, `faculty_add`.`email` AS `email`, `faculty_add`.`paf` AS `paf`, `faculty_add`.`course` AS `course`, `faculty_add`.`dp` AS `dp` FROM `faculty_add` WHERE `faculty_add`.`dp` > 85 ;

-- --------------------------------------------------------

--
-- Structure for view `sel_students`
--
DROP TABLE IF EXISTS `sel_students`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sel_students`  AS SELECT `addmission`.`first_name` AS `first_name`, `addmission`.`last_name` AS `last_name`, `addmission`.`email` AS `email`, `addmission`.`jee` AS `jee` FROM `addmission` WHERE `addmission`.`jee` > 80 ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
