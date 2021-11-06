-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2020 at 06:16 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `canteenmgtsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `canteen`
--

CREATE TABLE `canteen` (
  `Can_Id` char(10) NOT NULL,
  `Can_name` varchar(25) DEFAULT NULL,
  `Cashier_id` char(10) DEFAULT NULL,
  `Food_id` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `Food_name` varchar(25) DEFAULT NULL,
  `Food_id` char(10) NOT NULL,
  `Food_type` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `NSBM_id` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ord`
--

CREATE TABLE `ord` (
  `Ord_id` char(10) NOT NULL,
  `Ord_num` int(11) DEFAULT NULL,
  `Can_Id` char(10) DEFAULT NULL,
  `Food_id` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_id` char(10) NOT NULL,
  `NSBM_id` char(8) DEFAULT NULL,
  `User_name` varchar(25) DEFAULT NULL,
  `User_email` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `canteen`
--
ALTER TABLE `canteen`
  ADD PRIMARY KEY (`Can_Id`),
  ADD UNIQUE KEY `Cashier_id` (`Cashier_id`),
  ADD KEY `Food_id` (`Food_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`Food_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`NSBM_id`),
  ADD UNIQUE KEY `NSBM_id` (`NSBM_id`);

--
-- Indexes for table `ord`
--
ALTER TABLE `ord`
  ADD PRIMARY KEY (`Ord_id`),
  ADD UNIQUE KEY `Can_Id` (`Can_Id`),
  ADD KEY `Food_id` (`Food_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `NSBM_id` (`NSBM_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `canteen`
--
ALTER TABLE `canteen`
  ADD CONSTRAINT `canteen_ibfk_1` FOREIGN KEY (`Can_Id`) REFERENCES `ord` (`Can_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `canteen_ibfk_2` FOREIGN KEY (`Food_id`) REFERENCES `food` (`Food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`NSBM_id`) REFERENCES `user` (`NSBM_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ord`
--
ALTER TABLE `ord`
  ADD CONSTRAINT `ord_ibfk_1` FOREIGN KEY (`Food_id`) REFERENCES `food` (`Food_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`NSBM_id`) REFERENCES `login` (`NSBM_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
