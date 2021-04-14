-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:33066
-- Generation Time: Apr 07, 2021 at 10:41 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yukbisayuk`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `description`) VALUES
(1, 'Pendidikan'),
(2, 'Bencana Alam'),
(3, 'Difabel'),
(4, 'Infrastruktur Umum'),
(5, 'Teknologi'),
(6, 'Budaya'),
(7, 'Karya Kreatif & Modal Usaha'),
(8, 'Kegiatan Sosial'),
(9, 'Kemanusiaan'),
(10, 'Lingkungan'),
(11, 'Hewan'),
(12, 'Panti Asuhan'),
(13, 'Rumah Ibadah'),
(14, 'Ekonomi'),
(15, 'Politik'),
(16, 'Keadilan');

-- --------------------------------------------------------

--
-- Table structure for table `comment_forum`
--

CREATE TABLE `comment_forum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idForum` bigint(20) UNSIGNED NOT NULL,
  `idParticipant` bigint(20) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_forum`
--

INSERT INTO `comment_forum` (`id`, `idForum`, `idParticipant`, `content`, `created_at`) VALUES
(1, 1, 2, 'So fun', '2021-03-01'),
(2, 2, 2, 'Best', '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `detail_allocation`
--

CREATE TABLE `detail_allocation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idDonation` bigint(20) UNSIGNED NOT NULL,
  `nominal` bigint(20) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_allocation`
--

INSERT INTO `detail_allocation` (`id`, `idDonation`, `nominal`, `description`) VALUES
(1, 1, 200000, 'Calm'),
(2, 1, 100000, 'GBU');

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` tinyint(3) UNSIGNED NOT NULL,
  `deadline` date NOT NULL,
  `idCampaigner` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assistedSubject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `donationCollected` bigint(20) NOT NULL,
  `donationTarget` bigint(20) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`id`, `category`, `deadline`, `idCampaigner`, `photo`, `purpose`, `status`, `title`, `assistedSubject`, `donationCollected`, `donationTarget`, `created_at`) VALUES
