-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 12, 2021 at 02:47 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `products_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `photo`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tool', 'assets/category/WNcCxaWBz34RHAgoYFC1LO8bJWQYsUR2z1bJOIBx.svg', 'tool', '2021-02-28 05:09:34', '2021-02-24 06:36:59', '2021-02-28 05:09:34'),
(2, 'sneaker', 'assets/category/wTP71sKnKKJmJ1fXBkuHFz8x76oB6O9SRpIduQzj.svg', 'sneaker', NULL, '2021-02-24 06:54:53', '2021-02-24 06:54:53'),
(3, 'Gadget', 'assets/category/j5TKsZwuFzS2DJNWrMtzQvCxhN2VDEZXPiIASquq.svg', 'gadget', NULL, '2021-03-06 07:02:53', '2021-03-06 07:02:53'),
(4, 'Furniture', 'assets/category/rTKuMjrj9hZORxVs2mjwnMbR4Fe86TLHM8pZFSp8.svg', 'furniture', '2021-04-11 16:28:36', '2021-03-12 02:06:04', '2021-04-11 16:28:36'),
(5, 'testing', 'assets/category/kPVdXqt5eFeBCMPvPw3t8DY3Ik3zTqj8wDYYDC6F.png', 'testing', '2021-04-08 15:36:45', '2021-03-20 23:55:42', '2021-04-08 15:36:45'),
(6, 'Solihah', 'assets/category/Trb8sIBQEU4Hnc5iTbCeyZ9hubvs1s62F0vGzdRE.jpg', 'solihah', '2021-04-11 14:29:23', '2021-04-11 14:20:04', '2021-04-11 14:29:23'),
(7, 'Laptop', 'assets/category/MR0SyqmhyMzVNkIphQbzimIkCS0TlBiNGSWbTfaP.png', 'laptop', NULL, '2021-05-07 00:54:08', '2021-05-07 00:54:21'),
(8, 'Handphone', 'assets/category/mFIdaeBWud6itAkzV2SHlL9hNWkzgeLQ6tYdfQ1x.png', 'handphone', '2021-07-12 07:15:07', '2021-07-12 06:06:27', '2021-07-12 07:15:07');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regency_id` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_02_23_132618_create_categories_table', 1),
(5, '2021_02_23_133344_create_products_table', 1),
(6, '2021_02_23_133749_create_product_galleries_table', 1),
(7, '2021_02_23_134014_create_carts_table', 1),
(8, '2021_02_23_134700_create_transactions_table', 2),
(9, '2021_02_23_134733_create_transaction_details_table', 2),
(10, '2021_02_23_140144_delete_resi_field_at_transactions_table', 3),
(11, '2021_02_23_140743_add_resi_and_shipping_status_to_transaction_details_table', 4),
(12, '2021_02_23_141632_add_code_to_transactions_table', 5),
(13, '2021_02_23_141824_add_code_to_transaction_details_table', 5),
(14, '2021_02_23_142723_adding_code_to_transaction_details_table', 6),
(15, '2021_02_23_143027_add_slug_to_products_table', 7),
(16, '2021_02_23_143507_add_roles_to_users_table', 8),
(17, '2021_03_01_082733_change_nullable_field_at_users_table', 9),
(18, '2017_05_02_140432_create_provinces_tables', 10),
(19, '2017_05_02_140444_create_regencies_tables', 10),
(20, '2017_05_02_142019_create_districts_tables', 10),
(21, '2017_05_02_143454_create_villages_tables', 10);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock_available` int(11) UNSIGNED ZEROFILL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `users_id`, `categories_id`, `price`, `description`, `deleted_at`, `created_at`, `updated_at`, `stock_available`, `slug`, `stock_total`) VALUES
(1, 'Rose Are Red Blue', 1, 2, 1000, '<p>tessss</p>', '2021-03-06 00:27:38', '2021-03-04 01:10:00', '2021-03-06 00:27:38', NULL, 'rose-are-red-blue', NULL),
(2, 'Rose Are Red', 1, 2, 1000, '<p>tessssse</p>', '2021-03-21 00:28:51', '2021-03-06 00:32:24', '2021-03-21 00:28:51', NULL, 'rose-are-red', NULL),
(3, 'Violet are Blue', 1, 3, 250, '<p>tesssting</p>', '2021-03-06 07:09:18', '2021-03-06 07:03:50', '2021-03-06 07:09:18', NULL, 'violet-are-blue', NULL),
(4, 'A book', 1, 3, 120, '<p>sdadsadadad</p>', '2021-03-21 00:28:54', '2021-03-06 07:12:35', '2021-03-21 00:28:54', NULL, 'a-book', NULL),
(5, 'tesss', 1, 2, 12123, '<p>fsdfsa</p>', '2021-03-21 00:28:58', '2021-03-15 07:10:32', '2021-03-21 00:28:58', NULL, 'tesss', NULL),
(6, 'fia', 1, 5, 12345, '<p>asddffhgjj</p>', '2021-03-21 00:29:01', '2021-03-21 00:16:24', '2021-03-21 00:29:01', NULL, 'fia', NULL),
(7, 'ERD Web Profile', 5, 2, 90000, '<p>yuhuuu</p>\r\n\r\n<p>&nbsp;</p>', '2021-03-21 00:29:05', '2021-03-21 00:18:45', '2021-03-21 00:29:05', NULL, 'erd-web-profile', NULL),
(8, 'ERD Web Profile', 1, 2, 8, '<p>k</p>', '2021-03-24 04:20:00', '2021-03-21 00:29:31', '2021-03-24 04:20:00', NULL, 'erd-web-profile', NULL),
(9, 'Solihah', 1, 2, 1, '<p>oyyy</p>', '2021-03-24 04:20:04', '2021-03-21 03:51:32', '2021-03-24 04:20:04', NULL, 'solihah', 2),
(10, 'Akuu', 1, 2, 20, '<p>jsdfnds</p>', '2021-04-08 15:36:05', '2021-03-24 03:20:05', '2021-04-08 15:36:05', 00000000000, 'akuu', 20),
(11, 'fia', 1, 4, 9, '<p>99</p>', '2021-04-08 15:36:09', '2021-03-24 10:22:26', '2021-04-08 15:36:09', 00000000001, 'fia', 10),
(12, 'Tomkins', 5, 2, 350000, '<p>Sepatu Tomkins</p>', NULL, '2021-04-08 15:41:49', '2021-07-12 06:30:20', 00000000006, 'tomkins', 10),
(13, 'TOmkins 12', 1, 2, 20, '<p>dgshklfldbkjs</p>', '2021-04-11 15:18:11', '2021-04-11 14:46:47', '2021-04-11 15:18:11', 00000000001, 'tomkins-12', 2),
(14, 'TOmkins 12', 5, 2, 250000, '<p>Ini adaah sneakers</p>', '2021-04-11 16:10:51', '2021-04-11 16:09:37', '2021-04-11 16:10:51', 00000000005, 'tomkins-12', 5),
(15, 'Kaos Tomkins', 5, 2, 250000, '<p>Ini&nbsp;Tomkins</p>', NULL, '2021-04-11 16:27:32', '2021-07-11 01:27:20', 00000000005, 'kaos-tomkins', 5),
(16, 'Lenovo Ideapad 330', 1, 7, 3299000, '<p><img alt=\"Laptop Lenovo Ideapad 330\" src=\"https://www.lenovo.com/medias/lenovo-laptop-ideapad-330-14-hero.png?context=bWFzdGVyfHJvb3R8NTM0NDN8aW1hZ2UvcG5nfGg4ZS9oMWIvOTcxMzM4NzM3MjU3NC5wbmd8ZDI2MzlkMjMwZTkyNGI3MGU2ZDE0MTQ4NWZiMTczYjdmZTg2NTFmMGUyNDViNmM1ZTRjNGNiZTE4MjJlYmVjMA\" style=\"height:200px; width:282px\" /></p>\r\n\r\n<p>Lenovo Ideapad 330</p>', NULL, '2021-05-07 00:55:30', '2021-07-12 00:28:40', 00000000006, 'lenovo-ideapad-330', 10),
(17, 'ASUS X441BA', 1, 7, 3650000, '<p><img alt=\"ASUS X441BA\" src=\"https://www.jakartanotebook.com/images/products/1/2/38785/5/asus-x441ba-ga611t-amd-a6-9225-4gb-ddr4-1tb-14-inch-windows-10-brown-1.jpg\" style=\"height:300px; width:300px\" /></p>\r\n\r\n<p>ASUS X441BA</p>', NULL, '2021-05-08 00:23:50', '2021-05-10 01:43:14', 00000000008, 'asus-x441ba', 10),
(22, 'Acer Aspire 3', 8, 7, 5000000, '<p><img alt=\"\" src=\"https://images.tokopedia.net/img/cache/700/product-1/2020/3/27/91368482/91368482_0d0fba0e-f9c4-4712-b0d1-4f8fe29f6b7e_700_700\" style=\"height:350px; width:350px\" /></p>', NULL, '2021-07-11 03:39:36', '2021-07-11 03:41:49', 00000000009, 'acer-aspire-3', 10),
(23, 'Oppo A15', 8, 7, 2000000, '<p><img alt=\"\" src=\"https://cf.shopee.co.id/file/3b20480ea4e4f6552b808a0cf03edc75\" style=\"height:350px; width:350px\" /></p>', '2021-07-11 06:09:33', '2021-07-11 06:00:33', '2021-07-11 06:09:33', 00000000007, 'oppo-a15', 10),
(24, 'Oppo A15', 8, 7, 2000000, '<p><img alt=\"\" src=\"https://cf.shopee.co.id/file/3b20480ea4e4f6552b808a0cf03edc75\" style=\"height:350px; width:350px\" /></p>', '2021-07-11 06:14:32', '2021-07-11 06:10:01', '2021-07-11 06:14:32', 00000000007, 'oppo-a15', 10),
(25, 'Oppo A15', 8, 7, 2000000, '<p><img alt=\"\" src=\"https://cf.shopee.co.id/file/3b20480ea4e4f6552b808a0cf03edc75\" style=\"height:350px; width:350px\" /></p>', '2021-07-11 06:32:27', '2021-07-11 06:15:40', '2021-07-11 06:32:27', 00000000007, 'oppo-a15', 10),
(26, 'Oppo A15', 8, 7, 2000000, '<p><img alt=\"\" src=\"https://cf.shopee.co.id/file/3b20480ea4e4f6552b808a0cf03edc75\" style=\"height:350px; width:350px\" /></p>', '2021-07-11 06:54:51', '2021-07-11 06:34:17', '2021-07-11 06:54:51', 00000000007, 'oppo-a15', 10),
(27, 'Oppo A15', 8, 8, 2000000, '<p><img alt=\"\" src=\"https://cf.shopee.co.id/file/3b20480ea4e4f6552b808a0cf03edc75\" style=\"height:350px; width:350px\" /></p>', '2021-07-12 07:15:27', '2021-07-11 06:55:15', '2021-07-12 07:15:27', 00000000004, 'oppo-a15', 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_galleries`
--

