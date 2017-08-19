-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 31 May 2017, 22:50:27
-- Sunucu sürümü: 10.0.31-MariaDB
-- PHP Sürümü: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `bilisimarsivi_test_store`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admins`
--

CREATE TABLE `admins` (
  `a_id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf16_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf16_unicode_ci NOT NULL,
  `authorization` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Tablo döküm verisi `admins`
--

INSERT INTO `admins` (`a_id`, `username`, `password`, `authorization`) VALUES
(1, 'admin', 'ttnet', 2),
(3, 'fehmi', '123', 1),
(4, 'engin', '123', 1),
(5, 'User', '123', 0);

--
-- Tetikleyiciler `admins`
--
DELIMITER $$
CREATE TRIGGER `add_admin` AFTER INSERT ON `admins` FOR EACH ROW INSERT logs VALUES("Admin is added", CURDATE(), NEW.username)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `process_name` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `process_date` date NOT NULL,
  `by_who` varchar(30) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Tablo döküm verisi `logs`
--



-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `o_id` varchar(10) COLLATE utf16_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cargo_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tracking_no` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`o_id`, `name`, `surname`, `cargo_status`, `tracking_no`) VALUES
('93', 'Soner', 'OZ', 'TrckNoDelShop', '1880058'),
('94', 'ilhan', 'Gulsever', 'TrckNoDelShop', '1880059');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`p_id`, `p_name`, `quantity`) VALUES
(14414, 'PC', 8),
(14432, 'air telephone', 3),
(14433, 'Full HD', 5),
(14434, 'telefon satıtılık', 7),
(14435, 'yenııı', 3),
(14436, 'daha yeni', 221);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_property`
--

CREATE TABLE `product_property` (
  `p_id` int(11) NOT NULL,
  `pr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Tablo döküm verisi `product_property`
--

INSERT INTO `product_property` (`p_id`, `pr_id`) VALUES
(14414, 27),
(14414, 28),
(14414, 29),
(14414, 30),
(14414, 31),
(14432, 23),
(14432, 24),
(14432, 25),
(14432, 26),
(14433, 19),
(14433, 20),
(14433, 21),
(14433, 22),
(14434, 32),
(14434, 33),
(14434, 25),
(14434, 26),
(14435, 34),
(14435, 35),
(14435, 25),
(14435, 26),
(14436, 36),
(14436, 37);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `properties`
--

CREATE TABLE `properties` (
  `pr_id` int(11) NOT NULL,
  `pr_name` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `pr_value` varchar(100) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Tablo döküm verisi `properties`
--

INSERT INTO `properties` (`pr_id`, `pr_name`, `pr_value`) VALUES
(13, 'intel', 'i7'),
(14, 'screen', '21inc'),
(15, 'Model', 'DFGDFG'),
(16, 'Marka', 'DFGDFG'),
(17, 'Model', '23'),
(18, 'Marka', 'DSFF'),
(19, 'Brand', 'LG'),
(20, 'Screen Size', '55 \"/ 140Cm'),
(21, '3D Support', 'Yes'),
(22, 'Smart TV Support', 'Yes'),
(23, 'Brand', 'SONY'),
(24, 'Model', 'Z5'),
(25, 'Touch', 'YES'),
(26, '4G', 'YES'),
(27, 'Ram', '4GB'),
(28, 'Hd', '500GB'),
(29, 'Processor', 'I7'),
(30, 'Video Card', 'NVIDIA GEFORCE GX550'),
(31, 'Case Type', 'TOWER'),
(32, 'Brand', 'samsung'),
(33, 'Model', 's8'),
(34, 'Brand', 's3'),
(35, 'Model', 'samsung'),
(36, 'a', 'bvb '),
(37, 'c', 'bvbv');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`a_id`);

--
-- Tablo için indeksler `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`o_id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`);

--
-- Tablo için indeksler `product_property`
--
ALTER TABLE `product_property`
  ADD KEY `p_id` (`p_id`),
  ADD KEY `pr_id` (`pr_id`);

--
-- Tablo için indeksler `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`pr_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admins`
--
ALTER TABLE `admins`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- Tablo için AUTO_INCREMENT değeri `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;
--
-- Tablo için AUTO_INCREMENT değeri `properties`
--
ALTER TABLE `properties`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `product_property`
--
ALTER TABLE `product_property`
  ADD CONSTRAINT `product_property_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
