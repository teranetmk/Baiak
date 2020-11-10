-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 17, 2020 at 04:20 AM
-- Server version: 10.4.12-MariaDB-log
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app`
--

-- --------------------------------------------------------

--
-- Table structure for table `changelogs`
--

CREATE TABLE `changelogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `changelogs`
--

INSERT INTO `changelogs` (`id`, `player_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Testando Titulo Um', 'testando-titulo-um', 'Testando Descrição Um', '2020-08-13 00:19:55', '2020-08-13 00:19:55'),
(2, 1, 'Testando Titulo Dois', 'testando-titulo-dois', 'Testando Descrição Dois', '2020-08-13 00:19:55', '2020-08-13 00:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(25, '2014_10_12_000000_create_users_table', 1),
(26, '2014_10_12_100000_create_password_resets_table', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2020_08_10_202434_create_news', 1),
(29, '2020_08_10_221613_create_changelogs', 1),
(30, '2020_08_12_220624_create_players_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Testando Titulo Um', 'Testando descrição 1', '2020-08-13 00:18:56', '2020-08-13 00:18:56'),
(2, 'Testando Titulo Dois', 'Testando descrição 2', '2020-08-13 00:18:56', '2020-08-13 00:18:56');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('daniel@hotmail.com', '$2y$10$LvNo5hfGqFrOneAKY41WLe1KES.sXVM4n53fQ4To2aArM8h9loF7i', '2020-08-13 06:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lookbody` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookfeet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookhead` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `looklegs` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `looktype` smallint(5) UNSIGNED NOT NULL DEFAULT 136,
  `lookaddons` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `direction` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `maglevel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mana` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manamax` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `soul` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `town_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `posx` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `posy` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `posz` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `conditions` blob DEFAULT NULL,
  `cap` int(10) UNSIGNED NOT NULL DEFAULT 400,
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `save` tinyint(4) NOT NULL DEFAULT 1,
  `online` tinyint(4) NOT NULL DEFAULT 0,
  `skull` tinyint(4) NOT NULL DEFAULT 0,
  `skulltime` bigint(20) NOT NULL DEFAULT 0,
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blessings` tinyint(4) NOT NULL DEFAULT 0,
  `onlinetime` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `hidden` tinyint(4) NOT NULL DEFAULT 0,
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT 43200,
  `offlinetraining_skill` int(11) NOT NULL DEFAULT -1,
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT 2520,
  `dodges` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `criticals` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `talk_himself` tinyint(4) NOT NULL DEFAULT 0,
  `party_id` int(11) NOT NULL DEFAULT 0,
  `castviewers` int(11) NOT NULL DEFAULT 0,
  `castdescription` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `caststatus` int(11) NOT NULL DEFAULT 0,
  `skill_fist` smallint(5) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_club` smallint(5) UNSIGNED NOT NULL DEFAULT 10,
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_sword` smallint(5) UNSIGNED NOT NULL DEFAULT 10,
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_axe` smallint(5) UNSIGNED NOT NULL DEFAULT 10,
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_dist` smallint(5) UNSIGNED NOT NULL DEFAULT 10,
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_shielding` smallint(5) UNSIGNED NOT NULL DEFAULT 10,
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_fishing` smallint(5) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `outfits` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`outfits`)),
  `quests` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`quests`)),
  `tasks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tasks`)),
  `spells` blob DEFAULT NULL,
  `storages` mediumblob DEFAULT NULL,
  `items` longblob DEFAULT NULL,
  `depot_items` longblob DEFAULT NULL,
  `inbox_items` longblob DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `slug`, `group_id`, `account_id`, `level`, `vocation_id`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `direction`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `online`, `skull`, `skulltime`, `lastlogout`, `blessings`, `onlinetime`, `balance`, `comment`, `hidden`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `dodges`, `criticals`, `talk_himself`, `party_id`, `castviewers`, `castdescription`, `caststatus`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `outfits`, `quests`, `tasks`, `spells`, `storages`, `items`, `depot_items`, `inbox_items`, `deleted_at`, `created_at`) VALUES
(1, 'Player Um', 'player-um', 1, 1, 100, 3, 150, 150, 0, 0, 0, 0, 0, 136, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 400, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', 0, 43200, -1, 2520, 0, 0, 0, 0, 0, '', 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Player Dois', 'player-dois', 1, 1, 100, 6, 150, 150, 0, 0, 0, 0, 0, 136, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 400, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', 0, 43200, -1, 2520, 0, 0, 0, 0, 0, '', 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `account_name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'daniel1', 'eqwkpokqwe@hotmail.com', '$2y$10$ZgkXfTRy8OcsuUDbGEW1W.A1xEneOQQBmxyUP782Cle0GtZlAPO1m', NULL, '2020-08-13 21:51:00', '2020-08-13 21:51:00'),
(6, 'daniel2', 'daniqwopekqw@hotmail.com', '$2y$10$khtw6Ak4Wot4ZAQ8ur/66.xnKUYPx4lnCyE/chUICxjfKEPBLkqqK', NULL, '2020-08-13 21:51:09', '2020-08-13 21:51:09'),
(7, 'daniel3', 'eqwkpokeqw@hotmail.com', '$2y$10$Ug2XrQqWWqfSDkJUyvJnyu.T.DLvyjcIsn40SSuPMiR5IUx.nwAH6', NULL, '2020-08-13 21:51:16', '2020-08-13 21:51:16'),
(8, 'realmarksamman', 'suahu@gmail.com', '$2y$10$YIF8Q4KlCP49ozoFbnN3HuEDSmyIsCRfAQ1mOlGKjErdJ.Ebk3iRW', NULL, '2020-08-13 22:27:36', '2020-08-13 22:27:36'),
(9, 'testando', 'qwepokqwek@hotmail.com', '$2y$10$T7SGRKzkvG6LSipqMS7ppOy0DqaW4oU0IuoCvIFGiICCE84iPDuZ.', NULL, '2020-08-14 04:28:42', '2020-08-14 04:28:42'),
(10, 'daniel200', 'qewkpoqew@hotmail.com', '$2y$10$dX1Ih.SwH5Cvxv4caZDIn.ufHxT44W2OsU7KJsIsKTxDs2sqN4uEy', NULL, '2020-08-14 05:50:17', '2020-08-14 05:50:17'),
(11, 'daniel300', 'qewkopkqew@hotmail.com', '$2y$10$q1dfoQ/Dv1SG.gn9gx0oHut.2Ma3BooP7IPJVvgR.5A54MNIdH8Wi', NULL, '2020-08-14 05:51:25', '2020-08-14 05:51:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `changelogs`
--
ALTER TABLE `changelogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `changelogs`
--
ALTER TABLE `changelogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
