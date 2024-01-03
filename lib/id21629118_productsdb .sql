-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 03, 2024 at 08:52 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21629118_productsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

-- CREATE TABLE `categories` (
--   `cid` decimal(8,0) NOT NULL,
--   `name` varchar(50) NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

-- INSERT INTO `categories` (`cid`, `name`) VALUES
-- (1, 'drinks'),
-- (2, 'cheese'),
-- (3, 'cosmatics'),
-- (4, 'electronics'),
-- (33, 'youu'),
-- (76, 'you'),
-- (123, 'hassan'),
-- (700, 'HassanHamdan'),
-- (1231, 'hassan'),
-- (1232, 'huss');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `checkout_id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `selected_products` text DEFAULT NULL,
  `checkout_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `totalprice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`checkout_id`, `fname`, `lname`, `city`, `street`, `building`, `phonenumber`, `selected_products`, `checkout_time`, `totalprice`) VALUES
(4, 'mohmd', 'ali', 'beirut', 'main', '66', '03827164', 'Protien - Quantity: 1\nNitro Tech Series - Quantity: 3', '2023-12-29 15:42:52', 245.00),
(5, 'hussein', 'issa', 'tyre', 'main', '99', '81943928', 'mass Gainer - Quantity: 2\nBurst Pre-Workout - Quantity: 1', '2023-12-29 15:46:34', 165.00),
(6, 'messi', 'alkatwar', 'mall', 'baal', 'issa', '70616921', 'Protien - Quantity: 1', '2023-12-29 15:53:14', 50.00),
(7, 'hawraa', 'ali', 'akkar', 'main', '21', '81746352', 'Protien - Quantity: 1\nCreatine - Quantity: 1\nC4 Energy Drink - Quantity: 2', '2023-12-29 16:00:34', 160.00),
(8, 'hussein', 'issa', 'bekaa', 'main', '21', '81747474', 'mass Gainer - Quantity: 2', '2023-12-31 13:58:21', 120.00),
(9, 'hussein', 'issa', 'gawally', 'main', '21', '81943928', 'Creatine - Quantity: 2\nmass Gainer - Quantity: 3\nC4 Energy Drink - Quantity: 4', '2024-01-03 08:55:21', 400.00),
(10, 'huss', 'iss', 'dsad', 'dsa', 'fds', '11111111', 'Creatine - Quantity: 2', '2024-01-03 20:51:31', 160.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

-- CREATE TABLE `products` (
--   `pid` decimal(8,0) NOT NULL,
--   `name` varchar(100) NOT NULL,
--   `quantity` int(11) NOT NULL,
--   `price` double NOT NULL,
--   `cid` decimal(8,0) DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

-- INSERT INTO `products` (`pid`, `name`, `quantity`, `price`, `cid`) VALUES
-- (101, 'maccaw', 100, 6000, 1),
-- (102, 'iced tea', 90, 3000, 1),
-- (103, 'led light', 20, 20000, 4),
-- (104, 'tooth paste', 80, 10000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `stars_count` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `stars_count`, `name`, `age`, `comment`) VALUES
(1, 5, 'qwewq', 32, 'dasda sa dasd asdasd '),
(2, 4, 'dsad ', 32, 'q rer weqfew fweqf w'),
(3, 1, 'gre g', 43, 'sfd sdf g dgf d'),
(4, 1, 'dsadasd', 21, 'dasdaSD');

-- --------------------------------------------------------

--
-- Table structure for table `Supplies`
--

CREATE TABLE `Supplies` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Supplies`
--

INSERT INTO `Supplies` (`id`, `name`, `price`, `img`) VALUES
(3, 'Protien', 50, 'sup2.jpg'),
(4, 'Creatine', 80, 'sup9.jpg'),
(5, 'mass Gainer', 60, 'sup4.webp'),
(7, 'C4 Energy Drink', 15, 'sup6.webp'),
(8, 'Burst Pre-Workout', 45, 'sup7.jpg'),
(9, 'Nitro Tech Series', 65, 'sup8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

-- CREATE TABLE `user` (
--   `id` int(11) NOT NULL,
--   `first_name` varchar(255) NOT NULL,
--   `last_name` varchar(255) NOT NULL,
--   `email` varchar(255) NOT NULL,
--   `encrypted_password` varchar(255) NOT NULL,
--   `salt` varchar(255) NOT NULL,
--   `city` varchar(255) NOT NULL,
--   `street` varchar(255) NOT NULL,
--   `building` varchar(255) NOT NULL,
--   `phone_number` varchar(20) NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

-- INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `encrypted_password`, `salt`, `city`, `street`, `building`, `phone_number`) VALUES
-- (2, 'hussein', 'issa', 'huss@gmail.com', 'HuAsGueBAg4P8wLNXU4iRQ==', '', 'tyre', 'main', '3rd building', '81943928'),
-- (4, 'adas', 'das', 'luss@gmail.com', '7YwnxAmWgomw+isHhrRScw==', '', 'dsa', 'dsad', 's', '21212121'),
-- (5, 'muss', 'issa', 'muss@gmail.com', 'OET/MMnE1JAM/ehTsBgzHA==', '', 'hsa', 'sf', 'feree', '81940495'),
-- (6, 'asd', 'dsa', 'tuss@gmail.com', 'kkcp3f1cANUMK7t0MMkMCg==', '', 'das', 'fgs', 'gds', '22222222'),
-- (7, 'sad', 'fads', 'zuss@gmail.com', 'kkcp3f1cANUMK7t0MMkMCg==', '', 'ds', 'fds', 'fds', '98109362'),
-- (8, 'dsa', 'dasdd', 'suss@gmail.com', 'kkcp3f1cANUMK7t0MMkMCg==', '', 'ds', 'da', 'd', '12121212'),
-- (12, 'dw', 'ds', 'yuss@gmail.com', 'sOC4riqvH9aWeRjMFwcpYg==', '', 'sd', 'ds', 'ff', '21212121'),
-- (13, 'QWE', 'RE', 'ouss@gmail.com', 'kkcp3f1cANUMK7t0MMkMCg==', '', 'af', 'gd', 'ds', '22222222'),
-- (14, 'qewr', 'rwe', 'juss@gmail.com', 'ZT3NkmJnqPIkMOJdG4bp8Q==', '', 'fsd', 'fs', 'fds', '32323232'),
-- (15, 'wq', 'qw', 'guss@gmail.com', 'ZT3NkmJnqPIkMOJdG4bp8Q==', '', 'wq', 'wq', 'ww', '21212121'),
-- (16, 'dfas', 'ads', 'russ@gmail.com', 'ZT3NkmJnqPIkMOJdG4bp8Q==', '', 'ws', 'sa', 'xz', '21212121'),
-- (19, 'das', 'das', 'das@gmail.com', '', '', 'ds', 'ds', 'ds', '21212121'),
-- (20, 'dsa', 'das', 'd@gmail.com', '84d89877f0d4041efb6bf91a16f0248f2fd573e6af05c19f96bedb9f882f7882', '', 'wq', 'wq', 'wq', '21212121'),
-- (21, 'dw', 'ew', 'q@gmail.com', '0c88cc86a73aa7c4058ff7c0e31d6f105c0ca3575d5a68e060e95d9c84a607a9', '', 'fds', 'fds', 'fsd', '21212121'),
-- (22, 'ds', 'ds', 's@gmail.com', 'e8a434aefc8b73e5c87a9d445893e02c784c59b0993ea38cfe663b7666860de0', '', 'cd', 'cx', 'cx', '21212121'),
-- (23, '', '', '', '', '', '', '', '', ''),
-- (24, '', '', '', '', '', '', '', '', ''),
-- (25, '', '', '', '', '', '', '', '', ''),
-- (26, '', '', '', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
-- ALTER TABLE `categories`
--   ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`checkout_id`);

--
-- Indexes for table `products`
--
-- ALTER TABLE `products`
--   ADD PRIMARY KEY (`pid`),
--   ADD KEY `cid` (`cid`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Supplies`
--
ALTER TABLE `Supplies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
-- ALTER TABLE `user`
--   ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `checkout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Supplies`
--
ALTER TABLE `Supplies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
-- ALTER TABLE `user`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

-- --
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
-- ALTER TABLE `products`
--   ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`);
-- COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
