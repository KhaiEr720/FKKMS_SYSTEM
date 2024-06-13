-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2024 at 06:37 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fkkms`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_ID` varchar(255) NOT NULL,
  `User_ID` varchar(255) NOT NULL,
  `MatricID` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `User_type` varchar(255) NOT NULL,
  `Product_name` varchar(255) NOT NULL,
  `Price` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `Kiosk_ID` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `application_ID`, `User_ID`, `MatricID`, `name`, `User_type`, `Product_name`, `Price`, `status`, `reason`, `Kiosk_ID`, `created_at`, `updated_at`) VALUES
(3, 'APP57972', 'VEN57942', NULL, 'Hafiz', 'Vendor', 'Kopi Saigon', 350.3, 'Rejected', 'asdasd', NULL, '2023-12-26 10:10:02', '2023-12-29 11:29:22'),
(9, 'APP57970', 'VEN66555', NULL, 'test2', 'Vendor', 'Cheese Cake', 200, NULL, NULL, 'KIOSK72997', '2023-12-29 02:48:47', '2024-01-11 01:17:10'),
(11, 'APP49588', 'STD97440', 'CB21112', 'Luqman', 'FK Student', 'Teh Ais Coke', 5.5, 'Approved', NULL, 'KIOSK88339', '2023-12-29 12:31:03', '2023-12-31 03:41:19'),
(13, 'APP20620', 'VEN62477', NULL, 'Kamil', 'Vendor', 'asdasd', 12.6, NULL, NULL, NULL, '2023-12-29 14:01:15', '2023-12-29 14:01:15'),
(17, 'APP83282', 'STD91947', 'CB21014', 'Khai Er', 'FK Student', 'Teh Beng', 2.5, 'Approved', NULL, 'KIOSK55530', '2024-05-07 21:15:26', '2024-05-07 21:40:03'),
(18, 'APP17416', 'STD28271', 'CB21014', 'Khai Er', 'FK Student', 'Nasi Lemak Ayam Goreng', 7, NULL, NULL, NULL, '2024-05-08 21:15:47', '2024-05-08 21:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `complaint_ID` varchar(255) NOT NULL,
  `User_ID` varchar(255) NOT NULL,
  `PupukAdmin_ID` varchar(255) DEFAULT NULL,
  `FKTechnicalTeam_ID` varchar(255) DEFAULT NULL,
  `complaintCategory_ID` int(11) NOT NULL,
  `complaintStatus_ID` int(11) NOT NULL,
  `details` varchar(255) NOT NULL,
  `addNote` varchar(255) DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `complaint_ID`, `User_ID`, `PupukAdmin_ID`, `FKTechnicalTeam_ID`, `complaintCategory_ID`, `complaintStatus_ID`, `details`, `addNote`, `Date`, `Time`, `created_at`, `updated_at`) VALUES
(4, 'COM48851', 'STD97440', NULL, NULL, 3, 1, 'asd', NULL, '2024-01-11', '14:33:00', '2024-01-10 22:34:04', '2024-01-10 22:37:31'),
(5, 'COM21122', 'STD97440', NULL, NULL, 1, 0, 'asd', NULL, '2024-01-11', '14:35:00', '2024-01-10 22:36:05', '2024-01-10 22:36:05'),
(6, 'COM62546', 'STD91947', NULL, NULL, 1, 0, 'Less Payment', NULL, '2024-05-08', '13:16:00', '2024-05-07 21:16:32', '2024-05-07 21:16:32'),
(7, 'COM38761', 'STD91947', NULL, NULL, 3, 2, 'asd', NULL, '2024-05-08', '13:49:00', '2024-05-07 21:50:10', '2024-05-07 21:52:06'),
(8, 'COM73626', 'STD38346', NULL, NULL, 1, 0, 'asds', NULL, '2024-05-09', '13:48:00', '2024-05-08 21:49:04', '2024-05-08 21:49:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_27_194933_create_navbars_table', 1),
(7, '2023_11_27_214308_create_sessions_table', 1),
(8, '2023_12_22_113030_create_applications_table', 1),
(9, '2023_12_30_150213_create_payments_table', 2),
(10, '2024_01_07_134314_create_complaints_table', 3),
(11, '2024_01_07_152846_create_reports_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `navbars`
--

CREATE TABLE `navbars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '$2y$12$PIfRq3ExKQT5k.ABxbDT2.NJ4HvNiftPeqxawjiNv2JxGe.8saYsW', '2024-05-07 21:32:27'),
('khaier.chan207@gmail.com', '$2y$12$YihZAHXXnmuq2TZsX9up/uphDh9c.fx/NYW6XSCFAQL.HZNuAG8MW', '2024-05-07 21:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Payment_ID` varchar(255) NOT NULL,
  `User_ID` varchar(255) NOT NULL,
  `PaymentType` varchar(255) DEFAULT NULL,
  `PaymentMonth` int(11) NOT NULL,
  `PaymentDate` date NOT NULL,
  `Total_Price` double NOT NULL,
  `receipt` varchar(255) DEFAULT NULL,
  `paymentOpt` varchar(100) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `Payment_ID`, `User_ID`, `PaymentType`, `PaymentMonth`, `PaymentDate`, `Total_Price`, `receipt`, `paymentOpt`, `remark`, `created_at`, `updated_at`) VALUES
