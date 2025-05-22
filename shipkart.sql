-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2022 at 11:00 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shipkart`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Qno` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Qno`, `name`, `email`, `subject`) VALUES
(1, 'Mohan', 'mohan@gmail.com', 'Hello,\r\n\r\nI need a quote for a 200kg item which needs to be shipped within 4 days. \r\n\r\nThanks!');

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `courier_id` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `length` int(6) NOT NULL,
  `height` int(6) NOT NULL,
  `courier_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `quote_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courier`
--

INSERT INTO `courier` (`courier_id`, `price`, `length`, `height`, `courier_time`, `quote_id`) VALUES
(1, '5520', 30, 50, '2022-05-18 20:51:56', 1),
(2, '3862', 20, 40, '2022-05-18 21:01:31', 2),
(3, '2734', 42, 23, '2022-05-18 21:06:50', 3),
(4, '2215', 34, 45, '2022-05-19 05:06:26', 4),
(5, '1635', 25, 30, '2022-05-22 13:12:07', 5),
(6, '3075', 30, 60, '2022-06-03 11:56:19', 6);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cu_name` varchar(30) NOT NULL,
  `cu_phone_no` bigint(20) NOT NULL,
  `cu_email_id` varchar(30) NOT NULL,
  `cu_address` varchar(200) NOT NULL,
  `pickup_date` text NOT NULL,
  `quote_id` int(11) NOT NULL,
  `courier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cu_name`, `cu_phone_no`, `cu_email_id`, `cu_address`, `pickup_date`, `quote_id`, `courier_id`) VALUES
('Karan', 9828856792, 'karan@gmail.com', 'Flat 13, HP Building, Ashok Nagar, Udaipur (313001)', '2022-05-25', 1, 1),
('Ali', 7023990624, 'ali124@yahoo.com', '302, Neemach Kheda, Udaipur', '2022-06-12', 2, 2),
('Rohit', 8523409727, 'rohit123@gmail.com', 'House 23, ABC road, Mumbai, Maharashtra', '2022-07-08', 3, 3),
('huzaifa', 9828084803, 'huzaifa@gmail.com', '322, kharol colony, Udaipur, Rajasthan', '2022-06-17', 4, 4),
('Aman', 8723502845, 'aman19@yahoo.com', '67, R.K circle, Udaipur, Rajasthan ', '2022-06-23', 5, 5),
('huzaifa pachisa', 917023886253, 'pachisahuzaifa@gmail.com', '322 kharol colony fatehpura', '2022-06-17', 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` varchar(20) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `password` varchar(15) NOT NULL,
  `designation` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `emp_id`, `password`, `designation`) VALUES
('huzaifa@shipkart.com', 101, 'huzzy25a', 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `quote`
--

CREATE TABLE `quote` (
  `quote_id` int(11) NOT NULL,
  `f_pincode` int(6) DEFAULT NULL,
  `t_pincode` int(6) DEFAULT NULL,
  `weight` int(5) DEFAULT NULL,
  `delivery_service` varchar(11) DEFAULT NULL,
  `price` decimal(13,2) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quote`
--

INSERT INTO `quote` (`quote_id`, `f_pincode`, `t_pincode`, `weight`, `delivery_service`, `price`, `date`) VALUES
(1, 567890, 564321, 60, 'Best', '5519.90', '2022-05-19 02:19:31'),
(2, 560987, 561234, 85, 'Economy', '3862.40', '2022-05-19 02:27:45'),
(3, 562458, 569764, 20, 'Speed', '2733.55', '2022-05-19 02:34:08'),
(4, 569719, 568220, 48, 'Economy', '2215.07', '2022-05-19 10:35:56'),
(5, 560864, 561357, 18, 'Best', '1635.48', '2022-05-22 18:37:54'),
(6, 566666, 577777, 67, 'Economy', '3075.30', '2022-06-03 17:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `reciever`
--

CREATE TABLE `reciever` (
  `r_name` varchar(30) NOT NULL,
  `r_phone_no` bigint(20) NOT NULL,
  `r_email_id` varchar(50) NOT NULL,
  `r_address` varchar(300) NOT NULL,
  `delivery_date` date NOT NULL,
  `courier_id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reciever`
--

INSERT INTO `reciever` (`r_name`, `r_phone_no`, `r_email_id`, `r_address`, `delivery_date`, `courier_id`, `quote_id`) VALUES
('Arjun', 9828084803, 'arjun@yahoo.com', 'House 21, Kharol Colony, Fatehpura, Udaipur (313001)', '2022-05-27', 1, 1),
('Mustafa', 8948876234, 'mustafa25@gmail.com', '144, Lane C, Shobha Nagar, Indore', '2022-06-16', 2, 2),
('Mohit', 9723476589, 'mohit@gmail.com', 'Flat 34, MG road, Surat, Gujarat', '2022-07-09', 3, 3),
('kaushal', 9823898736, 'kaushal@gmail.com', '4, ashok nagar, udaiur, Rajasthan', '2022-06-21', 4, 4),
('Soham', 7038479234, 'soham23@gmail.com', '20, Shastri Circle, Udaipur, Rajasthan', '2022-06-25', 5, 5),
('mufaddal', 918934573495, 'pachisahuzaifa@gmail.com', '176, Bhopalpura, Udaipur', '2022-06-21', 6, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`Qno`);

--
-- Indexes for table `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`courier_id`),
  ADD KEY `courier_id` (`courier_id`),
  ADD KEY `price` (`price`),
  ADD KEY `quote_id` (`quote_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`courier_id`),
  ADD KEY `customer_id` (`courier_id`),
  ADD KEY `quote_id` (`quote_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `quote`
--
ALTER TABLE `quote`
  ADD PRIMARY KEY (`quote_id`),
  ADD KEY `price` (`price`);

--
-- Indexes for table `reciever`
--
ALTER TABLE `reciever`
  ADD PRIMARY KEY (`courier_id`),
  ADD KEY `courier_id` (`courier_id`),
  ADD KEY `quote_id` (`quote_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `Qno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courier`
--
ALTER TABLE `courier`
  MODIFY `courier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `courier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quote`
--
ALTER TABLE `quote`
  MODIFY `quote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reciever`
--
ALTER TABLE `reciever`
  MODIFY `courier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
