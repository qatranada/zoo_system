-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2023 at 12:56 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zoo_system_qatra`
--

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE `animal` (
  `animal_id` int(11) NOT NULL,
  `animal_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `zoo_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `costumer_visit`
--

CREATE TABLE `costumer_visit` (
  `visit_number` int(11) NOT NULL,
  `visit_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `zoo_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `address` varchar(60) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `maintenance_number` int(11) NOT NULL,
  `maintenance_date` date NOT NULL,
  `worker_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tour_schedule`
--

CREATE TABLE `tour_schedule` (
  `tour_name` varchar(20) NOT NULL,
  `tour_date` date NOT NULL,
  `costumer_id` int(11) NOT NULL,
  `zoo_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker`
--

CREATE TABLE `worker` (
  `worker_id` int(11) NOT NULL,
  `worker_name` varchar(30) NOT NULL,
  `hire_date` date NOT NULL,
  `zoo_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worker_schedule`
--

CREATE TABLE `worker_schedule` (
  `work_date` date NOT NULL,
  `worker_id` int(11) NOT NULL,
  `schedule_hours` int(11) NOT NULL,
  `work_details` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zoo`
--

CREATE TABLE `zoo` (
  `zoo_name` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`animal_id`),
  ADD KEY `zoo_name` (`zoo_name`);

--
-- Indexes for table `costumer_visit`
--
ALTER TABLE `costumer_visit`
  ADD PRIMARY KEY (`visit_number`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `zoo_name` (`zoo_name`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`maintenance_number`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- Indexes for table `tour_schedule`
--
ALTER TABLE `tour_schedule`
  ADD PRIMARY KEY (`tour_name`),
  ADD KEY `zoo_name` (`zoo_name`),
  ADD KEY `costumer_id` (`costumer_id`);

--
-- Indexes for table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`worker_id`),
  ADD KEY `zoo_name` (`zoo_name`);

--
-- Indexes for table `worker_schedule`
--
ALTER TABLE `worker_schedule`
  ADD PRIMARY KEY (`work_date`,`worker_id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `zoo`
--
ALTER TABLE `zoo`
  ADD PRIMARY KEY (`zoo_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`zoo_name`) REFERENCES `zoo` (`zoo_name`);

--
-- Constraints for table `costumer_visit`
--
ALTER TABLE `costumer_visit`
  ADD CONSTRAINT `costumer_visit_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `costumer_visit_ibfk_2` FOREIGN KEY (`zoo_name`) REFERENCES `zoo` (`zoo_name`);

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`worker_id`),
  ADD CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`);

--
-- Constraints for table `tour_schedule`
--
ALTER TABLE `tour_schedule`
  ADD CONSTRAINT `tour_schedule_ibfk_1` FOREIGN KEY (`zoo_name`) REFERENCES `zoo` (`zoo_name`),
  ADD CONSTRAINT `tour_schedule_ibfk_2` FOREIGN KEY (`costumer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`zoo_name`) REFERENCES `zoo` (`zoo_name`);

--
-- Constraints for table `worker_schedule`
--
ALTER TABLE `worker_schedule`
  ADD CONSTRAINT `worker_schedule_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`worker_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