(16, 'PAY41878', 'STD91947', 'Registration Fee', 5, '2024-05-08', 20, NULL, 'FPX', 'Pending', '2024-05-07 21:41:05', '2024-05-07 21:41:05'),
(17, 'PAY92213', 'STD91947', 'Registration Fee', 5, '2024-05-08', 20, NULL, 'FPX', 'Pending', '2024-05-07 21:44:26', '2024-05-07 21:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Sales_ID` varchar(255) NOT NULL,
  `User_ID` varchar(255) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `Tax_Rate` double NOT NULL,
  `Tax` double NOT NULL,
  `Date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `Sales_ID`, `User_ID`, `qty`, `Tax_Rate`, `Tax`, `Date`, `created_at`, `updated_at`) VALUES
(12, 'SALES_92073', 'STD97440', 4, 0.06, 1.32, '2024-01-10', '2024-01-11 01:13:32', '2024-01-11 01:13:32'),
(13, 'SALES_70366', 'VEN66555', 6, 0.06, 84, '2024-01-10', '2024-01-11 01:17:35', '2024-01-11 01:17:53'),
(14, 'SALES_69375', 'STD12869', 10, 0.06, 6, '2024-02-01', '2024-01-11 04:22:05', '2024-01-11 04:22:05'),
(15, 'SALES_54159', 'STD91947', 10, 0.06, 1.5, '2024-05-08', '2024-05-07 21:16:53', '2024-05-07 21:16:53'),
(16, 'SALES_87813', 'STD91947', 100, 0.06, 15, '2024-05-09', '2024-05-08 21:09:35', '2024-05-08 21:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('bPzdzToO3ZG1WBPqGsrJKxUQRwrSODl4nBlQi6lM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXFDS3hGaXdYMkdha080UDJPT2RpOXVZbE1xUmU1SHM5UGlkSjFrdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1715834486),
('sigG0iipP8zuy3RCUCnLJxXY4MDnfA1Oa06IDDYz', 9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRzdjcHdrenlsVEUxWHlYN1ZhRW5rcjluclBEY2tmdTJzQU9iMWoybiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb21wbGFpbnRzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6OTt9', 1715233842);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `User_ID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `MatricID` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `User_type` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `User_ID`, `name`, `MatricID`, `company`, `email`, `User_type`, `phone`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'STD97440', 'Luqman', 'CB21112', NULL, 'test@gmail.com', 'FK Student', '0123456781', NULL, '$2y$12$fZ2YmgUgphz8fuGy4Jq1r.K1iAAps6x5JWmkaR09Voc1u9jvcibeO', NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-25 12:41:05', '2023-12-30 01:04:52'),
(2, 'VEN66555', 'test2', NULL, 'Weed Entreprise', 'test2@gmail.com', 'Vendor', '0123456784', NULL, '$2y$12$qwq6QIBrBCpT5U8ulswqw.ewzUYWcBUEXvw.4Sy8uOVSdVb/DHFMG', NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-25 12:41:46', '2023-12-25 12:41:46'),
(3, 'ADM51020', 'Admin', NULL, NULL, 'admin@gmail.com', 'Admin', NULL, NULL, '$2y$12$YH0Ql9RI1S2BcL6vLhii/O3aIyC61LOGto/VoLyLB2A1Hm0VTcwn6', NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-25 12:45:22', '2023-12-25 12:45:22'),
(4, 'PPK62477', 'Pupuk Admin', NULL, NULL, 'pupuk@gmail.com', 'Pupuk Admin', NULL, NULL, '$2y$12$YH0Ql9RI1S2BcL6vLhii/O3aIyC61LOGto/VoLyLB2A1Hm0VTcwn6', NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-29 10:38:03', '2023-12-29 14:01:15'),
(5, 'BUR27512', 'FK Bursary', NULL, NULL, 'bursary@gmail.com', 'FK Bursary', NULL, NULL, '$2y$12$0QtM7cpB51NwwfnajNseYe.PLI.r7WjP7TUbunUqSv.Acr.bq.e.K', NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-30 13:58:30', '2023-12-30 13:58:30'),
(6, 'TCH12869', 'hanif', 'CB20169', NULL, 'technical@gmail.com', 'FK Technical', '0192783200', NULL, '$2y$12$YH0Ql9RI1S2BcL6vLhii/O3aIyC61LOGto/VoLyLB2A1Hm0VTcwn6', NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-11 04:18:42', '2024-01-11 04:23:30'),
(7, 'STD91947', 'Khai Er', 'CB21014', NULL, 'khaier.cke207@gmail.com', 'FK Student', '01139105272', NULL, '$2y$12$YH0Ql9RI1S2BcL6vLhii/O3aIyC61LOGto/VoLyLB2A1Hm0VTcwn6', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-07 21:12:24', '2024-05-07 21:15:26'),
(8, 'STD28271', 'Khai Er', 'CB21014', NULL, 'khaier.chan207@gmail.com', 'FK Student', '01139105272', NULL, '$2y$12$fif6R9SxAxnrwZxpxuTMb.V29gA9M6JmtpxDtnbXNF.rzYVNezpmq', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-08 20:34:48', '2024-05-08 21:15:47'),
(9, 'STD38346', 'Khai', 'CB21014', NULL, 'khai@gmail.com', 'FK Student', NULL, NULL, '$2y$12$wtHVBjPkPaMjXVxNrMd3NOgLrfpxxAthP5P3iqhlexCLla6mZ57H.', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-08 21:45:04', '2024-05-08 21:45:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `applications_application_id_unique` (`application_ID`),
  ADD UNIQUE KEY `applications_user_id_unique` (`User_ID`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `complaints_complaint_id_unique` (`complaint_ID`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navbars`
--
ALTER TABLE `navbars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_payment_id_unique` (`Payment_ID`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reports_sales_id_unique` (`Sales_ID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_id_unique` (`User_ID`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `navbars`
--
ALTER TABLE `navbars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