CREATE TABLE `product_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_galleries`
--

INSERT INTO `product_galleries` (`id`, `photos`, `products_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(16, 'assets/product/O1ARsmdDmfzQ7rB3CTaeo3lNEGXBHbM9qiOwYWsj.jpg', 12, NULL, '2021-04-08 15:42:06', '2021-04-08 15:42:06'),
(17, 'assets/product/rsO3hlGyGzzpCBBvMb0E2FNPLvEc57xzGLfKH3si.jpg', 12, NULL, '2021-04-08 15:42:27', '2021-04-08 15:42:27'),
(19, 'assets/product/n5Mmx6gqcSDuUrrhcToKMo1McBY1qa0slILgRt9C.png', 15, NULL, '2021-04-11 16:27:53', '2021-04-11 16:27:53'),
(21, 'assets/product/JhHvhKxe3I4cmqomSy8knOOSWHk4AMtc9wVXVAR4.jpg', 17, NULL, '2021-05-08 00:24:11', '2021-05-08 00:24:11'),
(23, 'assets/product/yzkyRBa0g2HmAYiaMfpNKrmGHOPITtLOfm0WqZLb.webp', 16, NULL, '2021-07-05 23:39:47', '2021-07-05 23:39:47'),
(28, 'assets/product/WhScqyyHhtXBEGfPW0pDETXTGfsKOlFf7tpj7eU9.jpg', 22, NULL, '2021-07-11 03:41:04', '2021-07-11 03:41:04');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`) VALUES
('11', 'ACEH'),
('12', 'SUMATERA UTARA'),
('13', 'SUMATERA BARAT'),
('14', 'RIAU'),
('15', 'JAMBI'),
('16', 'SUMATERA SELATAN'),
('17', 'BENGKULU'),
('18', 'LAMPUNG'),
('19', 'KEPULAUAN BANGKA BELITUNG'),
('21', 'KEPULAUAN RIAU'),
('31', 'DKI JAKARTA'),
('32', 'JAWA BARAT'),
('33', 'JAWA TENGAH'),
('34', 'DI YOGYAKARTA'),
('35', 'JAWA TIMUR'),
('36', 'BANTEN'),
('51', 'BALI'),
('52', 'NUSA TENGGARA BARAT'),
('53', 'NUSA TENGGARA TIMUR'),
('61', 'KALIMANTAN BARAT'),
('62', 'KALIMANTAN TENGAH'),
('63', 'KALIMANTAN SELATAN'),
('64', 'KALIMANTAN TIMUR'),
('65', 'KALIMANTAN UTARA'),
('71', 'SULAWESI UTARA'),
('72', 'SULAWESI TENGAH'),
('73', 'SULAWESI SELATAN'),
('74', 'SULAWESI TENGGARA'),
('75', 'GORONTALO'),
('76', 'SULAWESI BARAT'),
('81', 'MALUKU'),
('82', 'MALUKU UTARA'),
('91', 'PAPUA BARAT'),
('94', 'PAPUA');

-- --------------------------------------------------------

--
-- Table structure for table `regencies`
--