(1, 1, '2021-03-01', 2, 'images/photo1', 'Cancer', 1, 'Help Cancer', 'Cancer', 7000000, 10000000, '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `event_status`
--

CREATE TABLE `event_status` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_status`
--

INSERT INTO `event_status` (`id`, `description`) VALUES
(0, 'not confirmed'),
(1, 'active'),
(2, 'finished'),
(3, 'closed'),
(4, 'canceled');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idParticipant` bigint(20) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`id`, `idParticipant`, `content`, `title`, `created_at`) VALUES
(1, 2, 'Help the Cancer', 'Cancer', '2021-03-01'),
(2, 2, 'Help the Tumor', 'Tumor', '2021-03-01'),
(3, 2, 'Help from earthquake', 'earthquake', '2021-03-01'),
(4, 2, 'Help from tsunami', 'Tsunami', '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `forum_like`
--

CREATE TABLE `forum_like` (
  `idForum` bigint(20) UNSIGNED NOT NULL,
  `idParticipant` bigint(20) UNSIGNED NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_like`
--

INSERT INTO `forum_like` (`idForum`, `idParticipant`, `created_at`) VALUES
(1, 1, '2021-03-01'),
(1, 2, '2021-03-01'),
(1, 3, '2021-03-01'),
(2, 1, '2021-03-01'),
(2, 2, '2021-03-01'),
(2, 3, '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2021_02_20_130050_create_status_users_table', 1),
(4, '2021_02_20_131000_create_users_table', 1),
(5, '2021_02_20_132800_create_categories_table', 1),
(6, '2021_02_20_132852_create_event_statuses_table', 1),
(7, '2021_02_20_133354_create_donations_table', 1),
(8, '2021_02_20_133405_create_petitions_table', 1),
(9, '2021_02_20_133410_create_participate_donations_table', 1),
(10, '2021_02_20_133418_create_participate_petitions_table', 1),
(11, '2021_02_20_143214_create_transactions_table', 1),
(12, '2021_02_20_143307_create_update_news_table', 1),
(13, '2021_02_20_143429_create_detail_allocations_table', 1),
(14, '2021_02_20_152402_create_services_table', 1),
(15, '2021_02_20_152442_create_forums_table', 1),
(16, '2021_02_20_152528_create_comment_forums_table', 1),
(17, '2021_02_20_152657_create_forum_likes_table', 1),
(18, '2021_03_01_182646_add_last_activity_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `participate_donation`
--

CREATE TABLE `participate_donation` (
  `idDonation` bigint(20) UNSIGNED NOT NULL,
  `idParticipant` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participate_donation`
--

INSERT INTO `participate_donation` (`idDonation`, `idParticipant`, `comment`, `created_at`) VALUES
(1, 2, 'Help me from Cancer', '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `participate_petition`
--

CREATE TABLE `participate_petition` (
  `idPetition` bigint(20) UNSIGNED NOT NULL,
  `idParticipant` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participate_petition`
--

INSERT INTO `participate_petition` (`idPetition`, `idParticipant`, `comment`, `created_at`) VALUES
(1, 3, 'Help me from Cancer', '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `petition`
--

CREATE TABLE `petition` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCampaigner` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `targetPerson` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signedTarget` int(11) NOT NULL,
  `signedCollected` int(11) NOT NULL,
  `category` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `deadline` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `petition`
--

INSERT INTO `petition` (`id`, `title`, `idCampaigner`, `photo`, `purpose`, `targetPerson`, `signedTarget`, `signedCollected`, `category`, `status`, `deadline`, `created_at`) VALUES
(1, 'Tolak Biaya Materai Untuk Saham', 4, 'images/petition/tolak.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, fugiat, nobis inventore cupiditate porro a non fugit maxime possimus repellendus officiis iusto blanditiis deserunt asperiores quia quod nemo adipisci dicta exercitationem sequi doloribus cum ipsum! Tempore quis, id praesentium accusamus, ea aut expedita quo atque neque dolore optio eum sed aliquam. Dignissimos velit earum tempora in recusandae cupiditate eligendi, aliquam est obcaecati corrupti eos odio exercitationem iste totam ipsum sequi! Fuga iure repudiandae impedit, illum corporis alias. Explicabo modi voluptatibus ipsum nisi omnis vel saepe rerum unde repellat nam delectus velit ea cumque, aperiam facere enim! Corporis earum debitis aperiam?\r\n                \r\n                Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, fugiat, nobis inventore cupiditate porro a non fugit maxime possimus repellendus officiis iusto blanditiis deserunt asperiores quia quod nemo adipisci dicta exercitationem sequi doloribus cum ipsum! Tempore quis, id praesentium accusamus, ea aut expedita quo atque neque dolore optio eum sed aliquam. Dignissimos velit earum tempora in recusandae cupiditate eligendi, aliquam est obcaecati corrupti eos odio exercitationem iste totam ipsum sequi! Fuga iure repudiandae impedit, illum corporis alias. Explicabo modi voluptatibus ipsum nisi omnis vel saepe rerum unde repellat nam delectus velit ea cumque, aperiam facere enim! Corporis earum debitis aperiam?', 'investor', 100, 10, 1, 1, '2021-04-01', '2021-03-01'),
(2, 'petisi ke 2', 4, 'images/petition/petition2.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, fugiat, nobis inventore cupiditate porro a non fugit maxime possimus repellendus officiis iusto blanditiis deserunt asperiores quia quod nemo adipisci dicta exercitationem sequi doloribus cum ipsum! Tempore quis, id praesentium accusamus, ea aut expedita quo atque neque dolore optio eum sed aliquam. Dignissimos velit earum tempora in recusandae cupiditate eligendi, aliquam est obcaecati corrupti eos odio exercitationem iste totam ipsum sequi! Fuga iure repudiandae impedit, illum corporis alias. Explicabo modi voluptatibus ipsum nisi omnis vel saepe rerum unde repellat nam delectus velit ea cumque, aperiam facere enim! Corporis earum debitis aperiam?\r\n                \r\n                Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, fugiat, nobis inventore cupiditate porro a non fugit maxime possimus repellendus officiis iusto blanditiis deserunt asperiores quia quod nemo adipisci dicta exercitationem sequi doloribus cum ipsum! Tempore quis, id praesentium accusamus, ea aut expedita quo atque neque dolore optio eum sed aliquam. Dignissimos velit earum tempora in recusandae cupiditate eligendi, aliquam est obcaecati corrupti eos odio exercitationem iste totam ipsum sequi! Fuga iure repudiandae impedit, illum corporis alias. Explicabo modi voluptatibus ipsum nisi omnis vel saepe rerum unde repellat nam delectus velit ea cumque, aperiam facere enim! Corporis earum debitis aperiam?', 'investor', 1000000, 10000, 1, 1, '2021-04-01', '2021-03-23');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `receiver` bigint(20) UNSIGNED NOT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `message`, `user_id`, `receiver`, `is_seen`, `created_at`, `updated_at`) VALUES
(1, 'asd', 6, 5, 1, '2021-03-22', '2021-03-31'),
(2, 'asd', 6, 5, 1, '2021-03-22', '2021-03-31'),
(3, 'asd', 5, 6, 0, '2021-03-22', '2021-03-22'),
(4, 'asd', 6, 5, 1, '2021-03-22', '2021-03-31'),
(5, 'se', 6, 5, 1, '2021-03-23', '2021-03-31'),
(6, 'asd', 6, 5, 1, '2021-03-23', '2021-03-31'),
(7, 'asddee', 6, 5, 1, '2021-03-23', '2021-03-31'),
(8, 'asd', 6, 5, 1, '2021-03-23', '2021-03-31'),
(9, 'asd', 6, 5, 1, '2021-03-23', '2021-03-31'),
(10, 'asddd', 6, 5, 1, '2021-03-23', '2021-03-31'),
(11, 'asdddddd', 6, 5, 1, '2021-03-23', '2021-03-31'),
(12, 'zzzzzz', 6, 5, 1, '2021-03-23', '2021-03-31'),
(13, 'asd', 6, 5, 1, '2021-03-23', '2021-03-31'),
(14, 'asdasd', 6, 5, 1, '2021-03-28', '2021-03-31'),
(15, 'ss', 6, 5, 1, '2021-03-28', '2021-03-31'),
(16, 'ss', 6, 5, 1, '2021-03-28', '2021-03-31'),
(17, 'dd', 6, 5, 1, '2021-03-28', '2021-03-31'),
(18, 'asd', 5, 6, 0, '2021-03-31', '2021-03-31'),
(19, 'asd', 5, 6, 0, '2021-03-31', '2021-03-31'),
(20, 'Sewa', 6, 5, 1, '2021-03-31', '2021-03-31'),
(21, 'oke pak', 5, 6, 0, '2021-03-31', '2021-03-31'),
(22, 'oke pakbaik', 5, 6, 0, '2021-03-31', '2021-03-31'),
(23, 'Ww', 6, 5, 1, '2021-03-31', '2021-03-31'),
(24, 'asd', 5, 6, 0, '2021-03-31', '2021-03-31');

-- --------------------------------------------------------

--
-- Table structure for table `status_user`
--

CREATE TABLE `status_user` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_user`
--

INSERT INTO `status_user` (`id`, `description`) VALUES
(0, 'deleted'),
(1, 'active'),
(2, 'blocked'),
(3, 'waiting');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `idDonation` bigint(20) UNSIGNED NOT NULL,
  `idParticipant` bigint(20) UNSIGNED NOT NULL,
  `accountNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` int(11) NOT NULL,
  `repaymentPicture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`idDonation`, `idParticipant`, `accountNumber`, `bank`, `nominal`, `repaymentPicture`, `status`, `created_at`) VALUES
(1, 1, '209708591099', 'BCA', 10000, 'images/buktitrf.jpg', 'konfirmasi', '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `update_news`
--

CREATE TABLE `update_news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idPetition` bigint(20) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `photoProfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backgroundPicture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkProfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aboutMe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ktpPicture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_online` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT '2021-03-01 12:44:48'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status`, `role`, `phoneNumber`, `dob`, `photoProfile`, `backgroundPicture`, `linkProfile`, `aboutMe`, `address`, `city`, `country`, `zipCode`, `job`, `gender`, `ktpPicture`, `nik`, `accountNumber`, `is_online`, `created_at`, `updated_at`, `last_activity`) VALUES
(1, 'Guest', '', '', 1, 'guest', NULL, NULL, 'images/profile/photo/default.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2021-03-01 12:44:48'),
(2, 'Admin', 'admin1@gmail.com', '$2y$10$.N5BuOd1muPHua2v/sXPMuXQKt5waf9p93Zv4cIigAWdH3JW.O8k2', 1, 'participant', NULL, NULL, 'images/profile/photo/default.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2021-03-01 12:44:48'),
(3, 'Participant', 'participant@gmail.com', '$2y$10$s4kbWImGrVgfe2KtaTp9WuUEXP82biZTe0SPeUhMY./h4UDQ1ibo2', 1, 'participant', NULL, NULL, 'images/profile/photo/default.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2021-03-01 12:44:48'),
(4, 'Campaigner', 'campaigner@gmail.com', '$2y$10$Y1AcipLDFF4wlbMogiASfOlZ1NoJL0Oi2aUu6MFehPbkp.33fjMu.', 1, 'campaigner', NULL, NULL, 'images/profile/photo/default.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/ktp/ktp011.jpg', '111222333444555', '1234567890', 0, NULL, NULL, '2021-03-01 12:44:48'),
(5, 'beat fraps', 'beatfraps@gmail.com', '$2y$10$m.vDEYkWt88gfuyH6Q2I4e1LZ2.ggkqoPIgk5J5ivIoV9xH9IelhW', 1, 'admin', NULL, NULL, 'images/profile/photo/default.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 12:45:22', '2021-03-01 12:45:22', '2021-03-01 12:44:48'),
(6, 'fraps beat', 'frapsbeat@gmail.com', '$2y$10$R2cVr1BhZYwscCcnuKSSIelmjBRyNl/7qbZmLUSIOVcikqYVviYSy', 1, 'participant', NULL, NULL, 'images/profile/photo/default.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 13:42:33', '2021-03-01 13:42:33', '2021-03-01 12:44:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_forum`
--
ALTER TABLE `comment_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_forum_idforum_foreign` (`idForum`),
  ADD KEY `comment_forum_idparticipant_foreign` (`idParticipant`);

--
-- Indexes for table `detail_allocation`
--
ALTER TABLE `detail_allocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_allocation_iddonation_foreign` (`idDonation`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donation_title_unique` (`title`),
  ADD KEY `donation_category_foreign` (`category`),
  ADD KEY `donation_status_foreign` (`status`),
  ADD KEY `donation_idcampaigner_foreign` (`idCampaigner`);

--
-- Indexes for table `event_status`
--
ALTER TABLE `event_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_idparticipant_foreign` (`idParticipant`);

--
-- Indexes for table `forum_like`
--
ALTER TABLE `forum_like`
  ADD PRIMARY KEY (`idForum`,`idParticipant`),
  ADD KEY `forum_like_idparticipant_foreign` (`idParticipant`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participate_donation`
--
ALTER TABLE `participate_donation`
  ADD PRIMARY KEY (`idDonation`,`idParticipant`),
  ADD KEY `participate_donation_idparticipant_foreign` (`idParticipant`);

--
-- Indexes for table `participate_petition`
--
ALTER TABLE `participate_petition`
  ADD PRIMARY KEY (`idPetition`,`idParticipant`),
  ADD KEY `participate_petition_idparticipant_foreign` (`idParticipant`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `petition`
--
ALTER TABLE `petition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `petition_title_unique` (`title`),
  ADD KEY `petition_category_foreign` (`category`),
  ADD KEY `petition_status_foreign` (`status`),
  ADD KEY `petition_idcampaigner_foreign` (`idCampaigner`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_user_id_foreign` (`user_id`),
  ADD KEY `service_receiver_foreign` (`receiver`);

--
-- Indexes for table `status_user`
--
ALTER TABLE `status_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`idDonation`,`idParticipant`),
  ADD KEY `transaction_idparticipant_foreign` (`idParticipant`);

--
-- Indexes for table `update_news`
--
ALTER TABLE `update_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `update_news_idpetition_foreign` (`idPetition`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_email_unique` (`email`),
  ADD KEY `users_status_foreign` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment_forum`
--
ALTER TABLE `comment_forum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_allocation`
--
ALTER TABLE `detail_allocation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `petition`
--
ALTER TABLE `petition`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `update_news`
--
ALTER TABLE `update_news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment_forum`
--
ALTER TABLE `comment_forum`
  ADD CONSTRAINT `comment_forum_idforum_foreign` FOREIGN KEY (`idForum`) REFERENCES `forum` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_forum_idparticipant_foreign` FOREIGN KEY (`idParticipant`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_allocation`
--
ALTER TABLE `detail_allocation`
  ADD CONSTRAINT `detail_allocation_iddonation_foreign` FOREIGN KEY (`idDonation`) REFERENCES `donation` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_category_foreign` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `donation_idcampaigner_foreign` FOREIGN KEY (`idCampaigner`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `donation_status_foreign` FOREIGN KEY (`status`) REFERENCES `event_status` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `forum_idparticipant_foreign` FOREIGN KEY (`idParticipant`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forum_like`
--
ALTER TABLE `forum_like`
  ADD CONSTRAINT `forum_like_idforum_foreign` FOREIGN KEY (`idForum`) REFERENCES `forum` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_like_idparticipant_foreign` FOREIGN KEY (`idParticipant`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `participate_donation`
--
ALTER TABLE `participate_donation`
  ADD CONSTRAINT `participate_donation_iddonation_foreign` FOREIGN KEY (`idDonation`) REFERENCES `donation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `participate_donation_idparticipant_foreign` FOREIGN KEY (`idParticipant`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `participate_petition`
--
ALTER TABLE `participate_petition`
  ADD CONSTRAINT `participate_petition_idparticipant_foreign` FOREIGN KEY (`idParticipant`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `participate_petition_idpetition_foreign` FOREIGN KEY (`idPetition`) REFERENCES `petition` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `petition`
--
ALTER TABLE `petition`
  ADD CONSTRAINT `petition_category_foreign` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `petition_idcampaigner_foreign` FOREIGN KEY (`idCampaigner`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `petition_status_foreign` FOREIGN KEY (`status`) REFERENCES `event_status` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_receiver_foreign` FOREIGN KEY (`receiver`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_iddonation_foreign` FOREIGN KEY (`idDonation`) REFERENCES `donation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_idparticipant_foreign` FOREIGN KEY (`idParticipant`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `update_news`
--
ALTER TABLE `update_news`
  ADD CONSTRAINT `update_news_idpetition_foreign` FOREIGN KEY (`idPetition`) REFERENCES `petition` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_status_foreign` FOREIGN KEY (`status`) REFERENCES `status_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
