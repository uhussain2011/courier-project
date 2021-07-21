
--
-- Database: `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Introduction to Java', 'Learn all about Java', '2020-03-08 20:11:35'),
(5, 'Introduction to PHP', 'Learn all about PHP', '2020-03-10 21:03:08'),
(6, 'PHP PDO', 'pdo php', '2020-03-10 21:36:20'),
(7, 'Objects', 'Software Crafting', '2020-03-10 22:48:35'),
(8, 'one', 'ONE', '2020-03-10 22:49:36'),
(9, 'tow', 'TWO', '2020-03-10 22:49:36'),
(10, 'three', 'THREE', '2020-03-10 22:49:36'),
(13, 'ones', 'ONEs', '2020-03-10 22:50:25'),
(16, 'onesfvfvfv', 'ONEsededede', '2020-03-10 22:51:08'),
(17, 'towsfvfvrfrf', 'TWOsededed', '2020-03-10 22:51:08'),
(18, 'threesewfwef', 'THREEseded', '2020-03-10 22:51:08');

-- --------------------------------------------------------

--
-- Table structure for table `consignmentsh`
--

CREATE TABLE `consignmentsh` (
  `id` int(200) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `courier_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orders_list_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `consignmentsh`
--

INSERT INTO `consignmentsh` (`id`, `start_date`, `end_date`, `courier_name`, `status`, `file`, `orders_list_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-03-08 10:11:00', '2020-03-21 07:16:07', 'ParcelForce', 'End', 'file/file-1584422888.log', 1, '2020-03-21 07:16:07', '2020-03-21 07:16:07', NULL),
(2, NULL, '2020-03-17 05:07:00', NULL, NULL, NULL, 0, '2020-03-17 05:07:08', '2020-03-17 09:45:04', '2020-03-17 09:45:04'),
(3, NULL, '2020-03-17 05:07:00', NULL, NULL, NULL, 0, '2020-03-17 05:07:18', '2020-03-17 09:45:02', '2020-03-17 09:45:02'),
(4, '2020-03-17 05:07:00', NULL, NULL, NULL, NULL, 0, '2020-03-17 05:07:34', '2020-03-17 09:45:01', '2020-03-17 09:45:01'),
(5, NULL, '2020-03-17 05:08:00', NULL, NULL, NULL, 0, '2020-03-17 05:08:40', '2020-03-17 09:44:59', '2020-03-17 09:44:59'),
(10, NULL, '2020-03-17 05:26:00', NULL, NULL, NULL, 0, '2020-03-17 05:26:45', '2020-03-17 09:44:58', '2020-03-17 09:44:58'),
(11, NULL, '2020-03-17 05:26:00', NULL, NULL, NULL, 0, '2020-03-17 05:26:56', '2020-03-17 09:44:56', '2020-03-17 09:44:56'),
(12, NULL, '2020-03-17 05:27:00', NULL, NULL, NULL, 0, '2020-03-17 05:27:07', '2020-03-17 09:44:55', '2020-03-17 09:44:55'),
(13, NULL, '2020-03-17 05:28:00', NULL, NULL, 'file/file-1584422888.log', NULL, '2020-03-17 05:28:08', '2020-03-17 09:44:53', '2020-03-17 09:44:53'),
(14, '2020-03-17 05:28:00', NULL, NULL, NULL, NULL, NULL, '2020-03-17 05:28:42', '2020-03-17 09:44:51', '2020-03-17 09:44:51'),
(15, '2020-03-17 05:30:00', NULL, 'Royal Mail', NULL, 'file/file-1584423016.log', NULL, '2020-03-17 05:30:16', '2020-03-17 09:44:49', '2020-03-17 09:44:49'),
(16, '2020-03-17 05:30:00', NULL, 'Royal Mail', NULL, 'file/file-1584423025.log', NULL, '2020-03-17 05:30:25', '2020-03-17 09:44:48', '2020-03-17 09:44:48'),
(17, '2020-03-17 09:40:00', NULL, 'Royal Mail', 'Start', 'file/file-1584437499.png', NULL, '2020-03-17 05:30:41', '2020-03-17 09:44:46', '2020-03-17 09:44:46'),
(21, '2020-03-17 10:11:00', NULL, 'ParcelForce', 'Start', NULL, NULL, '2020-03-17 10:11:37', '2020-03-17 10:11:48', '2020-03-17 10:11:48'),
(22, '2020-03-17 10:13:00', '2020-03-17 10:14:00', 'Royal Mail', 'End', NULL, NULL, '2020-03-17 10:13:31', '2020-03-17 10:14:35', '2020-03-17 10:14:35'),
(23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-17 11:19:52', '2020-03-17 11:19:52'),
(24, '2020-03-17 11:20:00', NULL, 'Royal Mail', 'Start', NULL, NULL, '2020-03-17 11:20:31', '2020-03-18 03:57:56', '2020-03-18 03:57:56'),
(25, '2020-03-17 11:30:00', '2020-03-17 11:31:00', 'Royal Mail', 'End', 'file/file-1584444681.jpg', NULL, '2020-03-17 11:30:47', '2020-03-17 11:32:02', '2020-03-17 11:32:02'),
(26, '2020-03-17 11:38:00', '2020-03-17 11:38:00', 'Royal Mail', 'End', 'file/file-1584445122.png', NULL, '2020-03-17 11:38:42', '2020-03-17 11:42:51', '2020-03-17 11:42:51'),
(27, '2020-03-21 07:10:10', NULL, 'Royal Mail', 'Start', NULL, NULL, '2020-03-21 07:10:10', '2020-03-21 07:10:10', NULL),
(28, '2020-03-21 07:17:25', NULL, 'Royal Mail', 'Start', NULL, NULL, '2020-03-21 07:17:25', '2020-03-21 07:17:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consignment_details`
--

CREATE TABLE `consignment_details` (
  `id` int(200) NOT NULL,
  `order_id` int(200) DEFAULT NULL,
  `consignment_id` int(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `consignment_details`
--

INSERT INTO `consignment_details` (`id`, `order_id`, `consignment_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 61, 8, NULL, '2020-03-17 06:08:35', '2020-03-17 06:08:35'),
(4, 61, 9, NULL, '2020-03-17 06:08:32', '2020-03-17 06:08:32'),
(5, 61, 10, NULL, '2020-03-17 09:44:58', '2020-03-17 09:44:58'),
(6, 61, 11, NULL, '2020-03-17 09:44:56', '2020-03-17 09:44:56'),
(7, 61, 12, NULL, '2020-03-17 09:44:55', '2020-03-17 09:44:55'),
(8, 61, 13, NULL, '2020-03-17 09:44:53', '2020-03-17 09:44:53'),
(9, 72, 14, NULL, '2020-03-17 09:44:51', '2020-03-17 09:44:51'),
(10, 62, 15, NULL, '2020-03-17 05:51:35', '2020-03-17 05:51:35'),
(11, 62, 16, NULL, '2020-03-17 09:44:48', '2020-03-17 09:44:48'),
(13, 62, 18, NULL, '2020-03-17 05:51:40', '2020-03-17 05:51:40'),
(14, 81, 19, NULL, '2020-03-17 06:08:29', '2020-03-17 06:08:29'),
(32, 71, 17, NULL, '2020-03-17 09:44:46', '2020-03-17 09:44:46'),
(33, 72, 17, NULL, '2020-03-17 09:44:46', '2020-03-17 09:44:46'),
(34, 102, 17, NULL, '2020-03-17 09:44:46', '2020-03-17 09:44:46'),
(53, 81, 21, NULL, '2020-03-17 10:11:48', '2020-03-17 10:11:48'),
(54, 82, 21, NULL, '2020-03-17 10:11:48', '2020-03-17 10:11:48'),
(57, 71, 22, NULL, '2020-03-17 10:14:35', '2020-03-17 10:14:35'),
(58, 74, 22, NULL, '2020-03-17 10:14:35', '2020-03-17 10:14:35'),
(61, 62, 24, NULL, '2020-03-18 03:57:56', '2020-03-18 03:57:56'),
(62, 73, 24, NULL, '2020-03-18 03:57:56', '2020-03-18 03:57:56'),
(67, 70, 25, NULL, '2020-03-17 11:32:02', '2020-03-17 11:32:02'),
(68, 67, 25, NULL, '2020-03-17 11:32:02', '2020-03-17 11:32:02'),
(72, 70, 26, NULL, '2020-03-17 11:42:51', '2020-03-17 11:42:51'),
(73, 67, 26, NULL, '2020-03-17 11:42:51', '2020-03-17 11:42:51'),
(74, 63, 26, NULL, '2020-03-17 11:42:51', '2020-03-17 11:42:51'),
(77, 67, 1, '2020-03-21 07:16:07', '2020-03-21 07:16:07', NULL),
(78, 68, 1, '2020-03-21 07:16:07', '2020-03-21 07:16:07', NULL),
(79, 83, 1, '2020-03-21 07:16:07', '2020-03-21 07:16:07', NULL),
(80, 70, 28, '2020-03-21 07:17:25', '2020-03-21 07:17:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `order_id` int(10) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `Postcode` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`order_id`, `name`, `address`, `Postcode`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mark Weinstein', '19 street Drive, LS17 7YP', '785830', '+4726385811095', '2020-03-16 09:10:11', '2002-02-19 05:11:12', NULL),
(2, 'Roger Moore', '20 street lane, LS17 7YP', '856316', '+8000740149336', '2020-03-16 09:10:11', '2011-01-21 16:50:46', NULL),
(3, 'Trew Cruiser', '21 street Mount, LS17 7YP', '710328', '+4666213946540', '2020-03-16 09:10:12', '2007-08-10 13:52:37', NULL),
(4, 'Sally minx', '22 street Land, LS17 7YP, TX 79848', '709702', '+4727994829205', '2020-03-16 09:10:11', '2012-12-04 16:11:47', NULL),
(5, 'John Brows', '23 street Lake, LS17 7YP', '271895', '+9132694688941', '2020-03-16 09:10:10', '1990-06-09 11:22:52', NULL),
(6, 'Jerome Saint', '24 street Ocean, LS17 7YP', '250804', '+1376022966072', '2020-03-16 09:10:12', '1978-01-13 10:31:25', NULL),
(7, 'Jaguar featherweight', '661 Warren Ferry\nMaribelshire, NM 11369-5452', '117502', '+4308949005177', '2020-03-16 09:10:11', '2018-03-15 07:00:35', NULL),
(8, 'Diplo trevor', '675 Daniel Ramp\nWest Giovanna, NM 47510-4513', '344007', '+1855031756369', '2020-03-16 09:10:11', '2015-06-24 14:39:43', NULL),
(9, 'Drake russi', '424 Kris Crest Suite 990\nSouth Urbanview, AZ 57223-4501', '135744', '+1097278129647', '2020-03-16 09:10:10', '1970-09-03 02:25:59', NULL),
(10, 'Veronica Dramond', '859 Ciara Ridge\nSouth Thomasburgh, AZ 54931', '483534', '+5513724408674', '2020-03-16 09:10:12', '2011-03-10 21:04:45', NULL);


-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `customer_id` int(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `delivery_date`, `customer_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(61, 'Toilet Paper', '2019-12-26 13:23:46', 47, '2020-03-16 09:10:12', '2020-03-16 09:10:12', NULL),
(62, 'Loo roll', '1985-04-15 13:14:50', 19, '2020-03-16 09:10:12', '2020-03-16 09:10:12', NULL),
(63, 'HP Envy laptop', '1995-11-15 21:55:25', 33, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(64, 'Egg nog', '1999-04-02 14:15:13', 9, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(65, 'Harry Potter stick', '1981-03-21 23:58:08', 43, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(66, 'Dinasaur Tail', '1977-04-20 12:40:59', 14, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(67, 'Lamborghini Picture', '1974-01-17 18:48:16', 45, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(68, 'Starman album', '2005-04-23 14:50:59', 5, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(69, 'F1 Mercedes model', '2015-02-26 23:44:39', 44, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(70, 'Chinese Meme', '1979-10-01 02:33:29', 23, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(71, 'American Idol cup', '1979-02-10 22:53:55', 4, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(72, 'XBOX controller', '1988-04-15 09:14:33', 49, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(73, 'PS5 console', '1990-01-08 19:14:37', 26, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(74, 'Apple Juice', '1973-09-12 12:15:25', 15, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(75, 'Pasta', '1993-10-27 19:37:15', 2, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(76, 'Conans shampoo', '2015-09-12 14:36:49', 22, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(77, 'Head shoulders', '1971-09-25 10:47:56', 31, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(78, 'Facewash', '1970-02-21 03:37:57', 8, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(79, 'Toilet Seat', '2001-09-14 08:10:45', 1, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(80, 'Push rod suspension', '1996-07-06 02:33:19', 7, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(81, 'Wheel nut', '2006-11-14 13:24:19', 13, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(82, 'Bag of Air', '2014-09-02 08:33:33', 30, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(83, 'Gas bag', '1976-06-10 21:01:43', 36, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(84, 'Drake album', '2016-04-02 20:41:30', 37, '2020-03-16 09:10:13', '2020-03-16 09:10:13', NULL),
(85, 'Keyboard for laptop', '2007-02-04 12:32:47', 32, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(86, 'Push rod suspension', '2018-08-15 19:48:40', 21, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(87, 'Push rod suspension', '1973-05-11 23:46:10', 25, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(88, 'Push rod suspension', '1972-02-03 12:09:40', 50, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(89, 'Push rod suspension', '1996-01-09 21:42:16', 35, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(90, 'Push rod suspension', '1977-01-27 21:04:11', 24, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(91, 'Push rod suspension', '1972-04-25 05:40:33', 18, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(92, 'Push rod suspension', '2003-04-03 02:52:04', 10, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(93, 'Push rod suspension', '2012-07-22 10:41:44', 11, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(94, 'Push rod suspension', '1995-09-02 05:16:36', 3, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(95, 'Push rod suspension', '2017-02-24 10:13:56', 39, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(96, 'Push rod suspension', '2000-12-06 23:08:06', 48, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(97, 'Wheel nut', '2017-07-22 10:17:42', 12, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(98, 'Wheel nut', '1983-09-01 14:00:45', 38, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(99, 'Wheel nut', '1984-10-20 21:48:35', 41, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(100, 'Wheel nut', '1987-09-02 05:38:29', 20, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(101, 'Wheel nut', '1976-05-05 21:06:01', 28, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(102, 'Wheel nut', '1994-07-10 11:05:55', 46, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(103, 'Wheel nut', '1973-10-08 01:21:13', 17, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(104, 'Wheel nut', '2001-10-25 08:59:13', 27, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(105, 'Wheel nut', '1990-12-17 00:11:16', 34, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(106, 'Wheel nut', '1973-10-25 15:49:39', 16, '2020-03-16 09:10:14', '2020-03-16 09:10:14', NULL),
(107, 'Wheel nut', '1983-08-08 18:57:46', 29, '2020-03-16 09:10:15', '2020-03-16 09:10:15', NULL),
(108, 'Wheel nut', '2017-03-14 20:53:22', 6, '2020-03-16 09:10:15', '2020-03-16 09:10:15', NULL),
(109, 'Wheel nut', '1972-06-10 00:07:57', 40, '2020-03-16 09:10:15', '2020-03-16 09:10:15', NULL),
(110, 'Wheel nut', '1987-01-15 18:38:49', 42, '2020-03-16 09:10:15', '2020-03-16 09:10:15', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `consignmentsh`
--
ALTER TABLE `consignmentsh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consignment_details`
--
ALTER TABLE `consignment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `consignmentsh`
--
ALTER TABLE `consignmentsh`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `consignment_details`
--
ALTER TABLE `consignment_details`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