CREATE TABLE `regencies` (
  `id` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_id` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regencies`
--

INSERT INTO `regencies` (`id`, `province_id`, `name`) VALUES
('1101', '11', 'KABUPATEN SIMEULUE'),
('1102', '11', 'KABUPATEN ACEH SINGKIL'),
('1103', '11', 'KABUPATEN ACEH SELATAN'),
('1104', '11', 'KABUPATEN ACEH TENGGARA'),
('1105', '11', 'KABUPATEN ACEH TIMUR'),
('1106', '11', 'KABUPATEN ACEH TENGAH'),
('1107', '11', 'KABUPATEN ACEH BARAT'),
('1108', '11', 'KABUPATEN ACEH BESAR'),
('1109', '11', 'KABUPATEN PIDIE'),
('1110', '11', 'KABUPATEN BIREUEN'),
('1111', '11', 'KABUPATEN ACEH UTARA'),
('1112', '11', 'KABUPATEN ACEH BARAT DAYA'),
('1113', '11', 'KABUPATEN GAYO LUES'),
('1114', '11', 'KABUPATEN ACEH TAMIANG'),
('1115', '11', 'KABUPATEN NAGAN RAYA'),
('1116', '11', 'KABUPATEN ACEH JAYA'),
('1117', '11', 'KABUPATEN BENER MERIAH'),
('1118', '11', 'KABUPATEN PIDIE JAYA'),
('1171', '11', 'KOTA BANDA ACEH'),
('1172', '11', 'KOTA SABANG'),
('1173', '11', 'KOTA LANGSA'),
('1174', '11', 'KOTA LHOKSEUMAWE'),
('1175', '11', 'KOTA SUBULUSSALAM'),
('1201', '12', 'KABUPATEN NIAS'),
('1202', '12', 'KABUPATEN MANDAILING NATAL'),
('1203', '12', 'KABUPATEN TAPANULI SELATAN'),
('1204', '12', 'KABUPATEN TAPANULI TENGAH'),
('1205', '12', 'KABUPATEN TAPANULI UTARA'),
('1206', '12', 'KABUPATEN TOBA SAMOSIR'),
('1207', '12', 'KABUPATEN LABUHAN BATU'),
('1208', '12', 'KABUPATEN ASAHAN'),
('1209', '12', 'KABUPATEN SIMALUNGUN'),
('1210', '12', 'KABUPATEN DAIRI'),
('1211', '12', 'KABUPATEN KARO'),
('1212', '12', 'KABUPATEN DELI SERDANG'),
('1213', '12', 'KABUPATEN LANGKAT'),
('1214', '12', 'KABUPATEN NIAS SELATAN'),
('1215', '12', 'KABUPATEN HUMBANG HASUNDUTAN'),
('1216', '12', 'KABUPATEN PAKPAK BHARAT'),
('1217', '12', 'KABUPATEN SAMOSIR'),
('1218', '12', 'KABUPATEN SERDANG BEDAGAI'),
('1219', '12', 'KABUPATEN BATU BARA'),
('1220', '12', 'KABUPATEN PADANG LAWAS UTARA'),
('1221', '12', 'KABUPATEN PADANG LAWAS'),
('1222', '12', 'KABUPATEN LABUHAN BATU SELATAN'),
('1223', '12', 'KABUPATEN LABUHAN BATU UTARA'),
('1224', '12', 'KABUPATEN NIAS UTARA'),
('1225', '12', 'KABUPATEN NIAS BARAT'),
('1271', '12', 'KOTA SIBOLGA'),
('1272', '12', 'KOTA TANJUNG BALAI'),
('1273', '12', 'KOTA PEMATANG SIANTAR'),
('1274', '12', 'KOTA TEBING TINGGI'),
('1275', '12', 'KOTA MEDAN'),
('1276', '12', 'KOTA BINJAI'),
('1277', '12', 'KOTA PADANGSIDIMPUAN'),
('1278', '12', 'KOTA GUNUNGSITOLI'),
('1301', '13', 'KABUPATEN KEPULAUAN MENTAWAI'),
('1302', '13', 'KABUPATEN PESISIR SELATAN'),
('1303', '13', 'KABUPATEN SOLOK'),
('1304', '13', 'KABUPATEN SIJUNJUNG'),
('1305', '13', 'KABUPATEN TANAH DATAR'),
('1306', '13', 'KABUPATEN PADANG PARIAMAN'),
('1307', '13', 'KABUPATEN AGAM'),
('1308', '13', 'KABUPATEN LIMA PULUH KOTA'),
('1309', '13', 'KABUPATEN PASAMAN'),
('1310', '13', 'KABUPATEN SOLOK SELATAN'),
('1311', '13', 'KABUPATEN DHARMASRAYA'),
('1312', '13', 'KABUPATEN PASAMAN BARAT'),
('1371', '13', 'KOTA PADANG'),
('1372', '13', 'KOTA SOLOK'),
('1373', '13', 'KOTA SAWAH LUNTO'),
('1374', '13', 'KOTA PADANG PANJANG'),
('1375', '13', 'KOTA BUKITTINGGI'),
('1376', '13', 'KOTA PAYAKUMBUH'),
('1377', '13', 'KOTA PARIAMAN'),
('1401', '14', 'KABUPATEN KUANTAN SINGINGI'),
('1402', '14', 'KABUPATEN INDRAGIRI HULU'),
('1403', '14', 'KABUPATEN INDRAGIRI HILIR'),
('1404', '14', 'KABUPATEN PELALAWAN'),
('1405', '14', 'KABUPATEN S I A K'),
('1406', '14', 'KABUPATEN KAMPAR'),
('1407', '14', 'KABUPATEN ROKAN HULU'),
('1408', '14', 'KABUPATEN BENGKALIS'),
('1409', '14', 'KABUPATEN ROKAN HILIR'),
('1410', '14', 'KABUPATEN KEPULAUAN MERANTI'),
('1471', '14', 'KOTA PEKANBARU'),
('1473', '14', 'KOTA D U M A I'),
('1501', '15', 'KABUPATEN KERINCI'),
('1502', '15', 'KABUPATEN MERANGIN'),
('1503', '15', 'KABUPATEN SAROLANGUN'),
('1504', '15', 'KABUPATEN BATANG HARI'),
('1505', '15', 'KABUPATEN MUARO JAMBI'),
('1506', '15', 'KABUPATEN TANJUNG JABUNG TIMUR'),
('1507', '15', 'KABUPATEN TANJUNG JABUNG BARAT'),
('1508', '15', 'KABUPATEN TEBO'),
('1509', '15', 'KABUPATEN BUNGO'),
('1571', '15', 'KOTA JAMBI'),
('1572', '15', 'KOTA SUNGAI PENUH'),
('1601', '16', 'KABUPATEN OGAN KOMERING ULU'),
('1602', '16', 'KABUPATEN OGAN KOMERING ILIR'),
('1603', '16', 'KABUPATEN MUARA ENIM'),
('1604', '16', 'KABUPATEN LAHAT'),
('1605', '16', 'KABUPATEN MUSI RAWAS'),
('1606', '16', 'KABUPATEN MUSI BANYUASIN'),
('1607', '16', 'KABUPATEN BANYU ASIN'),
('1608', '16', 'KABUPATEN OGAN KOMERING ULU SELATAN'),
('1609', '16', 'KABUPATEN OGAN KOMERING ULU TIMUR'),
('1610', '16', 'KABUPATEN OGAN ILIR'),
('1611', '16', 'KABUPATEN EMPAT LAWANG'),
('1612', '16', 'KABUPATEN PENUKAL ABAB LEMATANG ILIR'),
('1613', '16', 'KABUPATEN MUSI RAWAS UTARA'),
('1671', '16', 'KOTA PALEMBANG'),
('1672', '16', 'KOTA PRABUMULIH'),
('1673', '16', 'KOTA PAGAR ALAM'),
('1674', '16', 'KOTA LUBUKLINGGAU'),
('1701', '17', 'KABUPATEN BENGKULU SELATAN'),
('1702', '17', 'KABUPATEN REJANG LEBONG'),
('1703', '17', 'KABUPATEN BENGKULU UTARA'),
('1704', '17', 'KABUPATEN KAUR'),
('1705', '17', 'KABUPATEN SELUMA'),
('1706', '17', 'KABUPATEN MUKOMUKO'),
('1707', '17', 'KABUPATEN LEBONG'),
('1708', '17', 'KABUPATEN KEPAHIANG'),
('1709', '17', 'KABUPATEN BENGKULU TENGAH'),
('1771', '17', 'KOTA BENGKULU'),
('1801', '18', 'KABUPATEN LAMPUNG BARAT'),
('1802', '18', 'KABUPATEN TANGGAMUS'),
('1803', '18', 'KABUPATEN LAMPUNG SELATAN'),
('1804', '18', 'KABUPATEN LAMPUNG TIMUR'),
('1805', '18', 'KABUPATEN LAMPUNG TENGAH'),
('1806', '18', 'KABUPATEN LAMPUNG UTARA'),
('1807', '18', 'KABUPATEN WAY KANAN'),
('1808', '18', 'KABUPATEN TULANGBAWANG'),
('1809', '18', 'KABUPATEN PESAWARAN'),
('1810', '18', 'KABUPATEN PRINGSEWU'),
('1811', '18', 'KABUPATEN MESUJI'),
('1812', '18', 'KABUPATEN TULANG BAWANG BARAT'),
('1813', '18', 'KABUPATEN PESISIR BARAT'),
('1871', '18', 'KOTA BANDAR LAMPUNG'),
('1872', '18', 'KOTA METRO'),
('1901', '19', 'KABUPATEN BANGKA'),
('1902', '19', 'KABUPATEN BELITUNG'),
('1903', '19', 'KABUPATEN BANGKA BARAT'),
('1904', '19', 'KABUPATEN BANGKA TENGAH'),
('1905', '19', 'KABUPATEN BANGKA SELATAN'),
('1906', '19', 'KABUPATEN BELITUNG TIMUR'),
('1971', '19', 'KOTA PANGKAL PINANG'),
('2101', '21', 'KABUPATEN KARIMUN'),
('2102', '21', 'KABUPATEN BINTAN'),
('2103', '21', 'KABUPATEN NATUNA'),
('2104', '21', 'KABUPATEN LINGGA'),
('2105', '21', 'KABUPATEN KEPULAUAN ANAMBAS'),
('2171', '21', 'KOTA B A T A M'),
('2172', '21', 'KOTA TANJUNG PINANG'),
('3101', '31', 'KABUPATEN KEPULAUAN SERIBU'),
('3171', '31', 'KOTA JAKARTA SELATAN'),
('3172', '31', 'KOTA JAKARTA TIMUR'),
('3173', '31', 'KOTA JAKARTA PUSAT'),
('3174', '31', 'KOTA JAKARTA BARAT'),
('3175', '31', 'KOTA JAKARTA UTARA'),
('3201', '32', 'KABUPATEN BOGOR'),
('3202', '32', 'KABUPATEN SUKABUMI'),
('3203', '32', 'KABUPATEN CIANJUR'),
('3204', '32', 'KABUPATEN BANDUNG'),
('3205', '32', 'KABUPATEN GARUT'),
('3206', '32', 'KABUPATEN TASIKMALAYA'),
('3207', '32', 'KABUPATEN CIAMIS'),
('3208', '32', 'KABUPATEN KUNINGAN'),
('3209', '32', 'KABUPATEN CIREBON'),
('3210', '32', 'KABUPATEN MAJALENGKA'),
('3211', '32', 'KABUPATEN SUMEDANG'),
('3212', '32', 'KABUPATEN INDRAMAYU'),
('3213', '32', 'KABUPATEN SUBANG'),
('3214', '32', 'KABUPATEN PURWAKARTA'),
('3215', '32', 'KABUPATEN KARAWANG'),
('3216', '32', 'KABUPATEN BEKASI'),
('3217', '32', 'KABUPATEN BANDUNG BARAT'),
('3218', '32', 'KABUPATEN PANGANDARAN'),
('3271', '32', 'KOTA BOGOR'),
('3272', '32', 'KOTA SUKABUMI'),
('3273', '32', 'KOTA BANDUNG'),
('3274', '32', 'KOTA CIREBON'),
('3275', '32', 'KOTA BEKASI'),
('3276', '32', 'KOTA DEPOK'),
('3277', '32', 'KOTA CIMAHI'),
('3278', '32', 'KOTA TASIKMALAYA'),
('3279', '32', 'KOTA BANJAR'),
('3301', '33', 'KABUPATEN CILACAP'),
('3302', '33', 'KABUPATEN BANYUMAS'),
('3303', '33', 'KABUPATEN PURBALINGGA'),
('3304', '33', 'KABUPATEN BANJARNEGARA'),
('3305', '33', 'KABUPATEN KEBUMEN'),
('3306', '33', 'KABUPATEN PURWOREJO'),
('3307', '33', 'KABUPATEN WONOSOBO'),
('3308', '33', 'KABUPATEN MAGELANG'),
('3309', '33', 'KABUPATEN BOYOLALI'),
('3310', '33', 'KABUPATEN KLATEN'),
('3311', '33', 'KABUPATEN SUKOHARJO'),
('3312', '33', 'KABUPATEN WONOGIRI'),
('3313', '33', 'KABUPATEN KARANGANYAR'),
('3314', '33', 'KABUPATEN SRAGEN'),
('3315', '33', 'KABUPATEN GROBOGAN'),
('3316', '33', 'KABUPATEN BLORA'),
('3317', '33', 'KABUPATEN REMBANG'),
('3318', '33', 'KABUPATEN PATI'),
('3319', '33', 'KABUPATEN KUDUS'),
('3320', '33', 'KABUPATEN JEPARA'),
('3321', '33', 'KABUPATEN DEMAK'),
('3322', '33', 'KABUPATEN SEMARANG'),
('3323', '33', 'KABUPATEN TEMANGGUNG'),
('3324', '33', 'KABUPATEN KENDAL'),
('3325', '33', 'KABUPATEN BATANG'),
('3326', '33', 'KABUPATEN PEKALONGAN'),
('3327', '33', 'KABUPATEN PEMALANG'),
('3328', '33', 'KABUPATEN TEGAL'),
('3329', '33', 'KABUPATEN BREBES'),
('3371', '33', 'KOTA MAGELANG'),
('3372', '33', 'KOTA SURAKARTA'),
('3373', '33', 'KOTA SALATIGA'),
('3374', '33', 'KOTA SEMARANG'),
('3375', '33', 'KOTA PEKALONGAN'),
('3376', '33', 'KOTA TEGAL'),
('3401', '34', 'KABUPATEN KULON PROGO'),
('3402', '34', 'KABUPATEN BANTUL'),
('3403', '34', 'KABUPATEN GUNUNG KIDUL'),
('3404', '34', 'KABUPATEN SLEMAN'),
('3471', '34', 'KOTA YOGYAKARTA'),
('3501', '35', 'KABUPATEN PACITAN'),
('3502', '35', 'KABUPATEN PONOROGO'),
('3503', '35', 'KABUPATEN TRENGGALEK'),
('3504', '35', 'KABUPATEN TULUNGAGUNG'),
('3505', '35', 'KABUPATEN BLITAR'),
('3506', '35', 'KABUPATEN KEDIRI'),
('3507', '35', 'KABUPATEN MALANG'),
('3508', '35', 'KABUPATEN LUMAJANG'),
('3509', '35', 'KABUPATEN JEMBER'),
('3510', '35', 'KABUPATEN BANYUWANGI'),
('3511', '35', 'KABUPATEN BONDOWOSO'),
('3512', '35', 'KABUPATEN SITUBONDO'),
('3513', '35', 'KABUPATEN PROBOLINGGO'),
('3514', '35', 'KABUPATEN PASURUAN'),
('3515', '35', 'KABUPATEN SIDOARJO'),
('3516', '35', 'KABUPATEN MOJOKERTO'),
('3517', '35', 'KABUPATEN JOMBANG'),
('3518', '35', 'KABUPATEN NGANJUK'),
('3519', '35', 'KABUPATEN MADIUN'),
('3520', '35', 'KABUPATEN MAGETAN'),
('3521', '35', 'KABUPATEN NGAWI'),
('3522', '35', 'KABUPATEN BOJONEGORO'),
('3523', '35', 'KABUPATEN TUBAN'),
('3524', '35', 'KABUPATEN LAMONGAN'),
('3525', '35', 'KABUPATEN GRESIK'),
('3526', '35', 'KABUPATEN BANGKALAN'),
('3527', '35', 'KABUPATEN SAMPANG'),
('3528', '35', 'KABUPATEN PAMEKASAN'),
('3529', '35', 'KABUPATEN SUMENEP'),
('3571', '35', 'KOTA KEDIRI'),
('3572', '35', 'KOTA BLITAR'),
('3573', '35', 'KOTA MALANG'),
('3574', '35', 'KOTA PROBOLINGGO'),
('3575', '35', 'KOTA PASURUAN'),
('3576', '35', 'KOTA MOJOKERTO'),
('3577', '35', 'KOTA MADIUN'),
('3578', '35', 'KOTA SURABAYA'),
('3579', '35', 'KOTA BATU'),
('3601', '36', 'KABUPATEN PANDEGLANG'),
('3602', '36', 'KABUPATEN LEBAK'),
('3603', '36', 'KABUPATEN TANGERANG'),
('3604', '36', 'KABUPATEN SERANG'),
('3671', '36', 'KOTA TANGERANG'),
('3672', '36', 'KOTA CILEGON'),
('3673', '36', 'KOTA SERANG'),
('3674', '36', 'KOTA TANGERANG SELATAN'),
('5101', '51', 'KABUPATEN JEMBRANA'),
('5102', '51', 'KABUPATEN TABANAN'),
('5103', '51', 'KABUPATEN BADUNG'),
('5104', '51', 'KABUPATEN GIANYAR'),
('5105', '51', 'KABUPATEN KLUNGKUNG'),
('5106', '51', 'KABUPATEN BANGLI'),
('5107', '51', 'KABUPATEN KARANG ASEM'),
('5108', '51', 'KABUPATEN BULELENG'),
('5171', '51', 'KOTA DENPASAR'),
('5201', '52', 'KABUPATEN LOMBOK BARAT'),
('5202', '52', 'KABUPATEN LOMBOK TENGAH'),
('5203', '52', 'KABUPATEN LOMBOK TIMUR'),
('5204', '52', 'KABUPATEN SUMBAWA'),
('5205', '52', 'KABUPATEN DOMPU'),
('5206', '52', 'KABUPATEN BIMA'),
('5207', '52', 'KABUPATEN SUMBAWA BARAT'),
('5208', '52', 'KABUPATEN LOMBOK UTARA'),
('5271', '52', 'KOTA MATARAM'),
('5272', '52', 'KOTA BIMA'),
('5301', '53', 'KABUPATEN SUMBA BARAT'),
('5302', '53', 'KABUPATEN SUMBA TIMUR'),
('5303', '53', 'KABUPATEN KUPANG'),
('5304', '53', 'KABUPATEN TIMOR TENGAH SELATAN'),
('5305', '53', 'KABUPATEN TIMOR TENGAH UTARA'),
('5306', '53', 'KABUPATEN BELU'),
('5307', '53', 'KABUPATEN ALOR'),
('5308', '53', 'KABUPATEN LEMBATA'),
('5309', '53', 'KABUPATEN FLORES TIMUR'),
('5310', '53', 'KABUPATEN SIKKA'),
('5311', '53', 'KABUPATEN ENDE'),
('5312', '53', 'KABUPATEN NGADA'),
('5313', '53', 'KABUPATEN MANGGARAI'),
('5314', '53', 'KABUPATEN ROTE NDAO'),
('5315', '53', 'KABUPATEN MANGGARAI BARAT'),
('5316', '53', 'KABUPATEN SUMBA TENGAH'),
('5317', '53', 'KABUPATEN SUMBA BARAT DAYA'),
('5318', '53', 'KABUPATEN NAGEKEO'),
('5319', '53', 'KABUPATEN MANGGARAI TIMUR'),
('5320', '53', 'KABUPATEN SABU RAIJUA'),
('5321', '53', 'KABUPATEN MALAKA'),
('5371', '53', 'KOTA KUPANG'),
('6101', '61', 'KABUPATEN SAMBAS'),
('6102', '61', 'KABUPATEN BENGKAYANG'),
('6103', '61', 'KABUPATEN LANDAK'),
('6104', '61', 'KABUPATEN MEMPAWAH'),
('6105', '61', 'KABUPATEN SANGGAU'),
('6106', '61', 'KABUPATEN KETAPANG'),
('6107', '61', 'KABUPATEN SINTANG'),
('6108', '61', 'KABUPATEN KAPUAS HULU'),
('6109', '61', 'KABUPATEN SEKADAU'),
('6110', '61', 'KABUPATEN MELAWI'),
('6111', '61', 'KABUPATEN KAYONG UTARA'),
('6112', '61', 'KABUPATEN KUBU RAYA'),
('6171', '61', 'KOTA PONTIANAK'),
('6172', '61', 'KOTA SINGKAWANG'),
('6201', '62', 'KABUPATEN KOTAWARINGIN BARAT'),
('6202', '62', 'KABUPATEN KOTAWARINGIN TIMUR'),
('6203', '62', 'KABUPATEN KAPUAS'),
('6204', '62', 'KABUPATEN BARITO SELATAN'),
('6205', '62', 'KABUPATEN BARITO UTARA'),
('6206', '62', 'KABUPATEN SUKAMARA'),
('6207', '62', 'KABUPATEN LAMANDAU'),
('6208', '62', 'KABUPATEN SERUYAN'),
('6209', '62', 'KABUPATEN KATINGAN'),
('6210', '62', 'KABUPATEN PULANG PISAU'),
('6211', '62', 'KABUPATEN GUNUNG MAS'),
('6212', '62', 'KABUPATEN BARITO TIMUR'),
('6213', '62', 'KABUPATEN MURUNG RAYA'),
('6271', '62', 'KOTA PALANGKA RAYA'),
('6301', '63', 'KABUPATEN TANAH LAUT'),
('6302', '63', 'KABUPATEN KOTA BARU'),
('6303', '63', 'KABUPATEN BANJAR'),
('6304', '63', 'KABUPATEN BARITO KUALA'),
('6305', '63', 'KABUPATEN TAPIN'),
('6306', '63', 'KABUPATEN HULU SUNGAI SELATAN'),
('6307', '63', 'KABUPATEN HULU SUNGAI TENGAH'),
('6308', '63', 'KABUPATEN HULU SUNGAI UTARA'),
('6309', '63', 'KABUPATEN TABALONG'),
('6310', '63', 'KABUPATEN TANAH BUMBU'),
('6311', '63', 'KABUPATEN BALANGAN'),
('6371', '63', 'KOTA BANJARMASIN'),
('6372', '63', 'KOTA BANJAR BARU'),
('6401', '64', 'KABUPATEN PASER'),
('6402', '64', 'KABUPATEN KUTAI BARAT'),
('6403', '64', 'KABUPATEN KUTAI KARTANEGARA'),
('6404', '64', 'KABUPATEN KUTAI TIMUR'),
('6405', '64', 'KABUPATEN BERAU'),
('6409', '64', 'KABUPATEN PENAJAM PASER UTARA'),
('6411', '64', 'KABUPATEN MAHAKAM HULU'),
('6471', '64', 'KOTA BALIKPAPAN'),
('6472', '64', 'KOTA SAMARINDA'),
('6474', '64', 'KOTA BONTANG'),
('6501', '65', 'KABUPATEN MALINAU'),
('6502', '65', 'KABUPATEN BULUNGAN'),
('6503', '65', 'KABUPATEN TANA TIDUNG'),
('6504', '65', 'KABUPATEN NUNUKAN'),
('6571', '65', 'KOTA TARAKAN'),
('7101', '71', 'KABUPATEN BOLAANG MONGONDOW'),
('7102', '71', 'KABUPATEN MINAHASA'),
('7103', '71', 'KABUPATEN KEPULAUAN SANGIHE'),
('7104', '71', 'KABUPATEN KEPULAUAN TALAUD'),
('7105', '71', 'KABUPATEN MINAHASA SELATAN'),
('7106', '71', 'KABUPATEN MINAHASA UTARA'),
('7107', '71', 'KABUPATEN BOLAANG MONGONDOW UTARA'),
('7108', '71', 'KABUPATEN SIAU TAGULANDANG BIARO'),
('7109', '71', 'KABUPATEN MINAHASA TENGGARA'),
('7110', '71', 'KABUPATEN BOLAANG MONGONDOW SELATAN'),
('7111', '71', 'KABUPATEN BOLAANG MONGONDOW TIMUR'),
('7171', '71', 'KOTA MANADO'),
('7172', '71', 'KOTA BITUNG'),
('7173', '71', 'KOTA TOMOHON'),
('7174', '71', 'KOTA KOTAMOBAGU'),
('7201', '72', 'KABUPATEN BANGGAI KEPULAUAN'),
('7202', '72', 'KABUPATEN BANGGAI'),
('7203', '72', 'KABUPATEN MOROWALI'),
('7204', '72', 'KABUPATEN POSO'),
('7205', '72', 'KABUPATEN DONGGALA'),
('7206', '72', 'KABUPATEN TOLI-TOLI'),
('7207', '72', 'KABUPATEN BUOL'),
('7208', '72', 'KABUPATEN PARIGI MOUTONG'),
('7209', '72', 'KABUPATEN TOJO UNA-UNA'),
('7210', '72', 'KABUPATEN SIGI'),
('7211', '72', 'KABUPATEN BANGGAI LAUT'),
('7212', '72', 'KABUPATEN MOROWALI UTARA'),
('7271', '72', 'KOTA PALU'),
('7301', '73', 'KABUPATEN KEPULAUAN SELAYAR'),
('7302', '73', 'KABUPATEN BULUKUMBA'),
('7303', '73', 'KABUPATEN BANTAENG'),
('7304', '73', 'KABUPATEN JENEPONTO'),
('7305', '73', 'KABUPATEN TAKALAR'),
('7306', '73', 'KABUPATEN GOWA'),
('7307', '73', 'KABUPATEN SINJAI'),
('7308', '73', 'KABUPATEN MAROS'),
('7309', '73', 'KABUPATEN PANGKAJENE DAN KEPULAUAN'),
('7310', '73', 'KABUPATEN BARRU'),
('7311', '73', 'KABUPATEN BONE'),
('7312', '73', 'KABUPATEN SOPPENG'),
('7313', '73', 'KABUPATEN WAJO'),
('7314', '73', 'KABUPATEN SIDENRENG RAPPANG'),
('7315', '73', 'KABUPATEN PINRANG'),
('7316', '73', 'KABUPATEN ENREKANG'),
('7317', '73', 'KABUPATEN LUWU'),
('7318', '73', 'KABUPATEN TANA TORAJA'),
('7322', '73', 'KABUPATEN LUWU UTARA'),
('7325', '73', 'KABUPATEN LUWU TIMUR'),
('7326', '73', 'KABUPATEN TORAJA UTARA'),
('7371', '73', 'KOTA MAKASSAR'),
('7372', '73', 'KOTA PAREPARE'),
('7373', '73', 'KOTA PALOPO'),
('7401', '74', 'KABUPATEN BUTON'),
('7402', '74', 'KABUPATEN MUNA'),
('7403', '74', 'KABUPATEN KONAWE'),
('7404', '74', 'KABUPATEN KOLAKA'),
('7405', '74', 'KABUPATEN KONAWE SELATAN'),
('7406', '74', 'KABUPATEN BOMBANA'),
('7407', '74', 'KABUPATEN WAKATOBI'),
('7408', '74', 'KABUPATEN KOLAKA UTARA'),
('7409', '74', 'KABUPATEN BUTON UTARA'),
('7410', '74', 'KABUPATEN KONAWE UTARA'),
('7411', '74', 'KABUPATEN KOLAKA TIMUR'),
('7412', '74', 'KABUPATEN KONAWE KEPULAUAN'),
('7413', '74', 'KABUPATEN MUNA BARAT'),
('7414', '74', 'KABUPATEN BUTON TENGAH'),
('7415', '74', 'KABUPATEN BUTON SELATAN'),
('7471', '74', 'KOTA KENDARI'),
('7472', '74', 'KOTA BAUBAU'),
('7501', '75', 'KABUPATEN BOALEMO'),
('7502', '75', 'KABUPATEN GORONTALO'),
('7503', '75', 'KABUPATEN POHUWATO'),
('7504', '75', 'KABUPATEN BONE BOLANGO'),
('7505', '75', 'KABUPATEN GORONTALO UTARA'),
('7571', '75', 'KOTA GORONTALO'),
('7601', '76', 'KABUPATEN MAJENE'),
('7602', '76', 'KABUPATEN POLEWALI MANDAR'),
('7603', '76', 'KABUPATEN MAMASA'),
('7604', '76', 'KABUPATEN MAMUJU'),
('7605', '76', 'KABUPATEN MAMUJU UTARA'),
('7606', '76', 'KABUPATEN MAMUJU TENGAH'),
('8101', '81', 'KABUPATEN MALUKU TENGGARA BARAT'),
('8102', '81', 'KABUPATEN MALUKU TENGGARA'),
('8103', '81', 'KABUPATEN MALUKU TENGAH'),
('8104', '81', 'KABUPATEN BURU'),
('8105', '81', 'KABUPATEN KEPULAUAN ARU'),
('8106', '81', 'KABUPATEN SERAM BAGIAN BARAT'),
('8107', '81', 'KABUPATEN SERAM BAGIAN TIMUR'),
('8108', '81', 'KABUPATEN MALUKU BARAT DAYA'),
('8109', '81', 'KABUPATEN BURU SELATAN'),
('8171', '81', 'KOTA AMBON'),
('8172', '81', 'KOTA TUAL'),
('8201', '82', 'KABUPATEN HALMAHERA BARAT'),
('8202', '82', 'KABUPATEN HALMAHERA TENGAH'),
('8203', '82', 'KABUPATEN KEPULAUAN SULA'),
('8204', '82', 'KABUPATEN HALMAHERA SELATAN'),
('8205', '82', 'KABUPATEN HALMAHERA UTARA'),
('8206', '82', 'KABUPATEN HALMAHERA TIMUR'),
('8207', '82', 'KABUPATEN PULAU MOROTAI'),
('8208', '82', 'KABUPATEN PULAU TALIABU'),
('8271', '82', 'KOTA TERNATE'),
('8272', '82', 'KOTA TIDORE KEPULAUAN'),
('9101', '91', 'KABUPATEN FAKFAK'),
('9102', '91', 'KABUPATEN KAIMANA'),
('9103', '91', 'KABUPATEN TELUK WONDAMA'),
('9104', '91', 'KABUPATEN TELUK BINTUNI'),
('9105', '91', 'KABUPATEN MANOKWARI'),
('9106', '91', 'KABUPATEN SORONG SELATAN'),
('9107', '91', 'KABUPATEN SORONG'),
('9108', '91', 'KABUPATEN RAJA AMPAT'),
('9109', '91', 'KABUPATEN TAMBRAUW'),
('9110', '91', 'KABUPATEN MAYBRAT'),
('9111', '91', 'KABUPATEN MANOKWARI SELATAN'),
('9112', '91', 'KABUPATEN PEGUNUNGAN ARFAK'),
('9171', '91', 'KOTA SORONG'),
('9401', '94', 'KABUPATEN MERAUKE'),
('9402', '94', 'KABUPATEN JAYAWIJAYA'),
('9403', '94', 'KABUPATEN JAYAPURA'),
('9404', '94', 'KABUPATEN NABIRE'),
('9408', '94', 'KABUPATEN KEPULAUAN YAPEN'),
('9409', '94', 'KABUPATEN BIAK NUMFOR'),
('9410', '94', 'KABUPATEN PANIAI'),
('9411', '94', 'KABUPATEN PUNCAK JAYA'),
('9412', '94', 'KABUPATEN MIMIKA'),
('9413', '94', 'KABUPATEN BOVEN DIGOEL'),
('9414', '94', 'KABUPATEN MAPPI'),
('9415', '94', 'KABUPATEN ASMAT'),
('9416', '94', 'KABUPATEN YAHUKIMO'),
('9417', '94', 'KABUPATEN PEGUNUNGAN BINTANG'),
('9418', '94', 'KABUPATEN TOLIKARA'),
('9419', '94', 'KABUPATEN SARMI'),
('9420', '94', 'KABUPATEN KEEROM'),
('9426', '94', 'KABUPATEN WAROPEN'),
('9427', '94', 'KABUPATEN SUPIORI'),
('9428', '94', 'KABUPATEN MAMBERAMO RAYA'),
('9429', '94', 'KABUPATEN NDUGA'),
('9430', '94', 'KABUPATEN LANNY JAYA'),
('9431', '94', 'KABUPATEN MAMBERAMO TENGAH'),
('9432', '94', 'KABUPATEN YALIMO'),
('9433', '94', 'KABUPATEN PUNCAK'),
('9434', '94', 'KABUPATEN DOGIYAI'),
('9435', '94', 'KABUPATEN INTAN JAYA'),
('9436', '94', 'KABUPATEN DEIYAI'),
('9471', '94', 'KOTA JAYAPURA');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `users_id` int(11) NOT NULL,
  `inscurance_price` int(11) NOT NULL,
  `shipping_price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `transaction_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `users_id`, `inscurance_price`, `shipping_price`, `total_price`, `transaction_status`, `payment_image`, `deleted_at`, `created_at`, `updated_at`, `code`) VALUES
