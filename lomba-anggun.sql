-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2024 at 09:28 AM
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
-- Database: `lomba-anggun`
--

-- --------------------------------------------------------

--
-- Table structure for table `computers`
--

CREATE TABLE `computers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `computers`
--

INSERT INTO `computers` (`id`, `name`, `type_id`) VALUES
(1, 'Computer 1', 1),
(2, 'Computer 2', 1),
(3, 'Computer 3', 1),
(4, 'Computer 4', 1),
(5, 'Computer 5', 2),
(6, 'Computer 6', 2),
(7, 'Computer 7', 2),
(8, 'Computer 8', 2),
(9, 'Computer 9', 2),
(10, 'Computer 10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `computer_types`
--

CREATE TABLE `computer_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `computer_types`
--

INSERT INTO `computer_types` (`id`, `name`) VALUES
(1, 'Gaming'),
(2, 'Office');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_03_08_133021_create_operators_table', 1),
(2, '2022_03_08_133044_create_computers_table', 1),
(3, '2022_03_08_133053_create_computer_types_table', 1),
(4, '2022_03_08_133147_create_rental_prices_table', 1),
(5, '2022_03_08_133200_create_transactions_table', 1),
(6, '2022_03_09_071158_create_roles_table', 1),
(7, '2022_03_09_071227_relationship', 1);

-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

CREATE TABLE `operators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `operators`
--

INSERT INTO `operators` (`id`, `fullname`, `username`, `password`, `role_id`) VALUES
(1, 'Operator 0', 'operator0', '$2y$10$saloDwkGUecwWUJIg8gyuO9R8dRTQi4ST8BiOhZ.uXusD.1bXKC2a', 1),
(2, 'Operator 1', 'operator1', '$2y$10$XHPEllflIlE1tgb1xKYsMONLpq5qdE2plqY4qsdfyLSPQ47PyXceu', 2),
(3, 'Operator 2', 'operator2', '$2y$10$4OvpyTxvvkyC.7z19thw5.NnCf9P3shDBR98G7PUTXCVDG55ytdm.', 2),
(4, 'Operator 3', 'operator3', '$2y$10$nqirOigjUofN0rIm5qwhhu8.KIcAxxb0NgMMXecqQg2cKH1j.y3PO', 2),
(5, 'Operator 4', 'operator4', '$2y$10$31RGGtEHKSShKXRuUwv8Qe2mNET6Q1qOIEARhKDJfh.6xUV9ekPiq', 2);

-- --------------------------------------------------------

--
-- Table structure for table `rental_prices`
--

CREATE TABLE `rental_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rental_prices`
--

INSERT INTO `rental_prices` (`id`, `name`, `price`, `duration`, `type_id`) VALUES
(1, 'Packet Gaming 1', 5000, 1, 1),
(2, 'Packet Gaming 2', 9000, 2, 1),
(3, 'Packet Gaming 3', 13000, 3, 1),
(4, 'Packet Office 1', 3000, 1, 2),
(5, 'Packet Office 2', 5000, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Owner'),
(2, 'Worker');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer` varchar(255) NOT NULL,
  `time_start` timestamp NULL DEFAULT NULL,
  `time_end` timestamp NULL DEFAULT NULL,
  `bill` bigint(20) UNSIGNED NOT NULL,
  `computer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `operator_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `customer`, `time_start`, `time_end`, `bill`, `computer_id`, `operator_id`) VALUES
