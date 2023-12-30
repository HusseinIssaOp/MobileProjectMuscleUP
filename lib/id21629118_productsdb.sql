-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 30, 2023 at 01:49 PM
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
(7, 'hawraa', 'ali', 'akkar', 'main', '21', '81746352', 'Protien - Quantity: 1\nCreatine - Quantity: 1\nC4 Energy Drink - Quantity: 2', '2023-12-29 16:00:34', 160.00);

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
-- Indexes for table `Supplies`
--
ALTER TABLE `Supplies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `checkout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Supplies`
--
ALTER TABLE `Supplies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
-- ALTER TABLE `products`
--   ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
