-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 07, 2023 at 07:24 PM
-- Server version: 8.0.32
-- PHP Version: 8.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopbiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'products', 'موجودی انبار کالا بروزرسانی شد', 'Modules\\Product\\Entities\\Product', NULL, 8, 'Modules\\User\\Entities\\User', 1, '{\"نام کالا \": \"شیائومی ۳4\", \"تعداد کالاهای رزرو \": \"۰\", \"تعداد کالاهای قابل فروش \": \"۱۰\", \"تعداد کالاهای فروخته شده \": \"۰\"}', NULL, '2023-02-07 17:54:17', '2023-02-07 17:54:17'),
(2, 'products', 'موجودی انبار کالا بروزرسانی شد', 'Modules\\Product\\Entities\\Product', NULL, 7, 'Modules\\User\\Entities\\User', 1, '{\"نام کالا \": \"سامسونگ ۱۱\", \"تعداد کالاهای رزرو \": \"۰\", \"تعداد کالاهای قابل فروش \": \"۴۰\", \"تعداد کالاهای فروخته شده \": \"۰\"}', NULL, '2023-02-07 17:54:31', '2023-02-07 17:54:31'),
(3, 'products', 'موجودی انبار کالا بروزرسانی شد', 'Modules\\Product\\Entities\\Product', NULL, 6, 'Modules\\User\\Entities\\User', 1, '{\"نام کالا \": \"سامسونگ ۱۲\", \"تعداد کالاهای رزرو \": \"۰\", \"تعداد کالاهای قابل فروش \": \"۲۵\", \"تعداد کالاهای فروخته شده \": \"۰\"}', NULL, '2023-02-07 17:54:43', '2023-02-07 17:54:43'),
(4, 'products', 'موجودی انبار کالا بروزرسانی شد', 'Modules\\Product\\Entities\\Product', NULL, 5, 'Modules\\User\\Entities\\User', 1, '{\"نام کالا \": \"سامسونگ ۱\", \"تعداد کالاهای رزرو \": \"۰\", \"تعداد کالاهای قابل فروش \": \"۱۴\", \"تعداد کالاهای فروخته شده \": \"۰\"}', NULL, '2023-02-07 17:55:05', '2023-02-07 17:55:05'),
(5, 'products', 'موجودی انبار کالا بروزرسانی شد', 'Modules\\Product\\Entities\\Product', NULL, 1, 'Modules\\User\\Entities\\User', 1, '{\"نام کالا \": \"پوکو ایکس ۳\", \"تعداد کالاهای رزرو \": \"۰\", \"تعداد کالاهای قابل فروش \": \"۲۹\", \"تعداد کالاهای فروخته شده \": \"۰\"}', NULL, '2023-02-07 17:56:52', '2023-02-07 17:56:52'),
(6, 'products', 'موجودی انبار کالا بروزرسانی شد', 'Modules\\Product\\Entities\\Product', NULL, 4, 'Modules\\User\\Entities\\User', 1, '{\"نام کالا \": \"ایفون 12\", \"تعداد کالاهای رزرو \": \"۰\", \"تعداد کالاهای قابل فروش \": \"۵\", \"تعداد کالاهای فروخته شده \": \"۰\"}', NULL, '2023-02-07 17:57:01', '2023-02-07 17:57:01'),
(7, 'products', 'موجودی انبار کالا بروزرسانی شد', 'Modules\\Product\\Entities\\Product', NULL, 3, 'Modules\\User\\Entities\\User', 1, '{\"نام کالا \": \"شیائومی ۳\", \"تعداد کالاهای رزرو \": \"۰\", \"تعداد کالاهای قابل فروش \": \"۱۶\", \"تعداد کالاهای فروخته شده \": \"۰\"}', NULL, '2023-02-07 17:57:13', '2023-02-07 17:57:13'),
(8, 'products', 'موجودی انبار کالا بروزرسانی شد', 'Modules\\Product\\Entities\\Product', NULL, 2, 'Modules\\User\\Entities\\User', 1, '{\"نام کالا \": \"شیائومی ۲\", \"تعداد کالاهای رزرو \": \"۰\", \"تعداد کالاهای قابل فروش \": \"۹\", \"تعداد کالاهای فروخته شده \": \"۰\"}', NULL, '2023-02-07 17:57:26', '2023-02-07 17:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `city_id` bigint UNSIGNED NOT NULL,
  `province_id` bigint UNSIGNED NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `recipient_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `recipient_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  KEY `addresses_city_id_foreign` (`city_id`),
  KEY `addresses_province_id_foreign` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amazing_sales`
--

DROP TABLE IF EXISTS `amazing_sales`;
CREATE TABLE IF NOT EXISTS `amazing_sales` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `percentage` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `amazing_sales_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `amazing_sales`
--

INSERT INTO `amazing_sales` (`id`, `product_id`, `percentage`, `status`, `start_date`, `end_date`, `link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 1, '2023-01-21 15:15:06', '2023-02-19 15:15:06', NULL, '2023-01-10 16:15:24', '2023-01-21 15:15:08', NULL),
(2, 2, 11, 1, '2023-01-13 12:57:12', '2023-01-20 12:57:12', NULL, '2023-01-13 12:56:10', '2023-01-16 15:49:09', '2023-01-16 15:49:09'),
(3, 2, 3, 1, '2023-01-21 15:11:15', '2023-02-19 15:11:15', NULL, '2023-01-16 15:50:05', '2023-01-21 15:11:19', NULL),
(4, 3, 9, 1, '2023-01-21 16:47:42', '2023-02-19 16:47:42', NULL, '2023-01-21 16:48:00', '2023-01-21 16:48:00', NULL),
(5, 5, 1, 1, '2023-01-21 16:48:03', '2023-02-19 16:48:03', NULL, '2023-01-21 16:48:11', '2023-01-21 16:48:11', NULL),
(6, 4, 11, 1, '2023-01-21 16:48:15', '2023-02-19 16:48:15', NULL, '2023-01-21 16:48:25', '2023-02-07 18:34:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `type`, `unit`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'صفحه نمایش', 0, 'اینچ', 1, '2023-02-07 16:33:15', '2023-02-07 16:33:15', NULL),
(2, 'حافظه رم', 0, 'گیگابایت', 1, '2023-02-07 16:33:37', '2023-02-07 16:33:37', NULL),
(3, 'نوع صفحه نمایش', 0, 'پنل', 1, '2023-02-07 16:34:11', '2023-02-07 16:34:11', NULL),
(4, 'اندازه باتری', 0, 'میلی امپر', 1, '2023-02-07 16:34:38', '2023-02-07 16:34:38', NULL),
(5, 'دوربین', 0, 'مگاپیکسل', 1, '2023-02-07 16:35:14', '2023-02-07 16:35:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_category`
--

DROP TABLE IF EXISTS `attribute_category`;
CREATE TABLE IF NOT EXISTS `attribute_category` (
  `attribute_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`attribute_id`,`category_id`),
  KEY `attribute_category_category_id_foreign` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attribute_category`
--

INSERT INTO `attribute_category` (`attribute_id`, `category_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_default_values`
--

DROP TABLE IF EXISTS `attribute_default_values`;
CREATE TABLE IF NOT EXISTS `attribute_default_values` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_default_values_attribute_id_foreign` (`attribute_id`),
  KEY `attribute_default_values_category_id_foreign` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE IF NOT EXISTS `attribute_values` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint NOT NULL DEFAULT '0' COMMENT 'value type is 0 => simple, 1 => multi values select by customers (affected on price)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_product_id_foreign` (`product_id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `product_id`, `attribute_id`, `value`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 5, '{\"value\":\"16\",\"price_increase\":\"0\"}', 0, '2023-02-07 18:45:43', '2023-02-07 18:45:43', NULL),
(2, 1, 5, '{\"value\":\"16\",\"price_increase\":\"0\"}', 0, '2023-02-07 18:45:43', '2023-02-07 18:45:43', NULL),
(3, 2, 5, '{\"value\":\"16\",\"price_increase\":\"0\"}', 0, '2023-02-07 18:45:43', '2023-02-07 18:45:43', NULL),
(4, 3, 5, '{\"value\":\"16\",\"price_increase\":\"0\"}', 0, '2023-02-07 18:45:43', '2023-02-07 18:45:43', NULL),
(5, 5, 5, '{\"value\":\"16\",\"price_increase\":\"0\"}', 0, '2023-02-07 18:45:43', '2023-02-07 18:45:43', NULL),
(6, 6, 5, '{\"value\":\"16\",\"price_increase\":\"0\"}', 0, '2023-02-07 18:45:43', '2023-02-07 18:45:43', NULL),
(7, 7, 5, '{\"value\":\"16\",\"price_increase\":\"0\"}', 0, '2023-02-07 18:45:43', '2023-02-07 18:45:43', NULL),
(8, 8, 5, '{\"value\":\"16\",\"price_increase\":\"0\"}', 0, '2023-02-07 18:45:43', '2023-02-07 18:45:43', NULL),
(9, 4, 4, '{\"value\":\"3225\",\"price_increase\":\"0\"}', 0, '2023-02-07 19:18:46', '2023-02-07 19:18:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `position` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `url`, `position`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'بنر تستی', '\"images\\\\banner\\\\2023\\\\01\\\\10\\\\1673381538.jpg\"', '/', 0, 1, '2023-01-10 16:42:18', '2023-01-10 16:42:18', NULL),
(2, 'بنر تستی ۲', '\"images\\\\banner\\\\2023\\\\01\\\\10\\\\1673381652.jpg\"', '/', 0, 1, '2023-01-10 16:44:13', '2023-01-10 16:44:13', NULL),
(3, 'بنر تستی ۳', '\"images\\\\banner\\\\2023\\\\01\\\\10\\\\1673381713.jpg\"', '/', 1, 1, '2023-01-10 16:45:13', '2023-01-10 16:45:28', NULL),
(4, 'بنر تستی ۴', '\"images\\\\banner\\\\2023\\\\02\\\\07\\\\1675794777.jpg\"', '/', 6, 1, '2023-01-10 16:46:40', '2023-02-07 18:32:57', NULL),
(5, 'بنر تستی ۵', '\"images\\\\banner\\\\2023\\\\02\\\\07\\\\1675794759.jpg\"', '/', 6, 1, '2023-01-10 16:47:21', '2023-02-07 18:32:39', NULL),
(6, 'بنر تستی ۶', '\"images\\\\banner\\\\2023\\\\01\\\\10\\\\1673381884.jpg\"', '/', 6, 1, '2023-01-10 16:48:04', '2023-01-10 16:48:04', NULL),
(7, 'بنر تستی ۷', '\"images\\\\banner\\\\2023\\\\02\\\\07\\\\1675794742.jpg\"', '/', 6, 1, '2023-01-10 16:48:42', '2023-02-07 18:32:22', NULL),
(8, 'بنر تستی ۸', '\"images\\\\banner\\\\2023\\\\01\\\\10\\\\1673382021.jpg\"', '/', 4, 1, '2023-01-10 16:50:21', '2023-01-10 16:50:21', NULL),
(9, 'بنر تستی ۹', '\"images\\\\banner\\\\2023\\\\01\\\\10\\\\1673382093.jpg\"', '/', 2, 1, '2023-01-10 16:51:33', '2023-01-10 16:51:33', NULL),
(10, 'بنر تستی ۱۰', '\"images\\\\banner\\\\2023\\\\01\\\\10\\\\1673382114.jpg\"', '/', 2, 1, '2023-01-10 16:51:54', '2023-01-15 15:25:14', NULL),
(11, 'بنر تستی ۱۱', '\"images\\\\banner\\\\2023\\\\01\\\\15\\\\1673807430.jpg\"', '/', 1, 1, '2023-01-15 15:00:30', '2023-01-15 15:09:36', '2023-01-15 15:09:36'),
(12, 'بنر تستی ۱۱', '\"images\\\\banner\\\\2023\\\\01\\\\15\\\\1673807996.jpg\"', '/', 1, 1, '2023-01-15 15:09:56', '2023-01-15 15:20:25', '2023-01-15 15:20:25'),
(13, 'بنر تستی ۱۱', '\"images\\\\banner\\\\2023\\\\02\\\\07\\\\1675794705.jpg\"', '/panel', 1, 1, '2023-01-15 15:20:55', '2023-02-07 18:31:45', NULL),
(14, 'بنر', '\"images\\\\banner\\\\2023\\\\02\\\\07\\\\1675794484.jpg\"', '/', 0, 1, '2023-02-07 18:28:04', '2023-02-07 18:28:04', NULL),
(15, 'بنر', '\"images\\\\banner\\\\2023\\\\02\\\\07\\\\1675794510.jpg\"', '/', 0, 1, '2023-02-07 18:28:31', '2023-02-07 18:28:31', NULL),
(16, 'بنر', '\"images\\\\banner\\\\2023\\\\02\\\\07\\\\1675794534.jpg\"', '/', 0, 1, '2023-02-07 18:28:54', '2023-02-07 18:28:54', NULL),
(17, 'بنر', '\"images\\\\banner\\\\2023\\\\02\\\\07\\\\1675794553.gif\"', '/', 0, 1, '2023-02-07 18:29:13', '2023-02-07 18:29:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `persian_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `persian_name`, `original_name`, `slug`, `logo`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'سامسونگ', 'Samsung', 'Samsung', '\"images\\\\brand\\\\2023\\\\02\\\\07\\\\1675779968.png\"', 1, '2023-02-07 14:26:08', '2023-02-07 14:26:08', NULL),
(2, 'اپل', 'apple', 'apple', '\"images\\\\brand\\\\2023\\\\02\\\\07\\\\1675779991.png\"', 1, '2023-02-07 14:26:31', '2023-02-07 14:26:31', NULL),
(3, 'جی پلاس', 'Gplus', 'Gplus', '\"images\\\\brand\\\\2023\\\\02\\\\07\\\\1675780041.jpg\"', 1, '2023-02-07 14:27:21', '2023-02-07 14:27:21', NULL),
(4, 'هواوی', 'huawei', 'huawei', '\"images\\\\brand\\\\2023\\\\02\\\\07\\\\1675780092.jpg\"', 1, '2023-02-07 14:28:12', '2023-02-07 14:28:12', NULL),
(5, 'لاجیتک', 'logitech', 'logitech', '\"images\\\\brand\\\\2023\\\\02\\\\07\\\\1675780126.jpg\"', 1, '2023-02-07 14:28:46', '2023-02-07 14:28:46', NULL),
(6, 'شیائومی', 'xiaomi', 'xiaomi', '\"images\\\\brand\\\\2023\\\\02\\\\07\\\\1675780277.png\"', 1, '2023-02-07 14:31:17', '2023-02-07 14:31:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `color_id` bigint UNSIGNED DEFAULT NULL,
  `guarantee_id` bigint UNSIGNED DEFAULT NULL,
  `number` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_color_id_foreign` (`color_id`),
  KEY `cart_items_guarantee_id_foreign` (`guarantee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `color_id`, `guarantee_id`, `number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 4, NULL, NULL, 1, '2023-02-07 19:23:08', '2023-02-07 19:23:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_item_selected_attributes`
--

DROP TABLE IF EXISTS `cart_item_selected_attributes`;
CREATE TABLE IF NOT EXISTS `cart_item_selected_attributes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_item_id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `attribute_value_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_item_selected_attributes_cart_item_id_foreign` (`cart_item_id`),
  KEY `cart_item_selected_attributes_attribute_id_foreign` (`attribute_id`),
  KEY `cart_item_selected_attributes_attribute_value_id_foreign` (`attribute_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_payments`
--

DROP TABLE IF EXISTS `cash_payments`;
CREATE TABLE IF NOT EXISTS `cash_payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` decimal(20,3) NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `cash_receiver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pay_date` timestamp NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_payments_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `province_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_province_id_foreign` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=473 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `province_id`, `name`, `name_en`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, ' آذرشهر', 'Azarshahr', '37.75888900', '45.97833300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(2, 1, ' اسکو', 'Osku', '37.91583300', '46.12361100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(3, 1, ' اهر', 'Ahar', '38.48943050', '47.06835750', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(4, 1, ' بستان آباد', 'Bostanabad', '37.85000000', '46.83333300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(5, 1, ' بناب', 'Bonab', '37.34027800', '46.05611100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(6, 1, ' تبریز', 'Tabriz', '38.06666700', '46.30000000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(7, 1, ' جلفا', 'Jolfa', '38.94027800', '45.63083300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(8, 1, ' چار اویماق', 'Charuymaq', '37.12990520', '47.02456860', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(9, 1, ' سراب', 'Sarab', '37.94083300', '47.53666700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(10, 1, ' شبستر', 'Shabestar', '38.18027800', '45.70277800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(11, 1, ' عجبشیر', 'Ajab Shir', '37.47750000', '45.89416700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(12, 1, ' کلیبر', 'Kaleybar', '38.86944400', '47.03555600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(13, 1, ' مراغه', 'Maragheh', '37.38916700', '46.23750000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(14, 1, ' مرند', 'Marand', '38.42511700', '45.76963600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(15, 1, ' ملکان', 'Malekan', '37.14562500', '46.16852420', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(16, 1, ' میانه', 'Mianeh', '37.42111100', '47.71500000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(17, 1, ' ورزقان', 'Varzaqan', '38.50972200', '46.65444400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(18, 1, ' هریس', 'Heris', '29.77518250', '-95.31025050', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(19, 1, 'هشترود', 'Hashtrud', '37.47777800', '47.05083300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(20, 2, ' ارومیه', 'Urmia', '37.55527800', '45.07250000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(21, 2, ' اشنویه', 'Oshnavieh', '37.03972200', '45.09833300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(22, 2, ' بوکان', 'Bukan', '36.52111100', '46.20888900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(23, 2, ' پیرانشهر', 'Piranshahr', '36.69444400', '45.14166700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(24, 2, ' تکاب', 'Takab', '36.40083300', '47.11333300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(25, 2, ' چالدران', 'Chaldoran', '39.06498370', '44.38446790', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(26, 2, ' خوی', 'Khoy', '38.55027800', '44.95222200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(27, 2, ' سردشت', 'Sardasht', '36.15527800', '45.47888900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(28, 2, ' سلماس', 'Salmas', '38.19722200', '44.76527800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(29, 2, ' شاهین دژ', 'Shahin Dezh\r\n', '36.67916700', '46.56694400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(30, 2, ' ماکو', 'Maku', '39.29527800', '44.51666700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(31, 2, ' مهاباد', 'Mahabad', '36.76305600', '45.72222200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(32, 2, ' میاندوآب', 'Miandoab', '36.96944400', '46.10277800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(33, 2, ' نقده', 'Naqadeh', '36.95527800', '45.38805600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(34, 3, ' اردبیل', 'Ardabil', '38.48532760', '47.89112090', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(35, 3, ' بیله سوار', 'Bileh Bileh Savar', '39.35677750', '47.94907650', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(36, 3, ' پارس آباد', 'Parsabad', '39.64833300', '47.91750000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(37, 3, ' خلخال', 'Khalkhal', '37.61888900', '48.52583300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(38, 3, ' کوثر', 'Kowsar', '31.86768660', '54.33798020', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(39, 3, ' گرمی', 'Germi', '39.03722670', '47.92770210', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(40, 3, ' مشگین', 'Meshginshahr', '38.39888900', '47.68194400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(41, 3, ' نمین', 'Namin', '38.42694400', '48.48388900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(42, 3, ' نیر', 'Nir', '38.03472200', '47.99861100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(43, 4, ' آران و بیدگل', 'Aran va Bidgol', '34.05777800', '51.48416700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(44, 4, ' اردستان', 'Ardestan', '33.37611100', '52.36944400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(45, 4, ' اصفهان', 'Isfahan', '32.65462750', '51.66798260', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(46, 4, ' برخوار و میمه', 'Borkhar and Meymeh', '32.83333300', '51.77500000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(47, 4, ' تیران و کرون', 'Tiran and Karvan', NULL, NULL, '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(48, 4, ' چادگان', 'Chadegan', '32.76833300', '50.62861100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(49, 4, ' خمینی شهر', 'Khomeyni Shahr', '32.70027800', '51.52111100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(50, 4, ' خوانسار', 'Khvansar', '33.22055600', '50.31500000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(51, 4, ' سمیرم', 'Semirom', '31.39883460', '51.56759300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(52, 4, ' شاهین شهر و میمه', 'Shahin Shahr and Meymeh ', '33.12718520', '51.51500770', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(53, 4, ' شهر رضا', 'Shahreza', '36.29244520', '59.56771490', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(54, 4, 'دهاقان', 'Dehaqan', '31.94000000', '51.64777800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(55, 4, ' فریدن', 'Faridan', '33.02148290', '50.30690880', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(56, 4, ' فریدون شهر', 'Fereydunshahr', '32.94111100', '50.12111100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(57, 4, ' فلاورجان', 'Falavarjan', '32.55527800', '51.50972200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(58, 4, ' کاشان', 'Kashan', '33.98503580', '51.40996250', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(59, 4, ' گلپایگان', 'Golpayegan', '33.45361100', '50.28833300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(60, 4, ' لنجان', 'Lenjan', '32.47501680', '51.30508510', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(61, 4, ' مبارکه', 'Mobarakeh', '32.34638900', '51.50444400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(62, 4, ' نائین', 'Nain', '32.85994450', '53.08783210', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(63, 4, ' نجف آباد', 'Najafabad', '32.63242310', '51.36799140', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(64, 4, ' نطنز', 'Natanz', '33.51333300', '51.91638900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(65, 5, ' ساوجبلاق', 'Savojbolagh', '38.37879410', '47.49743590', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(66, 5, ' کرج', 'Karaj', '35.84001880', '50.93909060', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(67, 5, ' نظرآباد', 'Nazarabad', '35.95222200', '50.60750000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(68, 5, 'طالقان', 'Taleqan', '33.27291710', '52.19853140', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(69, 6, ' آبدانان', 'Abdanan', '32.99250000', '47.41972200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(70, 6, ' ایلام', 'Ilam', '33.29576180', '46.67053400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(71, 6, ' ایوان', 'Eyvan', '33.82722200', '46.30972200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(72, 6, ' دره شهر', 'Darreh Shahr', '33.13972200', '47.37611100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(73, 6, ' دهلران', 'Dehloran', '32.69416700', '47.26777800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(74, 6, ' شیران و چرداول', 'Chardavol', '33.69383480', '46.74784930', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(75, 6, ' مهران', 'Mehran', '33.12222200', '46.16472200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(76, 7, ' بوشهر', 'Bushehr', '28.92338370', '50.82031400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(77, 7, ' تنگستان', 'Tangestan', '28.98375470', '50.83307080', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(78, 7, ' جم', 'Jam', '27.82777800', '52.32694400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(79, 7, ' دشتستان', 'Dashtestan', '29.26666700', '51.21666700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(80, 7, ' دشتی', 'Dashti', '35.78451450', '51.43479610', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(81, 7, ' دیر', 'Deyr', '27.84000000', '51.93777800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(82, 7, ' دیلم', 'Deylam', '30.11826320', '50.22612270', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(83, 7, ' کنگان', 'Kangan', '27.83704370', '52.06454730', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(84, 7, ' گناوه', 'Ganaveh', '29.57916700', '50.51694400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(85, 8, ' اسلام شهر', 'Eslamshahr', '35.54458050', '51.23024570', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(86, 8, ' پاکدشت', NULL, '35.46689130', '51.68606250', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(87, 8, ' تهران', NULL, '35.69611100', '51.42305600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(88, 8, ' دماوند', NULL, '35.94674940', '52.12754810', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(89, 8, ' رباط کریم', NULL, '35.48472200', '51.08277800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(90, 8, ' ری', NULL, '35.57733200', '51.46276200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(91, 8, ' شمیرانات', NULL, '35.95480210', '51.59916430', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(92, 8, ' شهریار', NULL, '35.65972200', '51.05916700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(93, 8, ' فیروزکوه', NULL, '35.43867100', '60.80938700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(94, 8, ' ورامین', NULL, '35.32524070', '51.64719870', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(95, 9, ' اردل', NULL, '31.99972200', '50.66166700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(96, 9, ' بروجن', NULL, '31.96527800', '51.28722200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(97, 9, ' شهرکرد', NULL, '32.32555600', '50.86444400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(98, 9, ' فارسان', NULL, '32.25820660', '50.57050880', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(99, 9, ' کوهرنگ', NULL, '32.55583640', '51.67872520', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(100, 9, ' لردگان', NULL, '31.51027800', '50.82944400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(101, 10, ' بیرجند', NULL, '32.86490390', '59.22624720', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(102, 10, ' درمیان', NULL, '33.03394050', '60.11847970', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(103, 10, ' سرایان', NULL, '33.86027800', '58.52166700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(104, 10, ' سر بیشه', NULL, '32.57555600', '59.79833300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(105, 10, ' فردوس', NULL, '34.01861100', '58.17222200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(106, 10, ' قائن', NULL, '33.72666700', '59.18444400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(107, 10, ' نهبندان', NULL, '31.54194400', '60.03638900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(108, 11, ' برد سکن', NULL, '35.26083300', '57.96972200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(109, 11, ' بجستان', NULL, '34.51638900', '58.18444400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(110, 11, ' تایباد', NULL, '34.74000000', '60.77555600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(111, 11, ' تحت جلگه', NULL, NULL, NULL, '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(112, 11, ' تربت جام', NULL, '35.24388900', '60.62250000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(113, 11, ' تربت حیدریه', NULL, '35.27388900', '59.21944400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(114, 11, ' چناران', NULL, '36.64555600', '59.12111100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(115, 11, ' جغتای', NULL, '36.57888530', '57.25121500', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(116, 11, ' جوین', NULL, '36.63622380', '57.50799120', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(117, 11, ' خلیل آباد', NULL, '35.25583300', '58.28638900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(118, 11, ' خواف', NULL, '34.57638900', '60.14083300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(119, 11, ' درگز', NULL, '37.44444400', '59.10805600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(120, 11, ' رشتخوار', NULL, '34.97472200', '59.62361100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(121, 11, ' زاوه', NULL, '35.27473220', '59.46777270', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(122, 11, ' سبزوار', NULL, '36.21518230', '57.66782280', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(123, 11, ' سرخس', NULL, '36.54500000', '61.15777800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(124, 11, ' فریمان', NULL, '35.70694400', '59.85000000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(125, 11, ' قوچان', NULL, '37.10611100', '58.50944400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(126, 11, 'طرقبه شاندیز', NULL, '36.35488410', '59.43839550', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(127, 11, ' کاشمر', NULL, '35.23833300', '58.46555600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(128, 11, ' کلات', NULL, '34.19833300', '58.54444400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(129, 11, ' گناباد', NULL, '34.35277800', '58.68361100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(130, 11, ' مشهد', NULL, '36.26046230', '59.61675490', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(131, 11, ' مه ولات', NULL, '35.02108290', '58.78181160', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(132, 11, ' نیشابور', NULL, '36.21408650', '58.79609150', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(133, 12, ' اسفراین', NULL, '37.07638900', '57.51000000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(134, 12, ' بجنورد', NULL, '37.47500000', '57.33333300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(135, 12, ' جاجرم', NULL, '36.95000000', '56.38000000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(136, 12, ' شیروان', NULL, '37.40923570', '57.92761840', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(137, 12, ' فاروج', NULL, '37.23111100', '58.21888900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(138, 12, ' مانه و سملقان', NULL, '37.66206140', '56.74120700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(139, 13, ' آبادان', NULL, '30.34729600', '48.29340040', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(140, 13, ' امیدیه', NULL, '30.74583300', '49.70861100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(141, 13, ' اندیمشک', NULL, '32.46000000', '48.35916700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(142, 13, ' اهواز', NULL, '31.31832720', '48.67061870', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(143, 13, ' ایذه', NULL, '31.83416700', '49.86722200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(144, 13, ' باغ ملک', NULL, '32.39472060', '51.59653280', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(145, 13, ' بندرماهشهر', NULL, '30.55888900', '49.19805600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(146, 13, ' بهبهان', NULL, '30.59583300', '50.24166700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(147, 13, ' خرمشهر', NULL, '30.42562190', '48.18911850', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(148, 13, ' دزفول', NULL, '32.38307770', '48.42358410', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(149, 13, ' دشت آزادگان', NULL, '31.55805600', '48.18083300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(150, 13, ' رامشیر', NULL, '30.89565210', '49.40947010', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(151, 13, ' رامهرمز', NULL, '31.28000000', '49.60361100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(152, 13, ' شادگان', NULL, '30.64972200', '48.66472200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(153, 13, ' شوش', NULL, '32.19416700', '48.24361100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(154, 13, ' شوشتر', NULL, '32.04555600', '48.85666700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(155, 13, ' گتوند', NULL, '32.25138900', '48.81611100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(156, 13, ' لالی', NULL, '32.32888900', '49.09361100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(157, 13, ' مسجد سلیمان', NULL, '31.93638900', '49.30388900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(158, 13, ' هندیجان', NULL, '30.23638900', '49.71194400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(159, 14, ' ابهر', NULL, '36.14666700', '49.21805600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(160, 14, ' ایجرود', NULL, '36.41609280', '48.24692490', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(161, 14, ' خدابنده', NULL, '36.11472200', '48.59111100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(162, 14, ' خرمدره', NULL, '36.20305600', '49.18694400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(163, 14, ' زنجان', NULL, '36.50181850', '48.39881860', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(164, 14, ' طارم', NULL, '28.18042870', '55.74533670', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(165, 14, ' ماه نشان', NULL, '36.74444400', '47.67250000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(166, 15, ' دامغان', NULL, '36.16833300', '54.34805600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(167, 15, ' سمنان', NULL, '35.22555850', '54.43421380', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(168, 15, ' شاهرود', NULL, '36.41805600', '54.97638900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(169, 15, ' گرمسار', NULL, '35.21833300', '52.34083300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(170, 15, ' مهدی شهر', NULL, '35.70000000', '53.35000000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(171, 16, ' ایرانشهر', NULL, '27.20250000', '60.68472200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(172, 16, ' چابهار', NULL, '25.29194400', '60.64305600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(173, 16, ' خاش', NULL, '28.21666700', '61.20000000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(174, 16, ' دلگان', NULL, '27.60773570', '59.47209040', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(175, 16, ' زابل', NULL, '31.02861100', '61.50111100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(176, 16, ' زاهدان', NULL, '29.49638900', '60.86277800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(177, 16, ' زهک', NULL, '30.89388900', '61.68027800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(178, 16, ' سراوان', NULL, '27.37083300', '62.33416700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(179, 16, ' سرباز', NULL, '26.63083300', '61.25638900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(180, 16, ' کنارک', NULL, '25.36027800', '60.39944400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(181, 16, ' نیکشهر', NULL, '26.41847190', '60.21107520', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(182, 17, ' آباده', NULL, '31.16083300', '52.65055600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(183, 17, ' ارسنجان', NULL, '29.91250000', '53.30861100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(184, 17, ' استهبان', NULL, '29.12666700', '54.04222200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(185, 17, ' اقلید', NULL, '30.89888900', '52.68666700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(186, 17, ' بوانات', NULL, '30.48559070', '53.59333040', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(187, 17, ' پاسارگاد', NULL, '30.20330750', '53.17901000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(188, 17, ' جهرم', NULL, '28.50000000', '53.56055600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(189, 17, ' خرم بید', NULL, '32.67083450', '51.64702790', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(190, 17, ' خنج', NULL, '27.89138900', '53.43444400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(191, 17, ' داراب', NULL, '28.75194400', '54.54444400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(192, 17, ' زرین دشت', NULL, '28.35450470', '54.41780060', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(193, 17, ' سپیدان', NULL, '30.24252820', '51.99241850', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(194, 17, ' شیراز', NULL, '29.59176770', '52.58369820', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(195, 17, ' فراشبند', NULL, '28.87138900', '52.09166700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(196, 17, ' فسا', NULL, '28.93833300', '53.64833300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(197, 17, ' فیروزآباد', NULL, '28.84388900', '52.57083300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(198, 17, ' قیر و کارزین', NULL, '28.42998000', '53.09516000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(199, 17, ' کازرون', NULL, '29.61944400', '51.65416700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(200, 17, ' لارستان', NULL, '27.68111100', '54.34027800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(201, 17, ' لامرد', NULL, '27.34237710', '53.18035580', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(202, 17, ' مرودشت', NULL, '29.87416700', '52.80250000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(203, 17, ' ممسنی', NULL, '31.96003450', '50.51226520', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(204, 17, ' مهر', NULL, '27.55599310', '52.88472050', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(205, 17, ' نی ریز', NULL, '29.19888900', '54.32777800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(206, 18, ' آبیک', NULL, '36.04000000', '50.53111100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(207, 18, ' البرز', NULL, '35.99604670', '50.92892460', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(208, 18, ' بوئین زهرا', NULL, '35.76694400', '50.05777800', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(209, 18, ' تاکستان', NULL, '36.06972200', '49.69583300', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(210, 18, ' قزوین', NULL, '36.08813170', '49.85472660', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(211, 19, ' قم', NULL, '34.63994430', '50.87594190', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(212, 20, ' بانه', NULL, '35.99859990', '45.88234280', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(213, 20, ' بیجار', NULL, '32.73527800', '59.46666700', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(214, 20, ' دیواندره', NULL, '35.91388900', '47.02388900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(215, 20, ' سروآباد', NULL, '35.31250000', '46.36694400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(216, 20, ' سقز', NULL, '36.24638900', '46.26638900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(217, 20, ' سنندج', NULL, '35.32187480', '46.98616470', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(218, 20, ' قروه', NULL, '35.16789340', '47.80382720', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(219, 20, ' کامیاران', NULL, '34.79555600', '46.93555600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(220, 20, ' مریوان', NULL, '35.52694400', '46.17638900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(221, 21, ' بافت', NULL, '29.23305600', '56.60222200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(222, 21, ' بردسیر', NULL, '29.92750000', '56.57222200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(223, 21, ' بم', NULL, '29.10611100', '58.35694400', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(224, 21, ' جیرفت', NULL, '28.67511240', '57.73715690', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(225, 21, ' راور', NULL, '31.26555600', '56.80555600', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(226, 21, ' رفسنجان', NULL, '30.40666700', '55.99388900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(227, 21, ' رودبار جنوب', NULL, '36.82412890', '49.42372740', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(228, 21, ' زرند', NULL, '30.81277800', '56.56388900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(229, 21, ' سیرجان', NULL, '29.45866760', '55.67140510', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(230, 21, ' شهر بابک', NULL, '30.11638900', '55.11861100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(231, 21, ' عنبرآباد', NULL, '28.47833330', '57.84138890', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(232, 21, ' قلعه گنج', NULL, '27.52361100', '57.88111100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(233, 21, ' کرمان', NULL, '29.48500890', '57.64390480', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(234, 21, ' کوهبنان', NULL, '31.41027800', '56.28250000', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(235, 21, ' کهنوج', NULL, '27.94676030', '57.70625720', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(236, 21, ' منوجان', NULL, '27.44756260', '57.50516160', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(237, 22, ' اسلام آباد غرب', NULL, '33.72938820', '73.09314610', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(238, 22, ' پاوه', NULL, '35.04333300', '46.35638900', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(239, 22, ' ثلاث باباجانی', NULL, '34.73583710', '46.14939690', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(240, 22, ' جوانرود', NULL, '34.80666700', '46.48861100', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(241, 22, ' دالاهو', NULL, '34.28416700', '46.24222200', '2023-01-14 17:06:59', '2023-01-14 17:06:59', NULL),
(242, 22, ' روانسر', NULL, '34.71208920', '46.65129980', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(243, 22, ' سرپل ذهاب', NULL, '34.46111100', '45.86277800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(244, 22, ' سنقر', NULL, '34.78361100', '47.60027800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(245, 22, ' صحنه', NULL, '34.48138900', '47.69083300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(246, 22, ' قصر شیرین', NULL, '34.51590310', '45.57768590', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(247, 22, ' کرمانشاه', NULL, '34.45762330', '46.67053400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(248, 22, ' کنگاور', NULL, '34.50416700', '47.96527800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(249, 22, ' گیلان غرب', NULL, '34.14222200', '45.92027800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(250, 22, ' هرسین', NULL, '34.27191490', '47.60461830', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(251, 23, ' بویر احمد', NULL, '30.72458600', '50.84563230', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(252, 23, ' بهمئی', NULL, NULL, NULL, '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(253, 23, ' دنا', NULL, '30.95166660', '51.43750000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(254, 23, ' کهگیلویه', NULL, NULL, NULL, '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(255, 23, ' گچساران', NULL, '30.35000000', '50.80000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(256, 24, ' آزادشهر', NULL, '37.08694400', '55.17388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(257, 24, ' آق قلا', NULL, '37.01388900', '54.45500000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(258, 24, ' بندر گز', NULL, '36.77496500', '53.94617490', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(259, 24, ' بندر ترکمن', NULL, '36.90166700', '54.07083300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(260, 24, ' رامیان', NULL, '37.01611100', '55.14111100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(261, 24, ' علی آباد', NULL, '36.30822600', '74.61954740', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(262, 24, ' کرد کوی', NULL, '36.79414260', '54.11027400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(263, 24, ' کلاله', NULL, '37.38083300', '55.49166700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(264, 24, ' گرگان', NULL, '36.84564270', '54.43933630', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(265, 24, ' گنبد کاووس', NULL, '37.25000000', '55.16722200', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(266, 24, ' مینو دشت', NULL, '37.22888900', '55.37472200', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(267, 25, ' آستارا', NULL, '38.42916700', '48.87194400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(268, 25, ' آستانه اشرفیه', NULL, '37.25980220', '49.94366210', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(269, 25, ' املش', NULL, '37.09163340', '50.18693770', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(270, 25, ' بندر انزلی', NULL, '37.47244670', '49.45873120', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(271, 25, ' رشت', NULL, '37.28083300', '49.58305600', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(272, 25, ' رضوانشهر', NULL, '37.55067500', '49.14098010', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(273, 25, ' رودبار', NULL, '36.82412890', '49.42372740', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(274, 25, ' رودسر', NULL, '37.13784150', '50.28361990', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(275, 25, ' سیاهکل', NULL, '37.15277800', '49.87083300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(276, 25, ' شفت', NULL, '39.63063100', '-78.92954200', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(277, 25, ' صومعه سرا', NULL, '37.31166700', '49.32194400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(278, 25, ' طوالش', NULL, '37.00000000', '48.42222220', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(279, 25, ' فومن', NULL, '37.22388900', '49.31250000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(280, 25, ' لاهیجان', NULL, '37.20722200', '50.00388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(281, 25, ' لنگرود', NULL, '37.19694400', '50.15361100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(282, 25, ' ماسال', NULL, '37.36211850', '49.13147690', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(283, 26, ' ازنا', NULL, '33.45583300', '49.45555600', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(284, 26, ' الیگودرز', NULL, '33.40055600', '49.69500000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(285, 26, ' بروجرد', NULL, '33.89419930', '48.76703300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(286, 26, ' پلدختر', NULL, '33.15361100', '47.71361100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(287, 26, ' خرم آباد', NULL, '33.48777800', '48.35583300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(288, 26, ' دورود', NULL, '33.49550280', '49.06317430', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(289, 17, ' لامرد', NULL, '27.34237710', '53.18035580', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(290, 17, ' مرودشت', NULL, '29.87416700', '52.80250000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(291, 17, ' ممسنی', NULL, '31.96003450', '50.51226520', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(292, 17, ' مهر', NULL, '27.55599310', '52.88472050', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(293, 17, ' نی ریز', NULL, '29.19888900', '54.32777800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(294, 18, ' آبیک', NULL, '36.04000000', '50.53111100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(295, 18, ' البرز', NULL, '35.99604670', '50.92892460', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(296, 18, ' بوئین زهرا', NULL, '35.76694400', '50.05777800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(297, 18, ' تاکستان', NULL, '36.06972200', '49.69583300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(298, 18, ' قزوین', NULL, '36.08813170', '49.85472660', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(299, 19, ' قم', NULL, '34.63994430', '50.87594190', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(300, 20, ' بانه', NULL, '35.99859990', '45.88234280', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(301, 20, ' بیجار', NULL, '32.73527800', '59.46666700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(302, 20, ' دیواندره', NULL, '35.91388900', '47.02388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(303, 20, ' سروآباد', NULL, '35.31250000', '46.36694400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(304, 20, ' سقز', NULL, '36.24638900', '46.26638900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(305, 20, ' سنندج', NULL, '35.32187480', '46.98616470', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(306, 20, ' قروه', NULL, '35.16789340', '47.80382720', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(307, 20, ' کامیاران', NULL, '34.79555600', '46.93555600', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(308, 20, ' مریوان', NULL, '35.52694400', '46.17638900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(309, 21, ' بافت', NULL, '29.23305600', '56.60222200', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(310, 21, ' بردسیر', NULL, '29.92750000', '56.57222200', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(311, 21, ' بم', NULL, '29.10611100', '58.35694400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(312, 21, ' جیرفت', NULL, '28.67511240', '57.73715690', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(313, 21, ' راور', NULL, '31.26555600', '56.80555600', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(314, 21, ' رفسنجان', NULL, '30.40666700', '55.99388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(315, 21, ' رودبار جنوب', NULL, '36.82412890', '49.42372740', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(316, 21, ' زرند', NULL, '30.81277800', '56.56388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(317, 21, ' سیرجان', NULL, '29.45866760', '55.67140510', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(318, 21, ' شهر بابک', NULL, '30.11638900', '55.11861100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(319, 21, ' عنبرآباد', NULL, '28.47833330', '57.84138890', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(320, 21, ' قلعه گنج', NULL, '27.52361100', '57.88111100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(321, 21, ' کرمان', NULL, '29.48500890', '57.64390480', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(322, 21, ' کوهبنان', NULL, '31.41027800', '56.28250000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(323, 21, ' کهنوج', NULL, '27.94676030', '57.70625720', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(324, 21, ' منوجان', NULL, '27.44756260', '57.50516160', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(325, 22, ' اسلام آباد غرب', NULL, '33.72938820', '73.09314610', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(326, 22, ' پاوه', NULL, '35.04333300', '46.35638900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(327, 22, ' ثلاث باباجانی', NULL, '34.73583710', '46.14939690', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(328, 22, ' جوانرود', NULL, '34.80666700', '46.48861100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(329, 22, ' دالاهو', NULL, '34.28416700', '46.24222200', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(330, 22, ' روانسر', NULL, '34.71208920', '46.65129980', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(332, 22, ' سنقر', NULL, '34.78361100', '47.60027800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(333, 22, ' صحنه', NULL, '34.48138900', '47.69083300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(334, 22, ' قصر شیرین', NULL, '34.51590310', '45.57768590', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(335, 22, ' کرمانشاه', NULL, '34.45762330', '46.67053400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(336, 22, ' کنگاور', NULL, '34.50416700', '47.96527800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(337, 22, ' گیلان غرب', NULL, '34.14222200', '45.92027800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(338, 22, ' هرسین', NULL, '34.27191490', '47.60461830', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(339, 23, ' بویر احمد', NULL, '30.72458600', '50.84563230', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(341, 23, ' دنا', NULL, '30.95166660', '51.43750000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(343, 23, ' گچساران', NULL, '30.35000000', '50.80000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(344, 24, ' آزادشهر', NULL, '37.08694400', '55.17388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(345, 24, ' آق قلا', NULL, '37.01388900', '54.45500000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(346, 24, ' بندر گز', NULL, '36.77496500', '53.94617490', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(347, 24, ' بندر ترکمن', NULL, '36.90166700', '54.07083300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(348, 24, ' رامیان', NULL, '37.01611100', '55.14111100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(349, 24, ' علی آباد', NULL, '36.30822600', '74.61954740', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(350, 24, ' کرد کوی', NULL, '36.79414260', '54.11027400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(351, 24, ' کلاله', NULL, '37.38083300', '55.49166700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(352, 24, ' گرگان', NULL, '36.84564270', '54.43933630', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(353, 24, ' گنبد کاووس', NULL, '37.25000000', '55.16722200', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(354, 24, ' مینو دشت', NULL, '37.22888900', '55.37472200', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(355, 25, ' آستارا', NULL, '38.42916700', '48.87194400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(356, 25, ' آستانه اشرفیه', NULL, '37.25980220', '49.94366210', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(357, 25, ' املش', NULL, '37.09163340', '50.18693770', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(358, 25, ' بندر انزلی', NULL, '37.47244670', '49.45873120', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(359, 25, ' رشت', NULL, '37.28083300', '49.58305600', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(360, 25, ' رضوانشهر', NULL, '37.55067500', '49.14098010', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(361, 25, ' رودبار', NULL, '36.82412890', '49.42372740', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(362, 25, ' رودسر', NULL, '37.13784150', '50.28361990', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(363, 25, ' سیاهکل', NULL, '37.15277800', '49.87083300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(364, 25, ' شفت', NULL, '39.63063100', '-78.92954200', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(365, 25, ' صومعه سرا', NULL, '37.31166700', '49.32194400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(366, 25, ' طوالش', NULL, '37.00000000', '48.42222220', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(367, 25, ' فومن', NULL, '37.22388900', '49.31250000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(368, 25, ' لاهیجان', NULL, '37.20722200', '50.00388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(369, 25, ' لنگرود', NULL, '37.19694400', '50.15361100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(370, 25, ' ماسال', NULL, '37.36211850', '49.13147690', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(371, 26, ' ازنا', NULL, '33.45583300', '49.45555600', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(372, 26, ' الیگودرز', NULL, '33.40055600', '49.69500000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(373, 26, ' بروجرد', NULL, '33.89419930', '48.76703300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(374, 26, ' پلدختر', NULL, '33.15361100', '47.71361100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(375, 26, ' خرم آباد', NULL, '33.48777800', '48.35583300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(376, 26, ' دورود', NULL, '33.49550280', '49.06317430', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(377, 26, ' دلفان', NULL, '33.50340140', '48.35758360', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(378, 26, ' سلسله', NULL, '32.04577600', '34.75163900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(379, 26, ' کوهدشت', NULL, '33.53500000', '47.60611100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(380, 26, ' الشتر', NULL, '33.86398880', '48.26423870', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(381, 26, ' نورآباد', NULL, '30.11416700', '51.52166700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(382, 27, ' آمل', NULL, '36.46972200', '52.35083300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(383, 27, ' بابل', NULL, '32.46819100', '44.55019350', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(384, 27, ' بابلسر', NULL, '36.70250000', '52.65750000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(385, 27, ' بهشهر', NULL, '36.69222200', '53.55250000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(386, 27, ' تنکابن', NULL, '36.81638900', '50.87388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(387, 27, ' جویبار', NULL, '36.64111100', '52.91250000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(388, 27, ' چالوس', NULL, '36.64591740', '51.40697900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(389, 27, ' رامسر', NULL, '36.90305600', '50.65833300', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(390, 27, ' ساری', NULL, '36.56333300', '53.06000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(391, 27, ' سوادکوه', NULL, '36.30402550', '52.88524030', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(392, 27, ' قائم شهر', NULL, '36.46305600', '52.86000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(393, 27, ' گلوگاه', NULL, '36.72722200', '53.80888900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(394, 27, ' محمود آباد', NULL, '36.63194400', '52.26277800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(395, 27, ' نکا', NULL, '36.65083300', '53.29916700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(396, 27, ' نور', NULL, '50.38512460', '3.26424360', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(397, 27, ' نوشهر', NULL, '36.64888900', '51.49611100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(398, 27, ' فریدونکنار', NULL, '36.68638900', '52.52250000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(399, 28, ' آشتیان', NULL, '34.52194400', '50.00611100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(400, 28, ' اراک', NULL, '34.09166700', '49.68916700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(401, 28, ' تفرش', NULL, '34.69194400', '50.01305600', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(402, 28, ' خمین', NULL, '33.64061480', '50.07711250', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(403, 28, ' دلیجان', NULL, '33.99055600', '50.68388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(404, 28, ' زرندیه', NULL, '35.30699620', '50.49117920', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(405, 28, ' ساوه', NULL, '35.02138900', '50.35666700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(406, 28, ' شازند', NULL, '33.92750000', '49.41166700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(407, 28, ' کمیجان', NULL, '34.71916700', '49.32666700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(408, 28, ' محلات', NULL, '33.90857480', '50.45526160', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(409, 29, ' بندرعباس', NULL, '27.18322160', '56.26664550', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(410, 29, ' میناب', NULL, '27.14666700', '57.08000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(411, 29, ' بندر لنگه', NULL, '26.55805600', '54.88055600', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(412, 29, ' رودان-دهبارز', NULL, '27.44083300', '57.19250000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(413, 29, ' جاسک', NULL, '25.64388900', '57.77444400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(414, 29, ' قشم', NULL, '26.81186730', '55.89132070', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(415, 29, ' حاجی آباد', NULL, '28.30916700', '55.90166700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(416, 29, ' ابوموسی', NULL, '25.87971060', '55.03280170', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(417, 29, ' بستک', NULL, '27.19916700', '54.36666700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(418, 29, ' گاوبندی', NULL, '27.20833300', '53.03611100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(419, 29, ' خمیر', NULL, '26.95222200', '55.58500000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(420, 30, ' اسدآباد', NULL, '34.78250000', '48.11861100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(421, 30, ' بهار', NULL, '34.90832520', '48.43927290', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(422, 30, ' تویسرکان', NULL, '34.54805600', '48.44694400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(423, 30, ' رزن', NULL, '35.38666700', '49.03388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(424, 30, ' کبودر آهنگ', NULL, '35.20833300', '48.72388900', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(425, 30, ' ملایر', NULL, '34.29694400', '48.82361100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(426, 30, ' نهاوند', NULL, '34.18861100', '48.37694400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(427, 30, ' همدان', NULL, '34.76079990', '48.39881860', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(428, 31, ' ابرکوه', NULL, '31.13040360', '53.25037360', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(429, 31, ' اردکان', NULL, '32.31000000', '54.01750000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(430, 31, ' بافق', NULL, '31.61277800', '55.41055600', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(431, 31, ' تفت', NULL, '27.97890740', '-97.39860410', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(432, 31, ' خاتم', NULL, '37.27091520', '49.59691460', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(433, 31, ' صدوق', NULL, '32.02421620', '53.47703590', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(434, 31, ' طبس', NULL, '33.59583300', '56.92444400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(435, 31, ' مهریز', NULL, '31.59166700', '54.43166700', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(436, 31, ' میبد', NULL, '32.24872260', '54.00793410', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(437, 31, ' یزد', NULL, '32.10063870', '54.43421380', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(438, 8, 'قرچک', NULL, '35.44000000', '51.57000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(439, 8, 'گلستان', NULL, '35.51000000', '51.16000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(440, 8, 'قدس', NULL, '35.72000000', '51.11000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(441, 8, 'ملارد', NULL, '35.66560000', '50.97810000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(442, 8, 'نسیم‌شهر', NULL, '35.55000000', '51.16670000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(443, 8, 'اندیشه', NULL, '35.68333000', '51.01666000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(444, 8, 'صالح‌آباد', NULL, '35.51670000', '51.18330000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(445, 8, 'باقرشهر', NULL, '35.50920000', '51.40220000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(446, 8, 'باغستان', NULL, '35.63830000', '51.11220000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(447, 8, 'بومهن', NULL, '35.73190000', '51.86470000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(448, 8, 'چهاردانگه', NULL, '35.83690000', '50.84670000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(449, 8, 'پیشوا', NULL, '35.60000000', '51.90000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(450, 8, 'پردیس', NULL, '35.73190000', '51.86470000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(451, 8, 'وحیدیه', NULL, '35.59640000', '51.04140000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(452, 8, 'نصیرآباد', NULL, '35.49530000', '51.13690000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(453, 8, 'فردوسیه', NULL, '35.60000000', '51.06670000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(454, 8, 'حسن‌آباد', NULL, '35.36750000', '51.23694400', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(455, 8, 'رودهن', NULL, '35.73890000', '51.91190000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(456, 8, 'شاهدشهر', NULL, '35.57140000', '51.08390000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(457, 8, 'صباشهر', NULL, '35.58330000', '51.11670000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(458, 8, 'صفادشت', NULL, '35.68448900', '50.82465800', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(459, 8, 'لواسان', NULL, '35.82430000', '51.63360000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(460, 8, 'آبسرد', NULL, '35.65066100', '52.01376100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(461, 8, 'شریف‌آباد', NULL, '35.42750000', '51.78530000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(462, 8, 'کهریزک', NULL, '35.51597200', '51.36221100', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL);
INSERT INTO `cities` (`id`, `province_id`, `name`, `name_en`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES
(463, 8, 'فشم', NULL, '35.93080000', '51.52610000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(464, 8, 'جوادآباد', NULL, NULL, NULL, '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(465, 8, 'کیلان', NULL, '35.55360000', '52.16330000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(466, 8, 'آبعلی', NULL, '35.76310000', '51.96560000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(467, 8, 'ارجمند', NULL, '35.81580000', '52.51670000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(468, 29, 'کیش', NULL, '26.00000000', '53.00000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(469, 29, 'لاوان', NULL, '26.00000000', '53.00000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(470, 29, 'پارسیان', NULL, '27.00000000', '54.00000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(471, 29, 'سیریک', NULL, '27.00000000', '54.00000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL),
(472, 29, 'بشاگرد', NULL, '27.00000000', '54.00000000', '2023-01-14 17:07:00', '2023-01-14 17:07:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `author_id` bigint UNSIGNED NOT NULL,
  `commentable_id` bigint UNSIGNED NOT NULL,
  `commentable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `seen` tinyint NOT NULL DEFAULT '0' COMMENT '0 => unseen, 1 => seen',
  `approved` tinyint NOT NULL DEFAULT '0' COMMENT '0 => not approved, 1 => approved',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_foreign` (`parent_id`),
  KEY `comments_author_id_foreign` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `body`, `parent_id`, `author_id`, `commentable_id`, `commentable_type`, `seen`, `approved`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'محصول خوبی است', NULL, 3, 1, 'Modules\\Product\\Entities\\Product', 1, 0, 1, '2023-01-13 17:24:28', '2023-02-05 12:57:32', NULL),
(2, 'پست خوبی است', NULL, 3, 1, 'Modules\\Post\\Entities\\Post', 1, 0, 1, '2023-01-13 17:24:28', '2023-01-16 12:14:09', '2023-02-06 18:39:13'),
(3, 'اوکی', 1, 1, 1, 'Modules\\Product\\Entities\\Product', 1, 0, 1, '2023-01-13 17:34:03', '2023-02-05 12:57:18', NULL),
(4, 'اوکی', 2, 1, 1, 'Modules\\Post\\Entities\\Post', 1, 0, 1, '2023-01-13 17:36:29', '2023-02-04 17:17:36', '2023-02-12 20:30:00'),
(5, 'بله بله', 2, 1, 1, 'Modules\\Post\\Entities\\Post', 1, 1, 1, '2023-01-16 12:15:46', '2023-01-16 12:15:47', '0000-00-00 00:00:00'),
(6, 'cccccc', 1, 1, 1, 'Modules\\Product\\Entities\\Product', 1, 0, 1, '2023-01-16 12:28:46', '2023-02-05 12:56:47', NULL),
(7, 'qdqwdwdqdqdwqd', NULL, 1, 3, 'Modules\\Product\\Entities\\Product', 1, 0, 1, '2023-01-24 16:03:26', '2023-02-05 12:56:42', NULL),
(8, 'QWDWQDQD', NULL, 3, 3, 'Modules\\Product\\Entities\\Product', 1, 0, 0, '2023-01-24 16:05:34', '2023-01-31 13:52:43', NULL),
(9, 'qwdwqdqwd', NULL, 1, 1, 'Modules\\Product\\Entities\\Product', 1, 1, 1, '2023-02-04 16:31:30', '2023-02-05 13:09:22', NULL),
(10, 'hhjjjjj', 9, 1, 1, 'Modules\\Product\\Entities\\Product', 1, 0, 1, '2023-02-05 12:59:02', '2023-02-05 13:15:01', NULL),
(11, 'wfefwfwefwf', 7, 1, 3, 'Modules\\Product\\Entities\\Product', 1, 0, 1, '2023-02-05 13:01:41', '2023-02-05 13:14:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `common_discount`
--

DROP TABLE IF EXISTS `common_discount`;
CREATE TABLE IF NOT EXISTS `common_discount` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `percentage` int NOT NULL,
  `discount_ceiling` bigint UNSIGNED DEFAULT NULL,
  `minimal_order_amount` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `common_discount`
--

INSERT INTO `common_discount` (`id`, `title`, `percentage`, `discount_ceiling`, `minimal_order_amount`, `status`, `start_date`, `end_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1401yalda', 10, 250000, 1000000, 0, '2023-01-13 12:54:32', '2023-01-20 12:54:32', '2023-01-08 05:27:12', '2023-01-13 12:54:51', NULL),
(2, 'rozeZan', 9, 500000, 2000000, 1, '2023-01-13 12:44:28', '2023-01-20 12:44:28', '2023-01-13 12:45:06', '2023-01-16 16:32:52', NULL),
(3, 'hhjjj', 20, 500000, 2000000, 1, '2023-01-16 16:32:18', '2023-01-19 16:32:18', '2023-01-16 16:32:09', '2023-01-16 16:32:48', '2023-01-16 16:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `copans`
--

DROP TABLE IF EXISTS `copans`;
CREATE TABLE IF NOT EXISTS `copans` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount_type` tinyint NOT NULL DEFAULT '0' COMMENT '0 => percentage, 1 => price unit',
  `discount_ceiling` bigint UNSIGNED DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '0 => common (each user can use one time), 1 => private (one user can use one time)',
  `status` tinyint NOT NULL DEFAULT '0',
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uses` bigint NOT NULL DEFAULT '0' COMMENT 'number of times can be used bu user',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `copans_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `copans`
--

INSERT INTO `copans` (`id`, `code`, `amount`, `amount_type`, `discount_ceiling`, `type`, `status`, `start_date`, `end_date`, `uses`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'zzxxccvv', '500000', 1, 500000, 0, 1, '2023-01-10 12:56:11', '2023-01-20 12:56:11', 0, NULL, '2023-01-10 12:56:39', '2023-01-13 09:13:46', NULL),
(2, 'copan001', '5', 0, 500000, 0, 1, '2023-01-13 08:21:49', '2023-01-13 08:21:49', 0, NULL, '2023-01-13 08:15:16', '2023-01-13 08:24:03', NULL),
(4, 'forMe', '100', 0, 19000000000, 1, 0, '2023-01-24 12:53:58', '2023-02-19 12:53:58', 0, 1, '2023-01-13 09:10:49', '2023-01-27 14:13:20', NULL),
(5, '162080', '1', 0, 500000, 0, 1, '2023-01-16 13:27:15', '2023-01-16 13:27:15', 0, NULL, '2023-01-16 13:26:56', '2023-01-16 13:27:38', '2023-01-16 13:27:38');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `capital_city` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `capital_city`, `name`, `name_en`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 88, 'ایران', 'iran', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(20,3) DEFAULT NULL,
  `delivery_time` int DEFAULT NULL,
  `delivery_time_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `name`, `amount`, `delivery_time`, `delivery_time_unit`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'تیپاکس', '500000.000', 6, 'روز', 1, '2023-01-06 05:15:49', '2023-01-13 13:05:14', NULL),
(2, 'پست پیشتاز', '200000.000', 2, 'روز', 1, '2023-01-13 12:58:34', '2023-01-16 15:15:06', NULL),
(3, 'چاپار', '500000.000', 7, 'روز', 1, '2023-01-16 15:10:30', '2023-01-16 15:19:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faqs_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'چه طوری خرید کنیم؟', '<p>چه طوری خرید کنیم</p>', 'چه-طوری-خرید-کنیم', 1, '2023-01-13 13:36:02', '2023-01-16 17:14:43', NULL),
(2, 'نحوه انتخاب سیستم در بخش اسمبل هوشمند چه گونه است؟', '<p>نحوه انتخاب سیستم در بخش اسمبل هوشمند چه گونه است</p>', 'نحوه-انتخاب-سیستم-در-بخش-اسمبل-هوشمند-چه-گونه-است', 1, '2023-01-16 17:13:34', '2023-01-16 17:14:39', '2023-01-16 17:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE IF NOT EXISTS `favorites` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `favoriteable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `favoriteable_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_favoriteable_type_favoriteable_id_index` (`favoriteable_type`,`favoriteable_id`),
  KEY `favorites_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guarantees`
--

DROP TABLE IF EXISTS `guarantees`;
CREATE TABLE IF NOT EXISTS `guarantees` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `price_increase` decimal(20,3) NOT NULL DEFAULT '0.000',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guarantees_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guarantees`
--

INSERT INTO `guarantees` (`id`, `name`, `duration`, `product_id`, `price_increase`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'الماس رایان ایرانیان', NULL, 8, '500000.000', 1, '2023-02-07 16:11:35', '2023-02-07 16:11:35', NULL),
(2, 'ماتریس', NULL, 8, '200002.000', 1, '2023-02-07 16:11:58', '2023-02-07 16:11:58', NULL),
(3, 'الماس رایان ایرانیان', NULL, 1, '500000.000', 1, '2023-02-07 16:11:35', '2023-02-07 16:11:35', NULL),
(4, 'ماتریس', NULL, 1, '200002.000', 1, '2023-02-07 16:11:58', '2023-02-07 16:11:58', NULL),
(5, 'الماس رایان ایرانیان', NULL, 2, '500000.000', 1, '2023-02-07 16:11:35', '2023-02-07 16:11:35', NULL),
(6, 'ماتریس', NULL, 2, '200002.000', 1, '2023-02-07 16:11:58', '2023-02-07 16:11:58', NULL),
(7, 'الماس رایان ایرانیان', NULL, 3, '500000.000', 1, '2023-02-07 16:11:35', '2023-02-07 16:11:35', NULL),
(8, 'ماتریس', NULL, 3, '200002.000', 1, '2023-02-07 16:11:58', '2023-02-07 16:11:58', NULL),
(9, 'الماس رایان ایرانیان', NULL, 4, '500000.000', 1, '2023-02-07 16:11:35', '2023-02-07 16:11:35', NULL),
(10, 'ماتریس', NULL, 4, '200002.000', 1, '2023-02-07 16:11:58', '2023-02-07 16:11:58', NULL),
(11, 'الماس رایان ایرانیان', NULL, 5, '500000.000', 1, '2023-02-07 16:11:35', '2023-02-07 16:11:35', NULL),
(12, 'ماتریس', NULL, 5, '200002.000', 1, '2023-02-07 16:11:58', '2023-02-07 16:11:58', NULL),
(13, 'الماس رایان ایرانیان', NULL, 6, '500000.000', 1, '2023-02-07 16:11:35', '2023-02-07 16:11:35', NULL),
(14, 'ماتریس', NULL, 6, '200002.000', 1, '2023-02-07 16:11:58', '2023-02-07 16:11:58', NULL),
(15, 'الماس رایان ایرانیان', NULL, 7, '500000.000', 1, '2023-02-07 16:11:35', '2023-02-07 16:11:35', NULL),
(16, 'ماتریس', NULL, 7, '200002.000', 1, '2023-02-07 16:11:58', '2023-02-07 16:11:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `likeable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `likeable_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_likeable_type_likeable_id_index` (`likeable_type`,`likeable_id`),
  KEY `likes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `url`, `status`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'فروش ویژه', '/products/special-sale', 1, NULL, '2023-01-10 16:34:20', '2023-01-10 16:37:05', '2023-01-10 16:37:05'),
(2, 'فروش ویژه', '/products/special-sale', 1, NULL, '2023-01-10 16:34:47', '2023-01-10 16:34:47', NULL),
(3, 'ادمین', '/panel', 1, NULL, '2023-01-11 16:49:09', '2023-01-13 13:22:41', NULL),
(4, 'درباره ما', '/', 1, NULL, '2023-01-13 13:24:20', '2023-01-13 13:24:20', NULL),
(5, 'شاپ بیز', '/panel', 1, NULL, '2023-01-15 15:54:58', '2023-01-15 15:59:03', NULL),
(6, 'ورود و ثبت نام', '/login-register', 1, NULL, '2023-01-19 18:33:25', '2023-01-19 18:33:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2018_12_14_000000_create_favorites_table', 1),
(5, '2018_12_14_000000_create_likes_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2021_01_14_234522_create_countries_table', 1),
(9, '2021_01_29_211219_create_attributes_table', 1),
(10, '2021_08_01_075829_create_sessions_table', 1),
(11, '2021_08_02_141330_create_post_categories_table', 1),
(12, '2021_08_02_141937_create_posts_table', 1),
(13, '2021_08_04_132104_create_menus_table', 1),
(14, '2021_08_04_132444_create_faqs_table', 1),
(15, '2021_08_06_133729_create_pages_table', 1),
(16, '2021_08_06_134109_create_comments_table', 1),
(17, '2021_08_07_144900_create_ticket_categories_table', 1),
(18, '2021_08_07_144919_create_ticket_priorities_table', 1),
(19, '2021_08_07_144926_create_ticket_admins_table', 1),
(20, '2021_08_09_083455_create_tickets_table', 1),
(21, '2021_08_09_083503_create_ticket_files_table', 1),
(22, '2021_08_21_151131_create_product_categories_table', 1),
(23, '2021_08_21_151142_create_brands_table', 1),
(24, '2021_08_22_144038_create_attribute_product_category_table', 1),
(25, '2021_08_22_144419_create_attribute_default_values_table', 1),
(26, '2021_08_22_144422_create_products_table', 1),
(27, '2021_08_23_072607_create_product_images_table', 1),
(28, '2021_08_23_072756_create_guarantees_table', 1),
(29, '2021_08_23_072836_create_product_colors_table', 1),
(30, '2021_08_23_072920_create_attribute_values_table', 1),
(31, '2021_08_23_073005_create_product_meta_table', 1),
(32, '2021_08_24_150339_create_copans_table', 1),
(33, '2021_08_24_150350_create_amazing_sales_table', 1),
(34, '2021_08_24_150404_create_common_discount_table', 1),
(35, '2021_08_28_123746_create_provinces_table', 1),
(36, '2021_08_28_123756_create_cities_table', 1),
(37, '2021_08_28_123805_create_addresses_table', 1),
(38, '2021_08_28_123825_create_delivery_table', 1),
(39, '2021_08_29_142632_create_public_sms_table', 1),
(40, '2021_08_29_142639_create_public_mail_table', 1),
(41, '2021_08_29_142649_create_public_mail_files_table', 1),
(42, '2021_09_03_114522_create_offline_payments_table', 1),
(43, '2021_09_03_114531_create_online_payments_table', 1),
(44, '2021_09_03_114544_create_cash_payments_table', 1),
(45, '2021_09_03_114550_create_payments_table', 1),
(46, '2021_09_05_102055_create_cart_items_table', 1),
(47, '2021_09_05_102113_create_cart_item_selected_attributes_table', 1),
(48, '2021_09_06_125842_create_orders_table', 1),
(49, '2021_09_08_132452_create_order_items_table', 1),
(50, '2021_09_08_132505_create_order_item_selected_attributes_table', 1),
(51, '2021_12_15_220744_create_settings_table', 1),
(52, '2022_03_10_194506_create_notifications_table', 1),
(53, '2022_03_12_025919_create_banners_table', 1),
(54, '2022_04_02_111354_create_otps_table', 1),
(55, '2023_01_23_210940_create_permission_tables', 1),
(56, '2023_01_30_160407_create_views_table', 1),
(57, '2023_02_01_212517_create_reviews_table', 1),
(58, '2023_02_01_215309_create_tag_tables', 1),
(59, '2023_02_02_203818_create_activity_log_table', 1),
(60, '2023_02_02_203819_add_event_column_to_activity_log_table', 1),
(61, '2023_02_02_203820_add_batch_uuid_column_to_activity_log_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'Modules\\ACL\\Entities\\Role', 1),
(1, 'Modules\\User\\Entities\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Modules\\User\\Entities\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payments`
--

DROP TABLE IF EXISTS `offline_payments`;
CREATE TABLE IF NOT EXISTS `offline_payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` decimal(20,3) NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pay_date` timestamp NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_payments_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_payments`
--

DROP TABLE IF EXISTS `online_payments`;
CREATE TABLE IF NOT EXISTS `online_payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` decimal(20,3) NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `gateway` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bank_first_response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `bank_second_response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `online_payments_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `address_id` bigint UNSIGNED DEFAULT NULL,
  `address_object` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `payment_id` bigint UNSIGNED DEFAULT NULL,
  `payment_object` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `payment_type` tinyint NOT NULL DEFAULT '0',
  `payment_status` tinyint NOT NULL DEFAULT '0',
  `delivery_id` bigint UNSIGNED DEFAULT NULL,
  `delivery_object` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `delivery_amount` decimal(20,3) DEFAULT NULL,
  `delivery_status` tinyint NOT NULL DEFAULT '0',
  `delivery_date` timestamp NULL DEFAULT NULL,
  `order_final_amount` decimal(20,3) DEFAULT NULL,
  `order_discount_amount` decimal(20,3) DEFAULT NULL,
  `copan_id` bigint UNSIGNED DEFAULT NULL,
  `copan_object` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `order_copan_discount_amount` decimal(20,3) DEFAULT NULL,
  `common_discount_id` bigint UNSIGNED DEFAULT NULL,
  `common_discount_object` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `order_common_discount_amount` decimal(20,3) DEFAULT NULL,
  `order_total_products_discount_amount` decimal(20,3) DEFAULT NULL,
  `order_status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_address_id_foreign` (`address_id`),
  KEY `orders_payment_id_foreign` (`payment_id`),
  KEY `orders_delivery_id_foreign` (`delivery_id`),
  KEY `orders_copan_id_foreign` (`copan_id`),
  KEY `orders_common_discount_id_foreign` (`common_discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `amazing_sale_id` bigint UNSIGNED DEFAULT NULL,
  `amazing_sale_object` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `amazing_sale_discount_amount` decimal(20,3) DEFAULT NULL,
  `number` int NOT NULL DEFAULT '1',
  `final_product_price` decimal(20,3) DEFAULT NULL,
  `final_total_price` decimal(20,3) DEFAULT NULL COMMENT 'number * final_product_price',
  `color_id` bigint UNSIGNED DEFAULT NULL,
  `guarantee_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_amazing_sale_id_foreign` (`amazing_sale_id`),
  KEY `order_items_color_id_foreign` (`color_id`),
  KEY `order_items_guarantee_id_foreign` (`guarantee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item_selected_attributes`
--

DROP TABLE IF EXISTS `order_item_selected_attributes`;
CREATE TABLE IF NOT EXISTS `order_item_selected_attributes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `attribute_value_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_item_selected_attributes_order_item_id_foreign` (`order_item_id`),
  KEY `order_item_selected_attributes_attribute_id_foreign` (`attribute_id`),
  KEY `order_item_selected_attributes_attribute_value_id_foreign` (`attribute_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

DROP TABLE IF EXISTS `otps`;
CREATE TABLE IF NOT EXISTS `otps` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `otp_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'email address or mobile number',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '0 => mobile number , 1 => email',
  `used` tinyint NOT NULL DEFAULT '0' COMMENT '0 => not used , 1 => used',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `otps_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` decimal(20,3) NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '0 => online, 1 => offline, 2 => cash',
  `paymentable_id` bigint UNSIGNED NOT NULL,
  `paymentable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'permission super admin', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(2, 'permission admin panel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(3, 'permission market', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(4, 'permission vitrine', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(5, 'permission product categories', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(6, 'permission product category create', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(7, 'permission product category edit', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(8, 'permission product category delete', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(9, 'permission product category status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(10, 'permission product properties', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(11, 'permission product property create', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(12, 'permission product property edit', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(13, 'permission product property delete', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(14, 'permission product property status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(15, 'permission product property values', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(16, 'permission product property value create', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(17, 'permission product property value edit', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(18, 'permission product property value delete', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(19, 'permission product property value status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(20, 'permission product brands', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(21, 'permission product brand create', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(22, 'permission product brand edit', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(23, 'permission product brand delete', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(24, 'permission product brand status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(25, 'permission products', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(26, 'permission product create', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(27, 'permission product edit', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(28, 'permission product delete', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(29, 'permission product status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(30, 'permission product gallery', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(31, 'permission product gallery create', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(32, 'permission product gallery delete', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(33, 'permission product guarantees', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(34, 'permission product guarantee create', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(35, 'permission product guarantee delete', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(36, 'permission product colors', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(37, 'permission product color create', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(38, 'permission product color delete', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(39, 'permission product warehouse', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(40, 'permission product warehouse add', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(41, 'permission product warehouse modify', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(42, 'permission product comments', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(43, 'permission product comment show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(44, 'permission product comment status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(45, 'permission product comment approve', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(46, 'permission product orders', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(47, 'permission product new orders', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(48, 'permission product new order show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(49, 'permission product new order detail', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(50, 'permission product new order print', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(51, 'permission product new order cancel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(52, 'permission product new order status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(53, 'permission product new order send status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(54, 'permission product sending orders', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(55, 'permission product sending order show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(56, 'permission product sending order detail', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(57, 'permission product sending order print', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(58, 'permission product sending order cancel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(59, 'permission product sending order status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(60, 'permission product sending order send status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(61, 'permission product unpaid orders', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(62, 'permission product unpaid order show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(63, 'permission product unpaid order detail', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(64, 'permission product unpaid order print', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(65, 'permission product unpaid order cancel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(66, 'permission product unpaid order status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(67, 'permission product unpaid order send status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(68, 'permission product canceled orders', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(69, 'permission product canceled order show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(70, 'permission product canceled order detail', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(71, 'permission product canceled order print', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(72, 'permission product canceled order cancel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(73, 'permission product canceled order status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(74, 'permission product canceled order send status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(75, 'permission product returned orders', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(76, 'permission product returned order show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(77, 'permission product returned order detail', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(78, 'permission product returned order print', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(79, 'permission product returned order cancel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(80, 'permission product returned order status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(81, 'permission product returned order send status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(82, 'permission product all orders', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(83, 'permission product order show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(84, 'permission product order detail', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(85, 'permission product order print', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(86, 'permission product order cancel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(87, 'permission product order status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(88, 'permission product order send status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(89, 'permission product payments', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(90, 'permission product all payments', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(91, 'permission product payment show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(92, 'permission product payment cancel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(93, 'permission product payment return', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(94, 'permission product online payments', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(95, 'permission product online payment show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(96, 'permission product online payment cancel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(97, 'permission product online payment return', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(98, 'permission product offline payments', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(99, 'permission product offline payment show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(100, 'permission product offline payment cancel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(101, 'permission product offline payment return', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(102, 'permission product cash payments', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(103, 'permission product cash payment show', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(104, 'permission product cash payment cancel', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(105, 'permission product cash payment return', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(106, 'permission product discounts', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(107, 'permission product coupon discounts', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(108, 'permission product coupon discount create', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(109, 'permission product coupon discount edit', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(110, 'permission product coupon discount delete', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(111, 'permission product coupon discount status', 'web', NULL, 1, '2023-02-07 11:17:38', '2023-02-07 11:17:38', NULL),
(112, 'permission product common discounts', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(113, 'permission product common discount create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(114, 'permission product common discount edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(115, 'permission product common discount delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(116, 'permission product common discount status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(117, 'permission product amazing sales', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(118, 'permission product amazing sale create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(119, 'permission product amazing sale edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(120, 'permission product amazing sale delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(121, 'permission product amazing sale status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(122, 'permission delivery methods', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(123, 'permission delivery method create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(124, 'permission delivery method edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(125, 'permission delivery method delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(126, 'permission delivery method status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(127, 'permission content', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(128, 'permission post categories', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(129, 'permission post category create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(130, 'permission post category edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(131, 'permission post category delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(132, 'permission post category status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(133, 'permission post', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(134, 'permission post create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(135, 'permission post edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(136, 'permission post delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(137, 'permission post status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(138, 'permission authors', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(139, 'permission post comments', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(140, 'permission post comment status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(141, 'permission post comment show', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(142, 'permission post comment approve', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(143, 'permission faqs', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(144, 'permission faq create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(145, 'permission faq edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(146, 'permission faq delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(147, 'permission faq status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(148, 'permission pages', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(149, 'permission page create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(150, 'permission page edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(151, 'permission page delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(152, 'permission page status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(153, 'permission menus', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(154, 'permission menu create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(155, 'permission menu edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(156, 'permission menu delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(157, 'permission menu status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(158, 'permission banners', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(159, 'permission banner create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(160, 'permission banner edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(161, 'permission banner delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(162, 'permission banner status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(163, 'permission post set tags', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(164, 'permission post update tags', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(165, 'permission tags', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(166, 'permission tag create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(167, 'permission tag edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(168, 'permission tag delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(169, 'permission tag status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(170, 'permission users', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(171, 'permission admin users', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(172, 'permission admin user create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(173, 'permission admin user edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(174, 'permission admin user delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(175, 'permission admin user status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(176, 'permission admin user roles', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(177, 'permission admin user activation', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(178, 'permission customer users', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(179, 'permission customer user create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(180, 'permission customer user edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(181, 'permission customer user delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(182, 'permission customer user status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(183, 'permission customer user activation', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(184, 'permission customer user roles', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(185, 'permission user roles', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(186, 'permission user role create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(187, 'permission user role edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(188, 'permission user role delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(189, 'permission user role status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(190, 'permission user role permissions', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(191, 'permission user permissions import', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(192, 'permission user permissions export', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(193, 'permission tickets', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(194, 'permission ticket categories', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(195, 'permission ticket category create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(196, 'permission ticket category edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(197, 'permission ticket category delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(198, 'permission ticket category status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(199, 'permission ticket priorities', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(200, 'permission ticket priority create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(201, 'permission ticket priority edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(202, 'permission ticket priority delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(203, 'permission ticket priority status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(204, 'permission admin tickets', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(205, 'permission admin ticket add', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(206, 'permission new tickets', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(207, 'permission new ticket show', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(208, 'permission new ticket change', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(209, 'permission open tickets', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(210, 'permission open ticket show', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(211, 'permission open ticket change', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(212, 'permission close tickets', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(213, 'permission close ticket show', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(214, 'permission close ticket change', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(215, 'permission all tickets', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(216, 'permission ticket show', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(217, 'permission ticket change', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(218, 'permission notify', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(219, 'permission email notify', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(220, 'permission email notify create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(221, 'permission email notify edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(222, 'permission email notify delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(223, 'permission email notify status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(224, 'permission email notify files', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(225, 'permission email notify file create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(226, 'permission email notify file edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(227, 'permission email notify file delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(228, 'permission email notify file status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(229, 'permission sms notify', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(230, 'permission sms notify create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(231, 'permission sms notify edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(232, 'permission sms notify delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(233, 'permission sms notify status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(234, 'permission setting', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(235, 'permission setting edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(236, 'permission office', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(237, 'permission service categories', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(238, 'permission service category create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(239, 'permission service category edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(240, 'permission service category delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(241, 'permission service category status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(242, 'permission service', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(243, 'permission service create', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(244, 'permission service edit', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(245, 'permission service delete', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(246, 'permission service status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(247, 'permission service comments', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(248, 'permission service comment status', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(249, 'permission service comment show', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(250, 'permission service comment approve', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `popular` tinyint NOT NULL DEFAULT '0',
  `selected` tinyint NOT NULL DEFAULT '0',
  `commentable` tinyint NOT NULL DEFAULT '0' COMMENT '0 => uncommentable, 1 => commentable',
  `published_at` timestamp NOT NULL,
  `author_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `time_to_read` tinyint NOT NULL DEFAULT '0',
  `view_count` int NOT NULL DEFAULT '0',
  `comment_count` int NOT NULL DEFAULT '0',
  `like_count` int NOT NULL DEFAULT '0',
  `rating` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_author_id_foreign` (`author_id`),
  KEY `posts_category_id_foreign` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
CREATE TABLE IF NOT EXISTS `post_categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code_kala` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `length` decimal(10,1) NOT NULL COMMENT 'cm unit',
  `width` decimal(10,1) NOT NULL COMMENT 'cm unit',
  `height` decimal(10,1) NOT NULL COMMENT 'cm unit',
  `price` decimal(20,3) NOT NULL,
  `active_discount_percentage` tinyint DEFAULT NULL,
  `rating` double(8,2) NOT NULL DEFAULT '0.00',
  `popular` tinyint NOT NULL DEFAULT '0',
  `selected` tinyint NOT NULL DEFAULT '0',
  `marketable` tinyint NOT NULL DEFAULT '0' COMMENT '1 => marketable, 0 => is not marketable',
  `sold_number` smallint NOT NULL DEFAULT '0',
  `frozen_number` smallint NOT NULL DEFAULT '0',
  `marketable_number` smallint NOT NULL DEFAULT '0',
  `views_count` int NOT NULL DEFAULT '0',
  `comments_count` int NOT NULL DEFAULT '0',
  `likes_count` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `brand_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `published_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_code_kala_unique` (`code_kala`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code_kala`, `name`, `introduction`, `slug`, `image`, `weight`, `length`, `width`, `height`, `price`, `active_discount_percentage`, `rating`, `popular`, `selected`, `marketable`, `sold_number`, `frozen_number`, `marketable_number`, `views_count`, `comments_count`, `likes_count`, `status`, `brand_id`, `category_id`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'پوکو ایکس ۳', '<p>پوکو ایکس ۳پوکو ایکس ۳پوکو ایکس ۳پوکو ایکس ۳پوکو ایکس ۳</p>\r\n\r\n<p>پوکو ایکس ۳پوکو ایکس ۳پوکو ایکس ۳پوکو ایکس ۳</p>\r\n\r\n<p>پوکو ایکس ۳پوکو ایکس ۳پوکو ایکس ۳پوکو ایکس ۳</p>', 'پوکو-ایکس-۳', '{\"indexArray\":{\"large\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675780598\\\\1675780598_large.jpg\",\"medium\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675780598\\\\1675780598_medium.jpg\",\"small\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675780598\\\\1675780598_small.jpg\"},\"directory\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675780598\",\"currentImage\":\"medium\"}', '111.00', '100.0', '777.0', '777.0', '5700000.000', 3, 0.00, 0, 0, 1, 0, 0, 29, 0, 0, 0, 1, 6, 4, '2023-02-07 14:35:13', '2023-02-07 14:36:38', '2023-02-07 19:17:50', NULL),
(2, NULL, 'شیائومی ۲', '<p>شیائومی ۲شیائومی ۲شیائومی ۲شیائومی ۲شیائومی ۲شیائومی ۲</p>', 'شیائومی-۲', '{\"indexArray\":{\"large\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675784983\\\\1675784983_large.jpg\",\"medium\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675784983\\\\1675784983_medium.jpg\",\"small\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675784983\\\\1675784983_small.jpg\"},\"directory\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675784983\",\"currentImage\":\"medium\"}', '111.00', '222.0', '777.0', '777.0', '3500000.000', 3, 0.00, 0, 0, 1, 0, 0, 9, 0, 0, 0, 1, 6, 4, '2023-02-07 15:48:07', '2023-02-07 15:49:43', '2023-02-07 19:17:50', NULL),
(3, NULL, 'شیائومی ۳', '<p>شیائومی ۳شیائومی ۳شیائومی ۳شیائومی ۳شیائومی ۳شیائومی ۳شیائومی ۳</p>', 'شیائومی-۳', '{\"indexArray\":{\"large\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785111\\\\1675785111_large.jpg\",\"medium\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785111\\\\1675785111_medium.jpg\",\"small\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785111\\\\1675785111_small.jpg\"},\"directory\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785111\",\"currentImage\":\"medium\"}', '111.00', '222.0', '777.0', '777.0', '5700000.000', 9, 0.00, 0, 0, 1, 0, 0, 16, 0, 0, 0, 1, 6, 4, '2023-02-07 15:49:55', '2023-02-07 15:51:52', '2023-02-07 19:17:50', NULL),
(4, NULL, 'ایفون 12', '<p>ایفون 12ایفون 12ایفون 12ایفون 12ایفون 12ایفون 12</p>', 'ایفون-12', '{\"indexArray\":{\"large\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785334\\\\1675785334_large.jpg\",\"medium\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785334\\\\1675785334_medium.jpg\",\"small\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785334\\\\1675785334_small.jpg\"},\"directory\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785334\",\"currentImage\":\"medium\"}', '111.00', '222.0', '777.0', '777.0', '25500000.000', 11, 0.00, 0, 1, 1, 0, 1, 5, 1, 0, 0, 1, 2, 2, '2023-02-07 15:52:03', '2023-02-07 15:55:34', '2023-02-07 19:23:08', NULL),
(5, NULL, 'سامسونگ ۱', '<p>سامسونگ ۱سامسونگ ۱سامسونگ ۱سامسونگ ۱سامسونگ ۱سامسونگ ۱سامسونگ ۱</p>', 'سامسونگ-۱', '{\"indexArray\":{\"large\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785418\\\\1675785418_large.jpg\",\"medium\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785418\\\\1675785418_medium.jpg\",\"small\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785418\\\\1675785418_small.jpg\"},\"directory\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785418\",\"currentImage\":\"medium\"}', '111.00', '222.0', '777.0', '777.0', '5700000.000', 1, 0.00, 0, 1, 1, 0, 0, 14, 0, 0, 0, 1, 1, 3, '2023-02-07 15:55:48', '2023-02-07 15:56:58', '2023-02-07 19:17:49', NULL),
(6, NULL, 'سامسونگ ۱۲', '<p>سامسونگ ۱۲سامسونگ ۱۲سامسونگ ۱۲سامسونگ ۱۲سامسونگ ۱۲سامسونگ ۱۲سامسونگ ۱۲سامسونگ ۱۲سامسونگ ۱۲</p>', 'سامسونگ-۱۲', '{\"indexArray\":{\"large\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785496\\\\1675785496_large.jpg\",\"medium\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785496\\\\1675785496_medium.jpg\",\"small\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785496\\\\1675785496_small.jpg\"},\"directory\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785496\",\"currentImage\":\"medium\"}', '111.00', '222.0', '777.0', '777.0', '3500000.000', NULL, 0.00, 0, 1, 1, 0, 0, 25, 0, 0, 0, 1, 1, 3, '2023-02-07 15:57:38', '2023-02-07 15:58:16', '2023-02-07 17:54:43', NULL),
(7, NULL, 'سامسونگ ۱۱', '<p>سامسونگ ۱۱سامسونگ ۱۱سامسونگ ۱۱سامسونگ ۱۱سامسونگ ۱۱سامسونگ ۱۱سامسونگ ۱۱سامسونگ ۱۱</p>', 'سامسونگ-۱۱', '{\"indexArray\":{\"large\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785617\\\\1675785617_large.jpg\",\"medium\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785617\\\\1675785617_medium.jpg\",\"small\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785617\\\\1675785617_small.jpg\"},\"directory\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785617\",\"currentImage\":\"medium\"}', '111.00', '222.0', '777.0', '777.0', '25500000.000', NULL, 0.00, 0, 1, 1, 0, 0, 40, 0, 0, 0, 1, 1, 3, '2023-02-07 15:59:23', '2023-02-07 16:00:17', '2023-02-07 17:54:31', NULL),
(8, NULL, 'شیائومی ۳4', '<p>شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4شیائومی ۳4</p>', 'شیائومی-۳4', '{\"indexArray\":{\"large\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785806\\\\1675785806_large.jpg\",\"medium\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785806\\\\1675785806_medium.jpg\",\"small\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785806\\\\1675785806_small.jpg\"},\"directory\":\"images\\\\product\\\\2023\\\\02\\\\07\\\\1675785806\",\"currentImage\":\"medium\"}', '111.00', '222.0', '777.0', '777.0', '3500000.000', NULL, 0.00, 0, 1, 1, 0, 0, 10, 0, 0, 0, 1, 6, 3, '2023-02-07 16:00:31', '2023-02-07 16:03:26', '2023-02-07 17:54:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `show_in_menu` tinyint NOT NULL DEFAULT '0',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_categories_slug_unique` (`slug`),
  KEY `product_categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `description`, `slug`, `image`, `status`, `show_in_menu`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'گوشی های هوشمند', '<p>گوشی های هوشمندگوشی های هوشمندگوشی های هوشمندگوشی های هوشمندگوشی های هوشمند</p>', 'گوشی-های-هوشمند', '{\"indexArray\":{\"large\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779627\\\\1675779627_large.jpg\",\"medium\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779627\\\\1675779627_medium.jpg\",\"small\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779627\\\\1675779627_small.jpg\"},\"directory\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779627\",\"currentImage\":\"medium\"}', 1, 1, NULL, '2023-02-07 14:20:28', '2023-02-07 14:20:28', NULL),
(2, 'گوشی های اپل', '<p>گوشی های اپلگوشی های اپلگوشی های اپلگوشی های اپلگوشی های اپلگوشی های اپلگوشی های اپلگوشی های اپل</p>', 'گوشی-های-اپل', '{\"indexArray\":{\"large\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779709\\\\1675779709_large.jpg\",\"medium\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779709\\\\1675779709_medium.jpg\",\"small\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779709\\\\1675779709_small.jpg\"},\"directory\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779709\",\"currentImage\":\"medium\"}', 1, 1, 1, '2023-02-07 14:21:49', '2023-02-07 14:21:49', NULL),
(3, 'گوشی های سامسونگ', '<p>گوشی های سامسونگگوشی های سامسونگگوشی های سامسونگگوشی های سامسونگگوشی های سامسونگگوشی های سامسونگگوشی های سامسونگ</p>', 'گوشی-های-سامسونگ', '{\"indexArray\":{\"large\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779754\\\\1675779754_large.jpg\",\"medium\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779754\\\\1675779754_medium.jpg\",\"small\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779754\\\\1675779754_small.jpg\"},\"directory\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675779754\",\"currentImage\":\"medium\"}', 1, 1, 1, '2023-02-07 14:22:34', '2023-02-07 14:22:34', NULL),
(4, 'گوشی های شیائومی', '<p>گوشی های شیائومیگوشی های شیائومیگوشی های شیائومیگوشی های شیائومیگوشی های شیائومیگوشی های شیائومیگوشی های شیائومی</p>', 'گوشی-های-شیائومی', '{\"indexArray\":{\"large\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675780334\\\\1675780334_large.png\",\"medium\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675780334\\\\1675780334_medium.png\",\"small\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675780334\\\\1675780334_small.png\"},\"directory\":\"images\\\\product-category\\\\2023\\\\02\\\\07\\\\1675780334\",\"currentImage\":\"medium\"}', 1, 1, 1, '2023-02-07 14:32:14', '2023-02-07 14:32:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
CREATE TABLE IF NOT EXISTS `product_colors` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `color_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `price_increase` decimal(20,3) NOT NULL DEFAULT '0.000',
  `status` tinyint NOT NULL DEFAULT '0',
  `sold_number` smallint NOT NULL DEFAULT '0',
  `frozen_number` smallint NOT NULL DEFAULT '0',
  `marketable_number` smallint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_colors_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `color_name`, `color`, `product_id`, `price_increase`, `status`, `sold_number`, `frozen_number`, `marketable_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'سفید', '#ffffff', 8, '500000.000', 1, 0, 0, 20, '2023-02-07 16:10:33', '2023-02-07 16:10:33', NULL),
(2, 'بنفش', '#7d3fd9', 8, '500000.000', 1, 0, 0, 10, '2023-02-07 16:11:00', '2023-02-07 16:11:00', NULL),
(3, 'سفید', '#ffffff', 7, '500000.000', 1, 0, 0, 20, '2023-02-07 16:10:33', '2023-02-07 16:10:33', NULL),
(4, 'بنفش', '#7d3fd9', 7, '500000.000', 1, 0, 0, 10, '2023-02-07 16:11:00', '2023-02-07 16:11:00', NULL),
(5, 'سفید', '#ffffff', 6, '500000.000', 1, 0, 0, 20, '2023-02-07 16:10:33', '2023-02-07 16:10:33', NULL),
(6, 'بنفش', '#7d3fd9', 6, '500000.000', 1, 0, 0, 10, '2023-02-07 16:11:00', '2023-02-07 16:11:00', NULL),
(7, 'سفید', '#ffffff', 5, '500000.000', 1, 0, 0, 20, '2023-02-07 16:10:33', '2023-02-07 16:10:33', NULL),
(8, 'بنفش', '#7d3fd9', 5, '500000.000', 1, 0, 0, 10, '2023-02-07 16:11:00', '2023-02-07 16:11:00', NULL),
(9, 'سفید', '#ffffff', 1, '500000.000', 1, 0, 0, 20, '2023-02-07 16:10:33', '2023-02-07 16:10:33', NULL),
(10, 'بنفش', '#7d3fd9', 1, '500000.000', 1, 0, 0, 10, '2023-02-07 16:11:00', '2023-02-07 16:11:00', NULL),
(11, 'سفید', '#ffffff', 2, '500000.000', 1, 0, 0, 20, '2023-02-07 16:10:33', '2023-02-07 16:10:33', NULL),
(12, 'بنفش', '#7d3fd9', 2, '500000.000', 1, 0, 0, 10, '2023-02-07 16:11:00', '2023-02-07 16:11:00', NULL),
(13, 'سفید', '#ffffff', 3, '500000.000', 1, 0, 0, 20, '2023-02-07 16:10:33', '2023-02-07 16:10:33', NULL),
(14, 'بنفش', '#7d3fd9', 3, '500000.000', 1, 0, 0, 10, '2023-02-07 16:11:00', '2023-02-07 16:11:00', NULL),
(15, 'سفید', '#ffffff', 4, '500000.000', 1, 0, 0, 20, '2023-02-07 16:10:33', '2023-02-07 16:10:33', NULL),
(16, 'بنفش', '#7d3fd9', 4, '500000.000', 1, 0, 0, 10, '2023-02-07 16:11:00', '2023-02-07 16:11:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786167\\\\1675786167_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786167\\\\1675786167_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786167\\\\1675786167_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786167\",\"currentImage\":\"medium\"}', 8, '2023-02-07 16:09:27', '2023-02-07 16:09:27', NULL),
(2, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786195\\\\1675786195_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786195\\\\1675786195_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786195\\\\1675786195_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786195\",\"currentImage\":\"medium\"}', 8, '2023-02-07 16:09:55', '2023-02-07 16:09:55', NULL),
(3, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786986\\\\1675786986_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786986\\\\1675786986_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786986\\\\1675786986_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675786986\",\"currentImage\":\"medium\"}', 7, '2023-02-07 16:23:06', '2023-02-07 16:23:06', NULL),
(4, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787039\\\\1675787039_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787039\\\\1675787039_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787039\\\\1675787039_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787039\",\"currentImage\":\"medium\"}', 7, '2023-02-07 16:23:59', '2023-02-07 16:23:59', NULL),
(5, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787159\\\\1675787159_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787159\\\\1675787159_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787159\\\\1675787159_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787159\",\"currentImage\":\"medium\"}', 6, '2023-02-07 16:26:00', '2023-02-07 16:26:00', NULL),
(6, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787178\\\\1675787178_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787178\\\\1675787178_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787178\\\\1675787178_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787178\",\"currentImage\":\"medium\"}', 6, '2023-02-07 16:26:18', '2023-02-07 16:26:18', NULL),
(7, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787216\\\\1675787216_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787216\\\\1675787216_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787216\\\\1675787216_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787216\",\"currentImage\":\"medium\"}', 5, '2023-02-07 16:26:56', '2023-02-07 16:26:56', NULL),
(8, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787234\\\\1675787234_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787234\\\\1675787234_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787234\\\\1675787234_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787234\",\"currentImage\":\"medium\"}', 5, '2023-02-07 16:27:15', '2023-02-07 16:27:15', NULL),
(9, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787279\\\\1675787279_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787279\\\\1675787279_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787279\\\\1675787279_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787279\",\"currentImage\":\"medium\"}', 4, '2023-02-07 16:27:59', '2023-02-07 16:27:59', NULL),
(10, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787297\\\\1675787297_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787297\\\\1675787297_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787297\\\\1675787297_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787297\",\"currentImage\":\"medium\"}', 4, '2023-02-07 16:28:17', '2023-02-07 16:28:17', NULL),
(11, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787332\\\\1675787332_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787332\\\\1675787332_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787332\\\\1675787332_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787332\",\"currentImage\":\"medium\"}', 3, '2023-02-07 16:28:52', '2023-02-07 16:28:52', NULL),
(12, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787355\\\\1675787355_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787355\\\\1675787355_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787355\\\\1675787355_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787355\",\"currentImage\":\"medium\"}', 3, '2023-02-07 16:29:15', '2023-02-07 16:29:15', NULL),
(13, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787380\\\\1675787380_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787380\\\\1675787380_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787380\\\\1675787380_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787380\",\"currentImage\":\"medium\"}', 2, '2023-02-07 16:29:40', '2023-02-07 16:29:40', NULL),
(14, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787402\\\\1675787402_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787402\\\\1675787402_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787402\\\\1675787402_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787402\",\"currentImage\":\"medium\"}', 2, '2023-02-07 16:30:02', '2023-02-07 16:30:02', NULL),
(15, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787433\\\\1675787433_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787433\\\\1675787433_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787433\\\\1675787433_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787433\",\"currentImage\":\"medium\"}', 1, '2023-02-07 16:30:33', '2023-02-07 16:30:33', NULL),
(16, '{\"indexArray\":{\"large\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787550\\\\1675787550_large.jpg\",\"medium\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787550\\\\1675787550_medium.jpg\",\"small\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787550\\\\1675787550_small.jpg\"},\"directory\":\"images\\\\product-gallery\\\\2023\\\\02\\\\07\\\\1675787550\",\"currentImage\":\"medium\"}', 1, '2023-02-07 16:32:30', '2023-02-07 16:32:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_meta`
--

DROP TABLE IF EXISTS `product_meta`;
CREATE TABLE IF NOT EXISTS `product_meta` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_meta_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_meta`
--

INSERT INTO `product_meta` (`id`, `meta_key`, `meta_value`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ضداب', 'هست', 1, '2023-02-07 14:36:39', '2023-02-07 14:36:39', NULL),
(2, 'گواهی', 'دارد', 1, '2023-02-07 14:36:39', '2023-02-07 14:36:39', NULL),
(3, 'ضداب', 'هست', 2, '2023-02-07 15:49:43', '2023-02-07 15:49:43', NULL),
(4, 'ضداب', 'هست', 3, '2023-02-07 15:51:52', '2023-02-07 15:51:52', NULL),
(5, 'ضداب', 'هست', 4, '2023-02-07 15:55:34', '2023-02-07 15:55:34', NULL),
(6, 'ضداب', 'هست', 5, '2023-02-07 15:56:58', '2023-02-07 15:56:58', NULL),
(7, 'ضداب', 'هست', 6, '2023-02-07 15:58:16', '2023-02-07 15:58:16', NULL),
(8, 'ضداب', 'هست', 7, '2023-02-07 16:00:17', '2023-02-07 16:00:17', NULL),
(9, 'ضداب', 'هست', 8, '2023-02-07 16:03:26', '2023-02-07 16:03:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
CREATE TABLE IF NOT EXISTS `provinces` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provinces_country_id_foreign` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `country_id`, `name`, `name_en`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'آذربایجان شرقی', 'East Azerbaijan', '37.90357330', '46.26821090', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(2, 1, 'آذربایجان غربی', 'West Azerbaijan', '37.45500620', '45.00000000', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(3, 1, 'اردبیل', 'Ardabil', '38.48532760', '47.89112090', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(4, 1, 'اصفهان', 'Isfahan', '32.65462750', '51.66798260', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(5, 1, 'البرز', 'Alborz', '35.99604670', '50.92892460', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(6, 1, 'ایلام', 'Ilam', '33.29576180', '46.67053400', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(7, 1, 'بوشهر', 'Bushehr', '28.92338370', '50.82031400', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(8, 1, 'تهران', 'Tehran', '35.69611100', '51.42305600', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(9, 1, 'چهارمحال و بختیاری', 'Chaharmahal and Bakhtiari ', '31.96143480', '50.84563230', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(10, 1, 'خراسان جنوبی', 'South Khorasan', '32.51756430', '59.10417580', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(11, 1, 'خراسان رضوی', 'Razavi Khorasan', '35.10202530', '59.10417580', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(12, 1, 'خراسان شمالی', 'North Khorasan', '37.47103530', '57.10131880', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(13, 1, 'خوزستان', 'Khuzestan', '31.43601490', '49.04131200', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(14, 1, 'زنجان', 'Zanjan', '36.50181850', '48.39881860', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(15, 1, 'سمنان', 'Semnan', '35.22555850', '54.43421380', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(16, 1, 'سیستان و بلوچستان', 'Sistan and Baluchestan ', '27.52999060', '60.58206760', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(17, 1, 'فارس', 'Fars', '29.10438130', '53.04589300', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(18, 1, 'قزوین', 'Qazvin', '36.08813170', '49.85472660', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(19, 1, 'قم', 'Qom', '34.63994430', '50.87594190', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(20, 1, 'كردستان', 'Kurdistan', '35.95535790', '47.13621250', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(21, 1, 'كرمان', 'Kerman', '30.28393790', '57.08336280', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(22, 1, 'كرمانشاه', 'Kermanshah', '34.31416700', '47.06500000', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(23, 1, 'کهگیلویه و بویراحمد', 'Kohgiluyeh and Boyer-Ahmad ', '30.65094790', '51.60525000', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(24, 1, 'گلستان', 'Golestan', '37.28981230', '55.13758340', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(25, 1, 'گیلان', 'Gilan', '37.11716170', '49.52799960', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(26, 1, 'لرستان', 'Lorestan', '33.58183940', '48.39881860', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(27, 1, 'مازندران', 'Mazandaran', '36.22623930', '52.53186040', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(28, 1, 'مركزی', 'Markazi', '33.50932940', '-92.39611900', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(29, 1, 'هرمزگان', 'Hormozgan', '27.13872300', '55.13758340', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(30, 1, 'همدان', 'Hamadan', '34.76079990', '48.39881860', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL),
(31, 1, 'یزد', 'Yazd', '32.10063870', '54.43421380', '2023-02-07 13:34:12', '2023-02-07 13:34:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `public_mail`
--

DROP TABLE IF EXISTS `public_mail`;
CREATE TABLE IF NOT EXISTS `public_mail` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `published_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `public_mail_files`
--

DROP TABLE IF EXISTS `public_mail_files`;
CREATE TABLE IF NOT EXISTS `public_mail_files` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `public_mail_id` bigint UNSIGNED NOT NULL,
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_size` bigint NOT NULL,
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `public_mail_files_public_mail_id_foreign` (`public_mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `public_sms`
--

DROP TABLE IF EXISTS `public_sms`;
CREATE TABLE IF NOT EXISTS `public_sms` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `published_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `reviewable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reviewable_id` bigint UNSIGNED NOT NULL,
  `rate` enum('1','2','3','4','5') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'role super admin', 'web', NULL, 1, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9IOPtl9blfz7mxhW3Gf5DhsEkvDXxiK9a59rODOS', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTo1OntzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NjoiX3Rva2VuIjtzOjQwOiJMN3lWbnBiV0dON01STEs1ZjlXZ2RlaFVCREtlZ0w0OENFWFNqR0JYIjtzOjU6ImFsZXJ0IjthOjA6e31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoxNzoiaHR0cDovL3Nob3BiaXouaXIiO319', 1675788227),
('Pu6BqyBWx5S8jCy6CCVmuWqlf4jmiNesiCSJYO2L', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTo1OntzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NjoiX3Rva2VuIjtzOjQwOiJnZ0NGZGZoUnpxbjV6cTZpTEp6TTNVejVWY052NGptbHc3VXI1VDF2IjtzOjU6ImFsZXJ0IjthOjA6e31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMjoiaHR0cDovL3Nob3BiaXouaXIvY2FydCI7fX0=', 1675797792);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `low_count_products` smallint NOT NULL DEFAULT '0' COMMENT 'count of products which have low marketable number',
  `rating_score` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'calculate avg rating of all items',
  `author` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `mobile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `postal_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `social_media` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `bank_account` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `description`, `keywords`, `logo`, `icon`, `low_count_products`, `rating_score`, `author`, `address`, `mobile`, `email`, `postal_code`, `social_media`, `bank_account`, `created_at`, `updated_at`) VALUES
(1, 'شاپ بیز', 'شاپ بیز', 'شاپ بیز', '\"images\\\\setting\\\\2023\\\\01\\\\21\\\\logo.png\"', '\"images\\\\setting\\\\2023\\\\01\\\\21\\\\icon.png\"', 0, 0.00, 'فروشگاه شاپ بیز ارومیه', '{\"addresses\":{\"central_office\":\"<p>\\u0627\\u0631\\u0648\\u0645\\u06cc\\u0647 \\u0641\\u0644\\u06a9\\u0647 \\u0631\\u0648\\u062f\\u06a9\\u06cc<\\/p>\"},\"postal_code\":null}', '{\"office_telephone\":\"\\u0634\\u0645\\u0627\\u0631\\u0647 \\u062a\\u0645\\u0627\\u0633 \\u067e\\u06cc\\u062f\\u0627 \\u0646\\u0634\\u062f\",\"mobile\":\"\\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644 \\u067e\\u06cc\\u062f\\u0627 \\u0646\\u0634\\u062f\"}', '{\"office_mail\":\"\\u0627\\u06cc\\u0645\\u06cc\\u0644 \\u067e\\u06cc\\u062f\\u0627 \\u0646\\u0634\\u062f\"}', NULL, '{\"instagram\":\"\\u0627\\u06cc\\u0646\\u0633\\u062a\\u0627 \\u067e\\u06cc\\u062f\\u0627 \\u0646\\u0634\\u062f\",\"telegram\":\"\\u062a\\u0644\\u06af\\u0631\\u0627\\u0645 \\u067e\\u06cc\\u062f\\u0627 \\u0646\\u0634\\u062f\",\"youtube\":\"\\u06cc\\u0648\\u062a\\u06cc\\u0648\\u0628 \\u067e\\u06cc\\u062f\\u0627 \\u0646\\u0634\\u062f\",\"whatsapp\":\"\\u0648\\u0627\\u062a\\u0633 \\u0627\\u067e \\u067e\\u06cc\\u062f\\u0627 \\u0646\\u0634\\u062f\"}', '{\"primary\":\"<p>\\u0627\\u0637\\u0644\\u0627\\u0639\\u0627\\u062a \\u0628\\u0627\\u0646\\u06a9\\u06cc \\u067e\\u06cc\\u062f\\u0627 \\u0646\\u0634\\u062f<\\/p>\"}', NULL, '2023-02-07 19:17:49');

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

DROP TABLE IF EXISTS `taggables`;
CREATE TABLE IF NOT EXISTS `taggables` (
  `tag_id` bigint UNSIGNED NOT NULL,
  `taggable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `taggable_id` bigint UNSIGNED NOT NULL,
  UNIQUE KEY `taggables_tag_id_taggable_id_taggable_type_unique` (`tag_id`,`taggable_id`,`taggable_type`),
  KEY `taggables_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taggables`
--

INSERT INTO `taggables` (`tag_id`, `taggable_type`, `taggable_id`) VALUES
(3, 'Modules\\Product\\Entities\\Product', 1),
(4, 'Modules\\Product\\Entities\\Product', 1),
(3, 'Modules\\Product\\Entities\\Product', 2),
(4, 'Modules\\Product\\Entities\\Product', 2),
(3, 'Modules\\Product\\Entities\\Product', 3),
(4, 'Modules\\Product\\Entities\\Product', 3),
(1, 'Modules\\Product\\Entities\\Product', 4),
(6, 'Modules\\Product\\Entities\\Product', 4),
(2, 'Modules\\Product\\Entities\\Product', 5),
(5, 'Modules\\Product\\Entities\\Product', 5),
(2, 'Modules\\Product\\Entities\\Product', 6),
(5, 'Modules\\Product\\Entities\\Product', 6),
(2, 'Modules\\Product\\Entities\\Product', 7),
(5, 'Modules\\Product\\Entities\\Product', 7),
(3, 'Modules\\Product\\Entities\\Product', 8),
(4, 'Modules\\Product\\Entities\\Product', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` json NOT NULL,
  `slug` json NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_column` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `type`, `order_column`, `status`, `created_at`, `updated_at`) VALUES
(1, '{\"fa\": \"آیفون\"}', '{\"fa\": \"آیفون\"}', 'پردازنده', 1, 1, '2023-02-07 16:06:48', '2023-02-07 16:06:48'),
(2, '{\"fa\": \"سامسونگ\"}', '{\"fa\": \"سامسونگ\"}', 'پردازنده', 2, 1, '2023-02-07 16:07:42', '2023-02-07 16:07:42'),
(3, '{\"fa\": \"شیائومی\"}', '{\"fa\": \"شیائومی\"}', 'پردازنده', 3, 1, '2023-02-07 16:08:12', '2023-02-07 16:08:12'),
(4, '{\"fa\": \"xiaomi\"}', '{\"fa\": \"xiaomi\"}', 'پردازنده', 4, 1, '2023-02-07 16:17:37', '2023-02-07 16:17:37'),
(5, '{\"fa\": \"samsung\"}', '{\"fa\": \"samsung\"}', 'پردازنده', 5, 1, '2023-02-07 16:18:00', '2023-02-07 16:18:00'),
(6, '{\"fa\": \"apple\"}', '{\"fa\": \"apple\"}', 'پردازنده', 6, 1, '2023-02-07 16:18:17', '2023-02-07 16:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `seen` tinyint NOT NULL DEFAULT '0' COMMENT '0 => unseen, 1 => seen',
  `reference_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `priority_id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_reference_id_foreign` (`reference_id`),
  KEY `tickets_user_id_foreign` (`user_id`),
  KEY `tickets_category_id_foreign` (`category_id`),
  KEY `tickets_priority_id_foreign` (`priority_id`),
  KEY `tickets_ticket_id_foreign` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_admins`
--

DROP TABLE IF EXISTS `ticket_admins`;
CREATE TABLE IF NOT EXISTS `ticket_admins` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_admins_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_admins`
--

INSERT INTO `ticket_admins` (`id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 1, '2023-02-04 17:23:57', '2023-02-04 17:23:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_categories`
--

DROP TABLE IF EXISTS `ticket_categories`;
CREATE TABLE IF NOT EXISTS `ticket_categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_categories`
--

INSERT INTO `ticket_categories` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'پرداخت', 1, '2023-01-13 14:16:55', '2023-01-13 14:17:36', NULL),
(2, 'محصولات', 1, '2023-01-13 14:17:06', '2023-01-13 14:17:06', NULL),
(3, 'تخفیفات', 1, '2023-01-13 14:17:20', '2023-01-20 14:38:21', NULL),
(4, 'لپ تاپ', 0, '2023-01-20 14:38:30', '2023-01-20 14:39:56', '2023-01-20 14:39:56'),
(5, 'لپ تاپ', 1, '2023-01-20 14:39:38', '2023-01-20 14:39:43', '2023-01-20 14:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_files`
--

DROP TABLE IF EXISTS `ticket_files`;
CREATE TABLE IF NOT EXISTS `ticket_files` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_size` bigint NOT NULL,
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `ticket_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_files_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_files_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_priorities`
--

DROP TABLE IF EXISTS `ticket_priorities`;
CREATE TABLE IF NOT EXISTS `ticket_priorities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_priorities`
--

INSERT INTO `ticket_priorities` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ویژه', 1, '2023-01-13 14:20:29', '2023-01-20 14:40:07', NULL),
(2, 'سیستم گیمینگ', 1, '2023-01-20 14:41:10', '2023-01-20 14:41:26', '2023-01-20 14:41:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '0 => user, 1 => admin',
  `national_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `activation` tinyint NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `activation_date` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profile_photo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'avatar',
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `social_media` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `followers_count` bigint DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_national_code_unique` (`national_code`),
  UNIQUE KEY `users_mobile_unique` (`mobile`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_type`, `national_code`, `mobile`, `mobile_verified_at`, `email`, `email_verified_at`, `activation`, `activation_date`, `status`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `slug`, `profile_photo_path`, `bio`, `social_media`, `followers_count`, `current_team_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin', 1, NULL, NULL, NULL, 'admin@admin.com', NULL, 1, NULL, 1, '$2y$10$tuhJv8qwiDvC.5zCX3aZAupB.BCltEm1SYWjsQgcmaUm46XDy4NsK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-07 11:17:39', '2023-02-07 11:17:39', NULL),
(2, 'محمدرضا', 'رضائی', 1, '2741291081', '9031254397', '2023-01-03 17:00:00', 'admin@a2dmin.com', '2023-01-03 17:09:08', 1, NULL, 1, 'asaddaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', NULL, NULL, NULL, 'images\\users\\2023\\01\\13\\1673630010.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-20 16:52:29', NULL),
(3, 'پویا', 'نیروفری', 0, '1288135599', '9364036508', NULL, 'poya@admin.com', NULL, 0, NULL, 0, '$2y$10$ZKMUUvYmf2AHvK2PLnBdx.EGoWV5/JvW9BKehilu5CzO0W6gO7iZG', NULL, NULL, NULL, 'images\\users\\2023\\01\\13\\1673630867.jpg', NULL, NULL, NULL, NULL, NULL, '2023-01-13 13:57:47', '2023-01-20 16:19:10', NULL),
(4, 'میلاد', 'محمودی', 1, NULL, '9145532852', NULL, 'milad@admin.com', NULL, 1, NULL, 1, '$2y$10$pZEXzKOr1iGFz4Ax6/bTJ.wUNpuxvkCGOE2cxJhsTSG9wFLOZg/iO', NULL, NULL, NULL, 'images\\users\\2023\\01\\20\\1674241883.jpg', NULL, NULL, NULL, NULL, NULL, '2023-01-20 15:40:40', '2023-01-22 13:39:22', NULL),
(5, 'حسن', 'علیزاده', 1, NULL, '9147160430', NULL, 'hassan@admin.com', NULL, 1, NULL, 1, '$2y$10$ifwG476wmozUZl0he626PuKo0qx5MhgzkE7zvw1TRtr2tYly/XDyi', NULL, NULL, NULL, 'images\\users\\2023\\01\\20\\1674242558.jpg', NULL, NULL, NULL, NULL, NULL, '2023-01-20 15:44:00', '2023-01-20 15:55:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
CREATE TABLE IF NOT EXISTS `views` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `viewable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `viewable_id` bigint UNSIGNED NOT NULL,
  `visitor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `collection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `views_viewable_type_viewable_id_index` (`viewable_type`,`viewable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `viewable_type`, `viewable_id`, `visitor`, `collection`, `viewed_at`) VALUES
(1, 'Modules\\Product\\Entities\\Product', 4, '9B3edNwfe1kZ1kbIjnARuUWwjoGT5nfrIKSmu4b7KgsMQEQ67yFQQ3iBP3TsSoL66daedsJSan5uYLux', NULL, '2023-02-07 17:49:39'),
(2, 'Modules\\Product\\Entities\\Product', 4, '9B3edNwfe1kZ1kbIjnARuUWwjoGT5nfrIKSmu4b7KgsMQEQ67yFQQ3iBP3TsSoL66daedsJSan5uYLux', NULL, '2023-02-07 18:41:18'),
(3, 'Modules\\Product\\Entities\\Product', 4, '9B3edNwfe1kZ1kbIjnARuUWwjoGT5nfrIKSmu4b7KgsMQEQ67yFQQ3iBP3TsSoL66daedsJSan5uYLux', NULL, '2023-02-07 18:42:27'),
(4, 'Modules\\Product\\Entities\\Product', 2, '9B3edNwfe1kZ1kbIjnARuUWwjoGT5nfrIKSmu4b7KgsMQEQ67yFQQ3iBP3TsSoL66daedsJSan5uYLux', NULL, '2023-02-07 19:22:46');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `addresses_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `amazing_sales`
--
ALTER TABLE `amazing_sales`
  ADD CONSTRAINT `amazing_sales_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attribute_category`
--
ALTER TABLE `attribute_category`
  ADD CONSTRAINT `attribute_category_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attribute_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attribute_default_values`
--
ALTER TABLE `attribute_default_values`
  ADD CONSTRAINT `attribute_default_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attribute_default_values_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_items_guarantee_id_foreign` FOREIGN KEY (`guarantee_id`) REFERENCES `guarantees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_item_selected_attributes`
--
ALTER TABLE `cart_item_selected_attributes`
  ADD CONSTRAINT `cart_item_selected_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_item_selected_attributes_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_item_selected_attributes_cart_item_id_foreign` FOREIGN KEY (`cart_item_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cash_payments`
--
ALTER TABLE `cash_payments`
  ADD CONSTRAINT `cash_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`);

--
-- Constraints for table `copans`
--
ALTER TABLE `copans`
  ADD CONSTRAINT `copans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guarantees`
--
ALTER TABLE `guarantees`
  ADD CONSTRAINT `guarantees_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offline_payments`
--
ALTER TABLE `offline_payments`
  ADD CONSTRAINT `offline_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `online_payments`
--
ALTER TABLE `online_payments`
  ADD CONSTRAINT `online_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_common_discount_id_foreign` FOREIGN KEY (`common_discount_id`) REFERENCES `common_discount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_copan_id_foreign` FOREIGN KEY (`copan_id`) REFERENCES `copans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_delivery_id_foreign` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_amazing_sale_id_foreign` FOREIGN KEY (`amazing_sale_id`) REFERENCES `amazing_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_guarantee_id_foreign` FOREIGN KEY (`guarantee_id`) REFERENCES `guarantees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_item_selected_attributes`
--
ALTER TABLE `order_item_selected_attributes`
  ADD CONSTRAINT `order_item_selected_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_selected_attributes_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_selected_attributes_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `otps`
--
ALTER TABLE `otps`
  ADD CONSTRAINT `otps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_meta`
--
ALTER TABLE `product_meta`
  ADD CONSTRAINT `product_meta_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `provinces`
--
ALTER TABLE `provinces`
  ADD CONSTRAINT `provinces_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `public_mail_files`
--
ALTER TABLE `public_mail_files`
  ADD CONSTRAINT `public_mail_files_public_mail_id_foreign` FOREIGN KEY (`public_mail_id`) REFERENCES `public_mail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggables`
--
ALTER TABLE `taggables`
  ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `ticket_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `ticket_priorities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_reference_id_foreign` FOREIGN KEY (`reference_id`) REFERENCES `ticket_admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_admins`
--
ALTER TABLE `ticket_admins`
  ADD CONSTRAINT `ticket_admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_files`
--
ALTER TABLE `ticket_files`
  ADD CONSTRAINT `ticket_files_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