(17, 5, 0, 0, 35, 'PENDING', NULL, NULL, '2021-04-08 15:45:30', '2021-04-08 15:45:30', 'STORE-471'),
(18, 5, 0, 0, 70, 'SHIPPING', NULL, NULL, '2021-04-08 16:06:30', '2021-04-09 01:26:46', 'STORE-394'),
(19, 5, 0, 0, 35, 'PENDING', NULL, NULL, '2021-04-11 02:44:46', '2021-04-11 02:44:46', 'STORE-50'),
(20, 5, 0, 0, 35, 'PENDING', NULL, NULL, '2021-04-11 15:35:13', '2021-04-11 15:35:13', 'STORE-998'),
(21, 5, 0, 0, 70, 'PENDING', NULL, NULL, '2021-04-11 15:57:22', '2021-04-11 15:57:22', 'STORE-253'),
(22, 5, 0, 0, 35, 'PENDING', NULL, NULL, '2021-04-11 16:01:57', '2021-04-11 16:01:57', 'STORE-212'),
(23, 5, 0, 0, 35, 'PENDING', NULL, NULL, '2021-04-11 16:08:10', '2021-04-11 16:08:10', 'STORE-390'),
(24, 5, 0, 0, 35, 'SUCCESS', NULL, NULL, '2021-04-11 16:26:08', '2021-04-11 16:29:39', 'STORE-502'),
(25, 1, 0, 0, 3299000, 'SUCCESS', NULL, NULL, '2021-05-07 00:59:31', '2021-05-07 01:03:19', 'STORE-804'),
(29, 8, 0, 0, 5000000, 'SHIPPING', 'assets/payment/gN49fIEwIYUaVyzhx1vTLWf3YWkII8tYNteW2iOh.jpg', NULL, '2021-07-11 03:41:49', '2021-07-11 04:44:39', 'STORE-373'),
(32, 8, 0, 0, 3299000, 'SHIPPING', 'assets/payment/EQkEmjINyZvFpUa2FTDiECWaXjd2tuPJNNWYcIJ6.jpg', NULL, '2021-07-12 00:28:40', '2021-07-12 00:57:14', 'STORE-246'),
(33, 8, 0, 0, 350000, 'SUCCESS', 'assets/payment/qPfDksKf8gwfHAXEBCO5OoLqKyzOx2EV7CAR7hg1.jpg', NULL, '2021-07-12 05:56:43', '2021-07-12 05:58:41', 'STORE-91');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `resi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`id`, `transaction_id`, `products_id`, `price`, `created_at`, `updated_at`, `resi`, `shipping_status`, `code`) VALUES
(1, 1, 2, 1000, '2021-03-13 22:19:12', '2021-03-13 22:19:12', '', 'PENDING', 'TRX-696'),
(2, 1, 2, 1000, '2021-03-13 22:19:12', '2021-03-13 22:19:12', '', 'PENDING', 'TRX-686'),
(3, 2, 2, 1000, '2021-03-13 22:23:18', '2021-03-13 22:23:18', '', 'PENDING', 'TRX-871'),
(4, 2, 2, 1000, '2021-03-13 22:23:18', '2021-03-13 22:23:18', '', 'PENDING', 'TRX-188'),
(5, 4, 2, 1000, '2021-03-15 04:48:04', '2021-03-15 04:48:04', '', 'PENDING', 'TRX-30'),
(6, 5, 4, 120, '2021-03-15 04:48:44', '2021-03-15 04:48:44', '', 'PENDING', 'TRX-691'),
(7, 7, 5, 12123, '2021-03-15 07:54:11', '2021-03-15 07:54:11', '', 'PENDING', 'TRX-72'),
(8, 8, 4, 120, '2021-03-16 23:51:42', '2021-03-16 23:51:42', '', 'PENDING', 'TRX-541'),
(9, 9, 2, 1000, '2021-03-16 23:54:58', '2021-03-16 23:54:58', '', 'PENDING', 'TRX-464'),
(10, 10, 2, 1000, '2021-03-18 08:34:48', '2021-03-18 08:34:48', '', 'PENDING', 'TRX-126'),
(11, 11, 4, 120, '2021-03-20 23:49:42', '2021-03-20 23:49:42', '', 'PENDING', 'TRX-775'),
(12, 12, 8, 8, '2021-03-21 01:05:34', '2021-03-21 01:05:34', '', 'PENDING', 'TRX-502'),
(13, 13, 11, 9, '2021-03-24 10:53:36', '2021-03-24 10:53:36', '', 'PENDING', 'TRX-415'),
(14, 14, 11, 9, '2021-03-24 11:15:00', '2021-03-24 11:15:00', '', 'PENDING', 'TRX-144'),
(15, 15, 11, 9, '2021-03-25 02:00:26', '2021-03-25 02:00:26', '', 'PENDING', 'TRX-864'),
(16, 16, 11, 9, '2021-03-25 04:26:08', '2021-03-25 04:26:08', '', 'PENDING', 'TRX-482'),
(17, 17, 12, 35, '2021-04-08 15:45:30', '2021-04-08 15:45:30', '', 'PENDING', 'TRX-757'),
(18, 18, 12, 35, '2021-04-08 16:06:30', '2021-04-08 16:06:30', '', 'PENDING', 'TRX-909'),
(19, 18, 12, 35, '2021-04-08 16:06:30', '2021-04-08 16:06:30', '', 'PENDING', 'TRX-7'),
(20, 19, 12, 35, '2021-04-11 02:44:46', '2021-04-11 02:44:46', '', 'PENDING', 'TRX-777'),
(21, 20, 12, 35, '2021-04-11 15:35:13', '2021-04-11 15:35:13', '', 'PENDING', 'TRX-788'),
(22, 21, 12, 35, '2021-04-11 15:57:22', '2021-04-11 15:57:22', '', 'PENDING', 'TRX-909'),
(23, 21, 12, 35, '2021-04-11 15:57:22', '2021-04-11 15:57:22', '', 'PENDING', 'TRX-237'),
(24, 22, 12, 35, '2021-04-11 16:01:57', '2021-04-11 16:01:57', '', 'PENDING', 'TRX-802'),
(25, 23, 12, 35, '2021-04-11 16:08:10', '2021-04-11 16:08:10', '', 'PENDING', 'TRX-101'),
(26, 24, 12, 35, '2021-04-11 16:26:08', '2021-04-11 16:26:08', '', 'PENDING', 'TRX-288'),
(27, 25, 16, 3299000, '2021-05-07 00:59:31', '2021-05-07 00:59:31', '', 'PENDING', 'TRX-654'),
(28, 26, 16, 3299000, '2021-05-10 00:45:11', '2021-05-10 00:45:11', '', 'PENDING', 'TRX-538'),
(29, 27, 12, 350000, '2021-07-08 16:51:19', '2021-07-08 16:51:19', '', 'PENDING', 'TRX-601'),
(30, 29, 22, 5000000, '2021-07-11 03:41:49', '2021-07-11 03:41:49', '', 'PENDING', 'TRX-185'),
(31, 30, 27, 2000000, '2021-07-11 06:58:13', '2021-07-11 06:58:13', '', 'PENDING', 'TRX-935'),
(32, 31, 27, 2000000, '2021-07-11 07:23:29', '2021-07-11 07:23:29', '', 'PENDING', 'TRX-664'),
(33, 32, 16, 3299000, '2021-07-12 00:28:40', '2021-07-12 00:28:40', '', 'PENDING', 'TRX-318'),
(34, 33, 12, 350000, '2021-07-12 05:56:43', '2021-07-12 05:56:43', '', 'PENDING', 'TRX-468'),
(35, 34, 27, 2000000, '2021-07-12 06:10:12', '2021-07-12 06:10:12', '', 'PENDING', 'TRX-37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_one` longtext COLLATE utf8mb4_unicode_ci,
  `address_two` longtext COLLATE utf8mb4_unicode_ci,
  `provinces_id` int(11) DEFAULT NULL,
  `regencies_id` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `store_status` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `address_one`, `address_two`, `provinces_id`, `regencies_id`, `zip_code`, `country`, `phone_number`, `store_name`, `categories_id`, `store_status`, `deleted_at`, `remember_token`, `created_at`, `updated_at`, `roles`) VALUES
