-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2024 at 08:40 AM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTopUpHistory` (IN `userId` INT, IN `gameId` INT)   BEGIN
    SELECT * FROM TopUps WHERE user_id = userId AND game_id = gameId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserEmails` ()   BEGIN
    SELECT email FROM Users;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getTotalTopUp` (`userId` INT, `gameId` INT) RETURNS DECIMAL(10,2)  BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(amount) INTO total FROM TopUps WHERE user_id = userId AND game_id = gameId;
    RETURN total;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getTotalUsers` () RETURNS INT(11)  BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM Users;
    RETURN total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `activetopups`
-- (See below for the actual view)
--
CREATE TABLE `activetopups` (
`user_id` int(11)
,`game_id` int(11)
,`amount` decimal(10,2)
);

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
-- Table structure for table `topuplogs`
--

CREATE TABLE `topuplogs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `action` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topuplogs`
--

INSERT INTO `topuplogs` (`log_id`, `user_id`, `game_id`, `amount`, `action`) VALUES
(1, 1, 1, 50000.00, 'INSERT'),
(2, 1, 1, 20000.00, 'INSERT'),
(3, 1, 1, 15000.00, 'UPDATE'),
(4, 1, 1, 15000.00, 'UPDATE'),
(5, 1, 1, 15000.00, 'UPDATE'),
(6, 1, 1, 50000.00, 'INSERT'),
(7, 1, 1, 30000.00, 'UPDATE'),
(8, 1, 1, 30000.00, 'UPDATE'),
(9, 1, 1, 30000.00, 'UPDATE'),
(10, 1, 1, 30000.00, 'UPDATE'),
(11, 1, 1, 30000.00, 'DELETE'),
(12, 1, 1, 30000.00, 'DELETE'),
(13, 1, 1, 30000.00, 'DELETE'),
(14, 1, 1, 30000.00, 'DELETE'),
(15, 1, 1, 30000.00, 'DELETE'),
(16, 1, 1, 30000.00, 'DELETE'),
(17, 1, 1, 30000.00, 'DELETE'),
(18, 1, 1, 30000.00, 'DELETE');

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
(2, 2, 2, 2, '2024-02-15', 20000.00),
(3, 3, 3, 3, '2024-03-05', 30000.00),
(4, 4, 4, 4, '2024-04-20', 40000.00),
(5, 5, 5, 5, '2024-05-25', 25000.00);

--
-- Triggers `topups`
--
DELIMITER $$
CREATE TRIGGER `after_topup_delete` AFTER DELETE ON `topups` FOR EACH ROW BEGIN
    INSERT INTO TopUpLogs (user_id, game_id, amount, action) 
    VALUES (OLD.user_id, OLD.game_id, OLD.amount, 'DELETE');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_topup_insert` AFTER INSERT ON `topups` FOR EACH ROW BEGIN
    INSERT INTO TopUpLogs (user_id, game_id, amount, action) 
    VALUES (NEW.user_id, NEW.game_id, NEW.amount, 'INSERT');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_topup_update` AFTER UPDATE ON `topups` FOR EACH ROW BEGIN
    INSERT INTO TopUpLogs (user_id, game_id, amount, action) 
    VALUES (NEW.user_id, NEW.game_id, NEW.amount, 'UPDATE');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_topup_delete` BEFORE DELETE ON `topups` FOR EACH ROW BEGIN
    INSERT INTO TopUpLogs (user_id, game_id, amount, action) 
    VALUES (OLD.user_id, OLD.game_id, OLD.amount, 'DELETE');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_topup_insert` BEFORE INSERT ON `topups` FOR EACH ROW BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Top-up amount must be positive';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_topup_update` BEFORE UPDATE ON `topups` FOR EACH ROW BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Top-up amount must be positive';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `useremails`
-- (See below for the actual view)
--
CREATE TABLE `useremails` (
`first_name` varchar(50)
,`last_name` varchar(50)
,`email` varchar(100)
);

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

-- --------------------------------------------------------

--
-- Stand-in structure for view `usertopups`
-- (See below for the actual view)
--
CREATE TABLE `usertopups` (
`user_id` int(11)
,`game_id` int(11)
,`amount` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Structure for view `activetopups`
--
DROP TABLE IF EXISTS `activetopups`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activetopups`  AS SELECT `usertopups`.`user_id` AS `user_id`, `usertopups`.`game_id` AS `game_id`, `usertopups`.`amount` AS `amount` FROM `usertopups` WHERE `usertopups`.`amount` > 10WITH CASCADEDCHECK OPTION  ;

-- --------------------------------------------------------

--
-- Structure for view `useremails`
--
DROP TABLE IF EXISTS `useremails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `useremails`  AS SELECT `users`.`first_name` AS `first_name`, `users`.`last_name` AS `last_name`, `users`.`email` AS `email` FROM `users` ;

-- --------------------------------------------------------

--
-- Structure for view `usertopups`
--
DROP TABLE IF EXISTS `usertopups`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usertopups`  AS SELECT `topups`.`user_id` AS `user_id`, `topups`.`game_id` AS `game_id`, `topups`.`amount` AS `amount` FROM `topups` ;

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
-- Indexes for table `topuplogs`
--
ALTER TABLE `topuplogs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`,`game_id`);

--
-- Indexes for table `topups`
--
ALTER TABLE `topups`
  ADD PRIMARY KEY (`topup_id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `payment_method_id` (`payment_method_id`),
  ADD KEY `idx_user_game` (`user_id`,`game_id`),
  ADD KEY `idx_date_amount` (`topup_date`,`amount`);

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
-- AUTO_INCREMENT for table `topuplogs`
--
ALTER TABLE `topuplogs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `topups`
--
ALTER TABLE `topups`
  MODIFY `topup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