(1, 'Ava Kassulke', '2024-02-29 22:58:22', '2024-02-29 23:58:22', 5000, 4, 5),
(2, 'Chandler Hermiston', '2020-09-30 22:25:37', '2020-09-30 23:25:37', 3000, 9, 4),
(3, 'Claud Corwin', '2024-06-14 01:36:21', '2024-06-14 02:36:21', 3000, 9, 1),
(4, 'Miss Jammie Moen MD', '2024-07-05 01:42:36', '2024-07-05 02:42:36', 3000, 6, 1),
(5, 'Prof. Katheryn Dare', '2024-03-07 04:41:46', '2024-03-07 05:41:46', 3000, 6, 3),
(6, 'Sydnie Considine', '2024-01-20 04:44:45', '2024-01-20 05:44:45', 3000, 8, 3),
(7, 'Terry Rowe DVM', '2016-05-24 08:59:47', '2016-05-24 09:59:47', 3000, 6, 4),
(8, 'Prof. Ferne Parisian MD', '2024-04-09 10:31:36', '2024-04-09 11:31:36', 3000, 6, 4),
(9, 'Prof. Parker Schumm III', '2016-09-30 17:55:04', '2016-09-30 18:55:04', 5000, 3, 3),
(10, 'Karley Sawayn', '2024-05-19 15:57:57', '2024-05-19 16:57:57', 3000, 10, 4),
(11, 'Prof. Neal Sipes MD', '2024-06-30 02:43:54', '2024-06-30 03:43:54', 3000, 5, 1),
(12, 'Adonis Vandervort', '2024-02-28 04:56:22', '2024-02-28 05:56:22', 5000, 3, 4),
(13, 'Andres Mills', '2024-06-30 20:55:35', '2024-06-30 21:55:35', 3000, 8, 4),
(14, 'Ms. Camille Turner V', '2022-04-01 03:20:07', '2022-04-01 04:20:07', 5000, 3, 1),
(15, 'Darien Moore', '2015-08-29 05:19:16', '2015-08-29 06:19:16', 5000, 4, 5),
(16, 'Toy Dibbert', '2024-05-29 20:51:42', '2024-05-29 21:51:42', 3000, 6, 4),
(17, 'Prof. Mariam O\'Keefe', '2024-07-03 13:06:42', '2024-07-03 14:06:42', 3000, 6, 1),
(18, 'Andreanne Block', '2024-03-27 00:06:49', '2024-03-27 01:06:49', 3000, 7, 3),
(19, 'Dr. Jake Mohr Jr.', '2019-12-04 19:37:08', '2019-12-04 20:37:08', 3000, 7, 5),
(20, 'Prof. Destinee Cruickshank', '2024-02-18 16:04:54', '2024-02-18 17:04:54', 3000, 6, 1),
(21, 'Jadon Blick Sr.', '2023-11-07 03:05:13', '2023-11-07 04:05:13', 3000, 6, 2),
(22, 'Nikolas Pfannerstill', '2024-07-02 14:21:32', '2024-07-02 15:21:32', 3000, 7, 3),
(23, 'Cassidy Streich PhD', '2021-07-01 15:19:02', '2021-07-01 16:19:02', 5000, 4, 2),
(24, 'Allene Kovacek', '2020-06-04 01:18:58', '2020-06-04 02:18:58', 3000, 5, 3),
(25, 'Theo Stark', '2021-12-04 05:44:09', '2021-12-04 06:44:09', 5000, 4, 4),
(26, 'Reuben Beatty', '2024-07-03 04:59:30', '2024-07-03 05:59:30', 3000, 9, 4),
(27, 'Kailyn Blanda', '2020-02-05 01:06:46', '2020-02-05 02:06:46', 5000, 1, 5),
(28, 'Lourdes Marquardt', '2024-06-25 23:10:43', '2024-06-26 00:10:43', 3000, 10, 4),
(29, 'Antwan VonRueden Jr.', '2023-01-19 07:43:38', '2023-01-19 08:43:38', 3000, 7, 1),
(30, 'Cayla Towne', '2016-09-20 01:08:00', '2016-09-20 02:08:00', 5000, 4, 1),
(31, 'Prof. Ilene Welch', '2024-04-11 00:00:31', '2024-04-11 01:00:31', 3000, 5, 4),
(32, 'Jared White', '2019-07-22 06:31:38', '2019-07-22 07:31:38', 5000, 4, 2),
(33, 'Damien Wolf', '2021-06-28 03:44:30', '2021-06-28 04:44:30', 3000, 5, 2),
(34, 'Jennifer Ortiz', '2023-02-06 14:03:39', '2023-02-06 15:03:39', 3000, 7, 4),
(35, 'Anastasia Hane III', '2024-01-24 05:49:26', '2024-01-24 06:49:26', 3000, 8, 4),
(36, 'Miss Gail Lindgren', '2024-07-06 02:19:35', '2024-07-06 03:19:35', 5000, 2, 3),
(37, 'Vernon Champlin', '2024-02-11 23:32:31', '2024-02-12 00:32:31', 3000, 7, 1),
(38, 'Elinor Weissnat', '2024-01-16 01:34:07', '2024-01-16 02:34:07', 5000, 1, 3),
(39, 'Prof. Coleman Jenkins Jr.', '2024-03-03 09:04:28', '2024-03-03 10:04:28', 5000, 3, 2),
(40, 'Augustus Jenkins', '2024-01-19 01:27:31', '2024-01-19 02:27:31', 3000, 6, 1),
(41, 'Mr. Melany McGlynn', '2019-05-30 11:19:34', '2019-05-30 12:19:34', 5000, 4, 2),
(42, 'Grady Schmitt', '2024-05-26 08:12:34', '2024-05-26 09:12:34', 3000, 10, 3),
(43, 'Lolita Bartoletti', '2024-04-06 15:29:02', '2024-04-06 16:29:02', 3000, 5, 3),
(44, 'Ms. Anika Gorczany IV', '2021-02-24 07:35:38', '2021-02-24 08:35:38', 3000, 7, 2),
(45, 'Coby Langworth', '2019-03-01 20:11:10', '2019-03-01 21:11:10', 3000, 10, 4),
(46, 'Prof. Daren Farrell MD', '2017-10-23 14:52:09', '2017-10-23 15:52:09', 3000, 10, 3),
(47, 'Dr. Yazmin Lang III', '2020-10-19 01:59:35', '2020-10-19 02:59:35', 5000, 2, 4),
(48, 'Ona Hettinger', '2024-04-11 12:35:07', '2024-04-11 13:35:07', 3000, 10, 4),
(49, 'Chelsea Tromp', '2024-04-17 05:40:02', '2024-04-17 06:40:02', 3000, 7, 2),
(50, 'Nora Macejkovic', '2024-02-26 07:52:41', '2024-02-26 08:52:41', 3000, 9, 2),
(51, 'Ivory Carroll', '2024-05-25 19:28:28', '2024-05-25 20:28:28', 5000, 3, 4),
(52, 'Xavier Howe', '2024-03-16 19:06:48', '2024-03-16 20:06:48', 5000, 2, 3),
(53, 'Prof. Freeda Kilback Sr.', '2016-07-07 11:16:00', '2016-07-07 12:16:00', 5000, 1, 4),
(54, 'Harmon West Jr.', '2021-11-19 06:28:38', '2021-11-19 07:28:38', 5000, 4, 3),
(55, 'Adalberto Osinski', '2024-03-05 13:17:58', '2024-03-05 14:17:58', 5000, 4, 1),
(56, 'Bridgette Blick', '2024-06-30 23:56:42', '2024-07-01 00:56:42', 3000, 8, 4),
(57, 'Prof. Maverick Pfannerstill Jr.', '2024-02-07 06:25:53', '2024-02-07 07:25:53', 3000, 5, 4),
(58, 'Theresa Legros V', '2016-05-10 09:58:49', '2016-05-10 10:58:49', 3000, 9, 2),
(59, 'Oswaldo Mosciski', '2024-04-04 02:01:40', '2024-04-04 03:01:40', 3000, 8, 2),
(60, 'Hassie McLaughlin DVM', '2022-08-10 10:46:50', '2022-08-10 11:46:50', 3000, 6, 2),
(61, 'Aryanna Veum', '2019-10-23 02:22:41', '2019-10-23 03:22:41', 3000, 10, 3),
(62, 'Dr. Jaqueline Cole', '2024-03-08 04:51:53', '2024-03-08 05:51:53', 3000, 10, 2),
(63, 'Gregg Corkery', '2022-06-30 00:09:51', '2022-06-30 01:09:51', 3000, 8, 2),
(64, 'Niko Sporer', '2023-07-21 23:34:19', '2023-07-22 00:34:19', 5000, 2, 4),
(65, 'Clarissa Herman', '2024-05-08 13:01:50', '2024-05-08 14:01:50', 3000, 8, 1),
(66, 'Peter Goldner', '2024-06-30 21:02:05', '2024-06-30 22:02:05', 5000, 1, 2),
(67, 'Dr. Milo Ernser', '2020-10-02 02:14:44', '2020-10-02 03:14:44', 5000, 3, 4),
(68, 'Jamal Sauer', '2024-01-14 01:22:14', '2024-01-14 02:22:14', 5000, 3, 3),
(69, 'Claud Buckridge', '2024-02-01 06:27:12', '2024-02-01 07:27:12', 3000, 7, 5),
(70, 'Ms. Dakota Funk III', '2015-09-29 05:36:27', '2015-09-29 06:36:27', 5000, 4, 2),
(71, 'Domenico Gorczany', '2024-05-16 03:17:02', '2024-05-16 04:17:02', 5000, 3, 2),
(72, 'Lukas Effertz Jr.', '2024-06-21 12:01:59', '2024-06-21 13:01:59', 3000, 8, 4),
(73, 'Zula Watsica III', '2023-08-06 07:27:56', '2023-08-06 08:27:56', 3000, 8, 2),
(74, 'Prof. Monserrate Torphy DDS', '2018-04-04 04:26:29', '2018-04-04 05:26:29', 3000, 6, 1),
(75, 'Destin Fisher', '2024-06-16 02:38:23', '2024-06-16 03:38:23', 3000, 9, 5),
(76, 'Lamont Block I', '2024-01-31 02:45:25', '2024-01-31 03:45:25', 3000, 5, 1),
(77, 'Judah Wehner', '2024-01-24 18:21:29', '2024-01-24 19:21:29', 5000, 2, 4),
(78, 'Mr. Mustafa Mertz PhD', '2024-06-06 21:34:23', '2024-06-06 22:34:23', 5000, 3, 5),
(79, 'Celestine O\'Reilly', '2024-07-02 02:58:14', '2024-07-02 03:58:14', 5000, 3, 3),
(80, 'Leanna Jenkins', '2024-01-10 17:31:33', '2024-01-10 18:31:33', 3000, 7, 3),
(81, 'Prof. Nadia Spinka Jr.', '2024-06-28 20:03:56', '2024-06-28 21:03:56', 3000, 7, 2),
(82, 'Bernadine Marvin', '2024-05-18 20:43:06', '2024-05-18 21:43:06', 5000, 3, 2),
(83, 'Jody Franecki', '2024-04-23 10:43:56', '2024-04-23 11:43:56', 3000, 6, 3),
(84, 'Marcel Smitham', '2024-01-21 19:37:17', '2024-01-21 20:37:17', 5000, 3, 2),
(85, 'Allen Marquardt', '2024-07-03 00:29:37', '2024-07-03 01:29:37', 5000, 4, 1),
(86, 'Jazlyn Labadie', '2016-12-12 01:04:16', '2016-12-12 02:04:16', 3000, 9, 5),
(87, 'Taya Schiller', '2022-07-23 15:14:14', '2022-07-23 16:14:14', 5000, 3, 2),
(88, 'Amely Bogan', '2022-02-19 22:36:40', '2022-02-19 23:36:40', 5000, 3, 2),
(89, 'Prof. Tremaine Cassin II', '2017-09-03 07:32:08', '2017-09-03 08:32:08', 5000, 4, 4),
(90, 'Toby Bins', '2024-07-03 09:48:28', '2024-07-03 10:48:28', 3000, 7, 1),
(91, 'Prof. Zelda Lockman DDS', '2024-01-24 05:03:01', '2024-01-24 06:03:01', 3000, 6, 3),
(92, 'Ms. Eula Dach', '2024-02-14 17:10:04', '2024-02-14 18:10:04', 3000, 10, 4),
(93, 'Prof. Frida Ruecker DVM', '2016-06-15 03:13:06', '2016-06-15 04:13:06', 3000, 5, 3),
(94, 'Dr. Corbin O\'Conner', '2015-07-09 07:56:10', '2015-07-09 08:56:10', 5000, 1, 1),
(95, 'Dr. Jacinto Olson', '2016-09-26 04:20:52', '2016-09-26 05:20:52', 3000, 8, 4),
(96, 'Ansley Schaden II', '2021-09-25 21:47:20', '2021-09-25 22:47:20', 3000, 5, 3),
(97, 'Mr. Gaetano Vandervort III', '2024-03-20 22:34:42', '2024-03-20 23:34:42', 3000, 9, 1),
(98, 'Mr. Jarrett Kihn I', '2024-02-12 00:07:44', '2024-02-12 01:07:44', 5000, 2, 4),
(99, 'Mr. Jorge Gibson', '2024-01-07 13:40:35', '2024-01-07 14:40:35', 5000, 3, 1),
(100, 'Athena Block', '2024-03-28 05:10:18', '2024-03-28 06:10:18', 3000, 8, 2),
(101, 'Ralph Marks II', '2024-06-03 19:27:29', '2024-06-03 20:27:29', 3000, 7, 1),
(102, 'Vladimir Kling PhD', '2024-04-08 18:53:36', '2024-04-08 19:53:36', 3000, 10, 3),
(103, 'Mr. Arden Schimmel IV', '2024-07-02 10:27:47', '2024-07-02 11:27:47', 3000, 6, 3),
(104, 'Amani Cummings', '2024-07-05 13:41:48', '2024-07-05 14:41:48', 3000, 6, 1),
(105, 'Linda Paucek', '2016-04-19 07:20:50', '2016-04-19 08:20:50', 3000, 7, 2),
(106, 'Woodrow Barton', '2024-06-25 12:28:12', '2024-06-25 13:28:12', 3000, 10, 2),
(107, 'Anika Herzog II', '2017-02-17 07:10:09', '2017-02-17 08:10:09', 5000, 2, 5),
(108, 'Sharon Kuvalis', '2023-08-28 19:03:01', '2023-08-28 20:03:01', 3000, 6, 2),
(109, 'Mrs. Dannie Bartoletti II', '2024-06-25 12:49:18', '2024-06-25 13:49:18', 5000, 2, 4),
(110, 'Malvina Ziemann', '2024-07-06 03:08:02', '2024-07-06 04:08:02', 3000, 10, 3),
(111, 'Prof. Christiana Bosco MD', '2024-06-19 18:51:32', '2024-06-19 19:51:32', 3000, 8, 3),
(112, 'Annabell McKenzie', '2024-04-07 07:33:57', '2024-04-07 08:33:57', 3000, 6, 2),
(113, 'Hillard Donnelly', '2024-05-15 19:49:24', '2024-05-15 20:49:24', 3000, 6, 2),
(114, 'Dr. Dimitri Harris', '2024-03-24 10:48:41', '2024-03-24 11:48:41', 3000, 5, 4),
(115, 'Joanie Konopelski', '2018-08-29 04:07:58', '2018-08-29 05:07:58', 3000, 9, 2),
(116, 'Mattie Kihn', '2024-03-28 18:20:05', '2024-03-28 19:20:05', 3000, 9, 1),
(117, 'Haskell Yundt', '2023-07-20 22:30:00', '2023-07-20 23:30:00', 3000, 7, 5),
(118, 'anggun', '2024-07-06 06:52:32', '2024-07-06 08:52:32', 9000, 1, 2),
(119, 'lukman', '2024-07-06 06:53:35', '2024-07-06 09:53:35', 13000, 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `computers`
--
ALTER TABLE `computers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computers_type_id_foreign` (`type_id`);

--
-- Indexes for table `computer_types`
--
ALTER TABLE `computer_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `operators_username_unique` (`username`),
  ADD KEY `operators_role_id_foreign` (`role_id`);

--
-- Indexes for table `rental_prices`
--
ALTER TABLE `rental_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rental_prices_type_id_foreign` (`type_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_computer_id_foreign` (`computer_id`),
  ADD KEY `transactions_operator_id_foreign` (`operator_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `computers`
--
ALTER TABLE `computers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `computer_types`
--
ALTER TABLE `computer_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `operators`
--
ALTER TABLE `operators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rental_prices`
--
ALTER TABLE `rental_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `computers`
--
ALTER TABLE `computers`
  ADD CONSTRAINT `computers_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `computer_types` (`id`);

--
-- Constraints for table `operators`
--
ALTER TABLE `operators`
  ADD CONSTRAINT `operators_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `rental_prices`
--
ALTER TABLE `rental_prices`
  ADD CONSTRAINT `rental_prices_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `computer_types` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_computer_id_foreign` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_operator_id_foreign` FOREIGN KEY (`operator_id`) REFERENCES `operators` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
