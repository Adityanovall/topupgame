-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2024 at 05:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gametopup`
--

-- --------------------------------------------------------

--
-- Table structure for table `gamedeveloperrelations`
--

CREATE TABLE `gamedeveloperrelations` (
  `game_id` int(11) NOT NULL,
  `developer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamedeveloperrelations`
--

INSERT INTO `gamedeveloperrelations` (`game_id`, `developer_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `gamedevelopers`
--

CREATE TABLE `gamedevelopers` (
  `developer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamedevelopers`
--

INSERT INTO `gamedevelopers` (`developer_id`, `name`, `contact_email`) VALUES
(1, 'Hoyoverse', 'contact@hoyoverse.com'),
(2, 'Riot', 'info@riot.com'),
(3, 'Moonton', 'support@moonton.com'),
(4, 'Supercell', 'support@supercell.com'),
(5, 'EA', 'service@EA.com');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `game_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`game_id`, `name`, `genre`) VALUES
(1, 'Genshin Impact', 'RPG'),
(2, 'Valorant', 'FPS'),
(3, 'Mobile Legends', 'MOBA'),
(4, 'Clash of Clans', 'Strategy'),
(5, 'EA Sports FC', 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethods`
--

CREATE TABLE `paymentmethods` (
  `payment_method_id` int(11) NOT NULL,
  `method_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paymentmethods`
--

INSERT INTO `paymentmethods` (`payment_method_id`, `method_name`) VALUES
(1, 'Credit Card'),
(2, 'Dana'),
(3, 'Bank Transfer'),
(4, 'OVO'),
(5, 'Gopay');

-- --------------------------------------------------------

--
-- Table structure for table `topups`
--

CREATE TABLE `topups` (
  `topup_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `topup_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topups`
--

INSERT INTO `topups` (`topup_id`, `user_id`, `game_id`, `payment_method_id`, `topup_date`, `amount`) VALUES
(1, 1, 1, 1, '2024-01-10', 50000.00),
(2, 2, 2, 2, '2024-02-15', 20000.00),
(3, 3, 3, 3, '2024-03-05', 30000.00),
(4, 4, 4, 4, '2024-04-20', 40000.00),
(5, 5, 5, 5, '2024-05-25', 25000.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Agus', 'Candra', 'aguscandra@gmail.com'),
(2, 'Ahmad', 'Abiyyu', 'ahmadabiyyu@gmail.com'),
(3, 'Wardita', 'Winaya', 'wardita.winaya@gmail.com'),
(4, 'Al', 'Najib', 'al.najib@gmail.com'),
(5, 'Rival', 'Rasyid', 'rivalrasyid@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gamedeveloperrelations`
--
ALTER TABLE `gamedeveloperrelations`
  ADD PRIMARY KEY (`game_id`,`developer_id`),
  ADD KEY `developer_id` (`developer_id`);

--
-- Indexes for table `gamedevelopers`
--
ALTER TABLE `gamedevelopers`
  ADD PRIMARY KEY (`developer_id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`game_id`);

--
-- Indexes for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexes for table `topups`
--
ALTER TABLE `topups`
  ADD PRIMARY KEY (`topup_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `payment_method_id` (`payment_method_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gamedevelopers`
--
ALTER TABLE `gamedevelopers`
  MODIFY `developer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `topups`
--
ALTER TABLE `topups`
  MODIFY `topup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gamedeveloperrelations`
--
ALTER TABLE `gamedeveloperrelations`
  ADD CONSTRAINT `gamedeveloperrelations_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  ADD CONSTRAINT `gamedeveloperrelations_ibfk_2` FOREIGN KEY (`developer_id`) REFERENCES `gamedevelopers` (`developer_id`);

--
-- Constraints for table `topups`
--
ALTER TABLE `topups`
  ADD CONSTRAINT `topups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `topups_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  ADD CONSTRAINT `topups_ibfk_3` FOREIGN KEY (`payment_method_id`) REFERENCES `paymentmethods` (`payment_method_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