(1, 'irfan', 'irfan@gmail.com', NULL, '$2y$10$JxYYeMOXKo0gii2FuWU8ZevhTlHr20IJJ/k5ssGNyCsqG9EtDHZJm', 'Jalan Banda', NULL, 32, 3213, 40304, 'Indonesia', '+628 1111 0090', NULL, NULL, NULL, NULL, NULL, '2021-03-04 00:54:52', '2021-05-07 00:59:31', 'ADMIN'),
(3, 'imam', 'imam@bre.id', NULL, '$2y$10$Mccnbcqgp1Lcd58EJfaIjuGct/WKIbAeF58jv3e2YgDJxN5AkYGWu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, '2021-03-06 22:55:45', '2021-03-06 22:55:45', 'USER'),
(4, 'nur', 'nur@gmail.com', NULL, '$2y$10$5f.6QzopD75blFyf.2qMfusMC17beJuL/VyfzABpY4EXO3Um20jWq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'funnns', 3, 1, NULL, NULL, '2021-03-06 23:54:02', '2021-03-06 23:54:02', 'USER'),
(5, 'Solihah Nurasiyah', 'solihah@gmail.com', NULL, '$2y$10$c6U6q1OELXt0pCkuwkWWEOyzTY2MdEMEPfekzpMFQmjrYx0L7bPye', 'Bantarujeg', NULL, 32, 3210, 40416, 'Indonesia', '081312031791', '', NULL, 1, NULL, NULL, '2021-03-18 08:34:08', '2021-04-11 16:01:57', 'ADMIN'),
(8, 'Adi Fitrianto', 'tes123@gmail.com', NULL, '$2y$10$39UnSit3aZ5VmDnLoyifjOTzkbH4207b7M60GPWUDxL1vmC/nKRrC', 'Jalan Banda', 'Blok C6 No. 40', 32, 3273, 40304, 'Indonesia', '+628 1111 0090', '', NULL, 1, NULL, NULL, '2021-07-11 01:25:17', '2021-07-12 00:28:40', 'ADMIN'),
(9, 'Dummy1', 'dummy@gmail.com', NULL, '$2y$10$zhAtqKS5xeZLj4Dz.4o/lOyS8kiO2J.wxHoKU.i8LEpZ4JLUGA1JS', 'Jalan Banda', 'Blok C6 No. 40', 32, 3273, 40304, 'Indonesia', '+628 1111 0090', '', NULL, 1, NULL, NULL, '2021-07-12 06:09:48', '2021-07-12 06:10:12', 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `villages`
--

CREATE TABLE `villages` (
  `id` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD KEY `districts_regency_id_foreign` (`regency_id`),
  ADD KEY `districts_id_index` (`id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_galleries`
--
ALTER TABLE `product_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD KEY `provinces_id_index` (`id`);

--
-- Indexes for table `regencies`
--
ALTER TABLE `regencies`
  ADD KEY `regencies_province_id_foreign` (`province_id`),
  ADD KEY `regencies_id_index` (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `villages`
--
ALTER TABLE `villages`
  ADD KEY `villages_district_id_foreign` (`district_id`),
  ADD KEY `villages_id_index` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_galleries`
--
ALTER TABLE `product_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_regency_id_foreign` FOREIGN KEY (`regency_id`) REFERENCES `regencies` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `regencies`
--
ALTER TABLE `regencies`
  ADD CONSTRAINT `regencies_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `villages`
--
ALTER TABLE `villages`
  ADD CONSTRAINT `villages_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
