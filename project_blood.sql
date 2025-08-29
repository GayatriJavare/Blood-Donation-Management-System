-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2025 at 07:59 AM
-- Server version: 11.8.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_blood`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`name`, `pass`) VALUES
('admin', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `create_campain`
--

CREATE TABLE `create_campain` (
  `c_name` varchar(255) NOT NULL,
  `o_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `loca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `create_campain`
--

INSERT INTO `create_campain` (`c_name`, `o_name`, `date`, `time`, `loca`) VALUES
('blood donation', 'raj', '2025-02-21', '05:22', 'nashik'),
('blood campain', 'neha', '202525-02-22', '02:02', 'mumbai'),
('save lifes', 'neha', '2025-12-12', '02:25', 'bhadgon'),
('blood donation', 'vishal', '2025-12-26', '03:06', 'loan');

-- --------------------------------------------------------

--
-- Table structure for table `donor_information`
--

CREATE TABLE `donor_information` (
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `groupb` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor_information`
--

INSERT INTO `donor_information` (`name`, `address`, `number`, `gender`, `groupb`, `email`, `id`) VALUES
('anju jaware', 'Lon PiracheTal Bhadgaon', '9699562662', 'Female', 'O+', 'anju@gamil.com', 1),
('Gayatri Jaware', 'nashik', '1236547899', 'Female', 'AB+', 'gayatri@gmail.com', 2),
('Raj Jaware', 'pune', '2589631475', 'Male', 'O-', 'raj@gmail.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`name`, `password`) VALUES
('Raj', '123'),
('anju', '1512'),
('bala', '123'),
('vijay patil', 'Vijay@123'),
('abc', 'abc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donor_information`
--
ALTER TABLE `donor_information`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donor_information`
--
ALTER TABLE `donor_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
