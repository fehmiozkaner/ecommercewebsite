-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 31 May 2017, 22:50:48
-- Sunucu sürümü: 10.0.31-MariaDB
-- PHP Sürümü: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `bilisimarsivi_test_supplier`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `accounting`
--

CREATE TABLE `accounting` (
  `id` int(11) NOT NULL,
  `cash` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `accounting`
--

INSERT INTO `accounting` (`id`, `cash`) VALUES
(0, '9962060.00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(5, 'Computer'),
(13, 'Telephone'),
(14, 'Television'),
(15, 'falanfilan');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cat_properties`
--

CREATE TABLE `cat_properties` (
  `properties_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `properties` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `cat_properties`
--

INSERT INTO `cat_properties` (`properties_id`, `cat_id`, `properties`) VALUES
(34, 5, 'Ram'),
(35, 5, 'Hd'),
(36, 5, 'Processor'),
(37, 5, 'Video Card'),
(38, 5, 'Case Type'),
(39, 13, 'Brand'),
(40, 13, 'Model'),
(41, 13, 'Touch'),
(42, 13, '4G'),
(43, 14, 'Brand'),
(44, 14, 'Screen Size'),
(45, 14, '3D Support'),
(46, 14, 'Smart TV Support'),
(49, 15, 'a'),
(50, 15, 'c');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `customer_temp`
--

CREATE TABLE `customer_temp` (
  `customer_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `identity` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `customer_temp`
--

INSERT INTO `customer_temp` (`customer_id`, `name`, `surname`, `phone`, `identity`) VALUES
(1, 'Osman', 'Kutlu', '0555555555', '12345678912'),
(7, 'Soner', 'ÖZ', '2333333333', '98765432121'),
(14, 'ilhan', 'Gulsever', '5315555565', '12562856412');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `log`
--

CREATE TABLE `log` (
  `user_id` varchar(100) NOT NULL,
  `action` varchar(500) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `log`
--

INSERT INTO `log` (`user_id`, `action`, `date`) VALUES
('ilhan', ' submit store product :product no:14414', '2017-05-31 02:50:21'),
('ilhan', ' submit store product :product no:14432', '2017-05-31 02:50:51'),
('ilhan', ' submit store product :product no:14433', '2017-05-31 02:50:58'),
('getSessi', '14414', '2017-05-31 02:51:52'),
('ilhan', 'add product:Product name telefon sat?t?l?k', '2017-05-31 07:05:31'),
('ilhan', 'add or  update product value name: samsung', '2017-05-31 07:05:31'),
('ilhan', 'add or  update product value name: s8', '2017-05-31 07:05:31'),
('ilhan', 'add or  update product value name: yes', '2017-05-31 07:05:31'),
('ilhan', 'add or  update product value name: yes', '2017-05-31 07:05:31'),
('ilhan', ' submit store product :product no:14434', '2017-05-31 07:05:37'),
('ilhan', 'add product:Product name yen???', '2017-05-31 07:24:03'),
('ilhan', 'add or  update product value name: s3', '2017-05-31 07:24:03'),
('ilhan', 'add or  update product value name: samsung', '2017-05-31 07:24:03'),
('ilhan', 'add or  update product value name: yes', '2017-05-31 07:24:03'),
('ilhan', 'add or  update product value name: yes', '2017-05-31 07:24:03'),
('ilhan', ' submit store product :product no:14435', '2017-05-31 07:27:06'),
('ilhan', 'edit user :name meltems', '2017-05-31 07:29:07'),
('recep', 'edit user :name meltem', '2017-05-31 07:29:42'),
('recep', 'new category :trfhgfhfhgfgh', '2017-05-31 07:30:00'),
('recep', 'add category  properties: a', '2017-05-31 07:30:18'),
('recep', 'add category  properties: b', '2017-05-31 07:30:18'),
('recep', 'add category  properties: a', '2017-05-31 07:30:31'),
('recep', 'add category  properties: c', '2017-05-31 07:30:31'),
('recep', 'add product:Product name nbjj', '2017-05-31 07:31:39'),
('recep', 'add or  update product value name: bvb ', '2017-05-31 07:31:39'),
('recep', 'add or  update product value name: bvbv', '2017-05-31 07:31:39'),
('recep', ' submit store product :product no:14436', '2017-05-31 07:31:48');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_info`
--

CREATE TABLE `product_info` (
  `product_no` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_price` float NOT NULL,
  `sell_price` float NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `product_info`
--

INSERT INTO `product_info` (`product_no`, `name`, `image`, `purchase_price`, `sell_price`, `cat_id`) VALUES
(14414, 'PC', 'indir (1).jpg', 1200, 1800, 5),
(14432, 'air telephone', 'z5.png', 500, 850, 13),
(14433, 'Full HD', 'indir.jpg', 2500, 3500, 14),
(14434, 'telefon satıtılık', 'v2-84188_medium.jpg', 500, 600, 13),
(14435, 'yenııı', 'v2-84188_medium.jpg', 800, 600, 13),
(14436, 'nbjj', 'v2-84188_medium.jpg', 20, 60, 15);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_purchase`
--

CREATE TABLE `product_purchase` (
  `product_no` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `product_purchase`
--

INSERT INTO `product_purchase` (`product_no`, `amount`, `total`, `purchase_date`) VALUES
(14414, 16, '19200.00', '2017-05-31'),
(14432, 15, '7500.00', '2017-05-31'),
(14433, 15, '37500.00', '2017-05-31'),
(14434, 12, '6000.00', '2017-05-31'),
(14435, 3, '2400.00', '2017-05-31'),
(14436, 2, '40.00', '2017-05-31');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_sell`
--

CREATE TABLE `product_sell` (
  `product_no` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `sell_date` date NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `product_sell`
--

INSERT INTO `product_sell` (`product_no`, `amount`, `total`, `sell_date`, `customer_id`) VALUES
(14433, 2, 7000, '2017-05-31', 14),
(14432, 1, 850, '2017-05-31', 7),
(14432, 1, 850, '2017-05-31', 7),
(14414, 3, 5400, '2017-05-31', 7),
(14432, 1, 850, '2017-05-31', 7),
(14432, 1, 850, '2017-05-31', 7),
(14433, 2, 7000, '2017-05-31', 14),
(14432, 1, 850, '2017-05-31', 14),
(14432, 1, 850, '2017-05-31', 14),
(14414, 1, 1800, '2017-05-31', 14),
(14432, 1, 850, '2017-05-31', 14),
(14414, 1, 1800, '2017-05-31', 14),
(14414, 5, 9000, '2017-05-31', 14),
(14414, 1, 1800, '2017-05-31', 14),
(14414, 1, 1800, '2017-05-31', 14),
(14414, 1, 1800, '2017-05-31', 14),
(14414, 1, 1800, '2017-05-31', 14),
(14414, 1, 1800, '2017-05-31', 14),
(14432, 5, 4250, '2017-05-31', 14),
(14433, 2, 7000, '2017-05-31', 14),
(14433, 1, 3500, '2017-05-31', 14),
(14432, 1, 850, '2017-05-31', 14),
(14432, 1, 850, '2017-05-31', 14),
(14432, 1, 850, '2017-05-31', 14),
(14414, 1, 1800, '2017-05-31', 14),
(14433, 1, 3500, '2017-05-31', 14),
(14433, 1, 3500, '2017-05-31', 14),
(14434, 2, 1200, '2017-05-31', 7),
(14432, 1, 850, '2017-05-31', 7),
(14434, 1, 600, '2017-05-31', 14);

--
-- Tetikleyiciler `product_sell`
--
DELIMITER $$
CREATE TRIGGER `IncreaseCash` AFTER INSERT ON `product_sell` FOR EACH ROW UPDATE accounting
 SET   cash=cash+NEW.total
        WHERE id=0
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_temp`
--

CREATE TABLE `product_temp` (
  `product_no` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `value_id` varchar(100) CHARACTER SET utf8 NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `purchase` decimal(10,2) NOT NULL,
  `sell` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tetikleyiciler `product_temp`
--
DELIMITER $$
CREATE TRIGGER `addProductInfo` AFTER INSERT ON `product_temp` FOR EACH ROW INSERT INTO product_info VALUES(NEW.product_no,NEW.product_name,NEW.image,NEW.purchase,NEW.sell,New.cat_id)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateProductInfo` AFTER UPDATE ON `product_temp` FOR EACH ROW UPDATE product_info
        SET   name=NEW.product_name ,image=NEW.image,purchase_price=NEW.purchase,	sell_price=NEW.sell
        WHERE product_no = NEW.product_no
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_temp_values`
--

CREATE TABLE `product_temp_values` (
  `value_id` varchar(100) CHARACTER SET utf8 NOT NULL,
  `properties_id` int(11) NOT NULL,
  `value` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Tablo döküm verisi `product_temp_values`
--

INSERT INTO `product_temp_values` (`value_id`, `properties_id`, `value`) VALUES
('154', 34, '4GB'),
('154', 35, '500GB'),
('154', 36, 'I7'),
('154', 37, 'NVIDIA GEFORCE GX550'),
('154', 38, 'TOWER'),
('716', 34, '4GB'),
('716', 35, '500GB'),
('716', 36, 'I7'),
('716', 37, 'NVIDIA GEFORCE GX550'),
('716', 38, 'TOWER'),
('847', 39, 'SONY'),
('847', 40, 'Z5'),
('847', 41, 'YES'),
('847', 42, 'YES'),
('140', 43, 'LG'),
('140', 44, '55 \"/ 140Cm'),
('140', 45, 'Yes'),
('140', 46, 'Yes'),
('577', 39, 'samsung'),
('577', 40, 's8'),
('577', 41, 'yes'),
('577', 42, 'yes'),
('206', 39, 's3'),
('206', 40, 'samsung'),
('206', 41, 'yes'),
('206', 42, 'yes'),
('646', 49, 'bvb '),
('646', 50, 'bvbv');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`id`, `name`, `password`) VALUES
(1, 'engin', '123'),
(9, 'recep', '123'),
(11, 'meltem', '123');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `accounting`
--
ALTER TABLE `accounting`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Tablo için indeksler `cat_properties`
--
ALTER TABLE `cat_properties`
  ADD PRIMARY KEY (`properties_id`),
  ADD KEY `FK_cat_id` (`cat_id`);

--
-- Tablo için indeksler `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`product_no`);

--
-- Tablo için indeksler `product_temp`
--
ALTER TABLE `product_temp`
  ADD PRIMARY KEY (`product_no`);

--
-- Tablo için indeksler `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Tablo için AUTO_INCREMENT değeri `cat_properties`
--
ALTER TABLE `cat_properties`
  MODIFY `properties_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- Tablo için AUTO_INCREMENT değeri `product_info`
--
ALTER TABLE `product_info`
  MODIFY `product_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14437;
--
-- Tablo için AUTO_INCREMENT değeri `product_temp`
--
ALTER TABLE `product_temp`
  MODIFY `product_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14437;
--
-- Tablo için AUTO_INCREMENT değeri `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `cat_properties`
--
ALTER TABLE `cat_properties`
  ADD CONSTRAINT `cat_properties_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
