-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 31 May 2017, 22:47:36
-- Sunucu sürümü: 10.0.31-MariaDB
-- PHP Sürümü: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `u468859311_dataa_test_shopping`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `deleteAddress` (IN `adr_ID` INT)  NO SQL
DELETE FROM address
WHERE addressID=adr_ID$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `deleteCard` (IN `id` INT)  NO SQL
DELETE FROM card
WHERE cardID=id$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `editAuthority` (IN `id` INT, IN `authority` INT)  NO SQL
UPDATE user set userType = authority WHERE userID = id$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `getAddresses` (IN `id` INT)  NO SQL
select address.* from user_address, address where user_address.addressID = address.addressID AND user_address.userID = id$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `getCards` (IN `id` INT(11))  NO SQL
select card.* from user_card, card where user_card.cardID = card.cardID AND user_card.userID = id$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `getLogs` ()  NO SQL
select logs.* , user.userName FROM logs,user where user.userID = logs.userID$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `getMessages` ()  NO SQL
SELECT message.*, user.userName FROM message, user WHERE user.userID = message.userID$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `getOrder` (IN `id` INT)  NO SQL
select order_product.* from orders, order_product 
where order_product.orderID = orders.orderID AND order_product.orderID = id$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `getOrders` ()  NO SQL
SELECT orders.*,user.userName, user.name, user.surname, address.country, address.city, address.town FROM orders, user, address WHERE orders.addressID = address.addressID AND orders.userID = user.userID$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `getUser` (IN `id` INT)  NO SQL
select * from user where userID = id$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `getUsers` (IN `word` VARCHAR(50))  NO SQL
select * from user where userName LIKE CONCAT('%',word,'%')$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `insertNewAddress` (IN `pUserID` INT, IN `pAddressID` INT, IN `pAddressName` VARCHAR(20), IN `pCountry` VARCHAR(200), IN `pCity` VARCHAR(200), IN `pTown` VARCHAR(200), IN `pDetail` TEXT)  NO SQL
BEGIN
START TRANSACTION;
   INSERT INTO address(addressName, country, city, town, detail) 
   VALUES(pAddressName, pCountry, pCity, pTown, pDetail);

   INSERT INTO user_address 
   VALUES(pUserID, pAddressID);
COMMIT;
END$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `insertNewCard` (IN `pUserID` INT, IN `id` INT, IN `pcardName` VARCHAR(100), IN `pcardNo` VARCHAR(20), IN `pCVC` VARCHAR(3), IN `pexpirationMonth` INT, IN `pexpirationYear` INT, IN `pownerName` VARCHAR(200), IN `pownerSurname` VARCHAR(200))  NO SQL
BEGIN
START TRANSACTION;
   INSERT INTO card(cardName, cardNo, cvc, expirationMonth, expirationYear, ownerName, ownerSurname) 
   VALUES(pcardName, pcardNo, pCVC, pexpirationMonth, pexpirationYear, pownerName, pownerSurname);

   INSERT INTO user_card 
   VALUES(pUserID, id);
COMMIT;
END$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `insertUser` (IN `param_userName` VARCHAR(200), IN `param_password` VARCHAR(200), IN `param_name` VARCHAR(200), IN `param_surname` VARCHAR(200), IN `param_identification` VARCHAR(11), IN `param_birthday` DATE, IN `param_gender` VARCHAR(10), IN `param_phoneNumber` VARCHAR(15), IN `param_userType` INT(11), IN `param_email` VARCHAR(200))  NO SQL
INSERT INTO user (userName,password,name,surname,identification,birthday,gender,phoneNumber,userType,email) VALUES (param_userName,param_password,param_name,param_surname,param_identification,param_birthday,param_gender,param_phoneNumber,param_userType,param_email)$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `loginUser` (IN `usern` VARCHAR(200), IN `pass` VARCHAR(200))  NO SQL
SELECT * FROM user WHERE userName=usern AND password=pass$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `updateAddress` (IN `adr_ID` INT, IN `adr_name` VARCHAR(20), IN `adr_country` VARCHAR(200), IN `adr_city` VARCHAR(200), IN `adr_town` VARCHAR(200), IN `adr_detail` TEXT)  NO SQL
UPDATE address SET addressName=adr_name,
country=adr_country,
city=adr_city,
town=adr_town,
detail=adr_detail
WHERE addressID = adr_ID$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `updatePassword` (IN `id` INT, IN `pass` VARCHAR(200))  NO SQL
UPDATE user SET password = pass WHERE userID = id$$

CREATE DEFINER=`u468859311_dataa`@`localhost` PROCEDURE `updateUserBasicInfo` (IN `id` INT, IN `pname` VARCHAR(200), IN `psurname` VARCHAR(200), IN `pbirthday` DATE, IN `pgender` VARCHAR(10), IN `pemail` VARCHAR(200), IN `pphoneNumber` VARCHAR(15))  NO SQL
UPDATE user SET name = pname, surname=psurname, birthday = pbirthday, gender= pgender, email = pemail, phoneNumber = pphoneNumber WHERE userID = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `address`
--

CREATE TABLE `address` (
  `addressID` int(11) NOT NULL,
  `addressName` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `country` varchar(200) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `city` varchar(200) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `town` varchar(200) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `address`
--

INSERT INTO `address` (`addressID`, `addressName`, `country`, `city`, `town`, `detail`) VALUES
(1, 'kestel', 'Türkiye', 'Bursa', 'Kestel', 'Vani Mehmet Mah. ,Aşağı Sokak, No 999;'),
(8, 'cascsa', 'cascas', 'ascasc', 'ascasc', 'ascascasc'),
(2, 'adress2', 'Türkiye', 'İzmir', 'Buca', 'hooopss...');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `basket`
--

CREATE TABLE `basket` (
  `userID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `basket`
--

INSERT INTO `basket` (`userID`, `productID`, `quantity`) VALUES
(7, 14432, 1),
(14, 14436, 1);

--
-- Tetikleyiciler `basket`
--
DELIMITER $$
CREATE TRIGGER `logs_adding_basket` AFTER INSERT ON `basket` FOR EACH ROW BEGIN
INSERT INTO logs VALUES (NEW.userID, CONCAT('Product is inserted to basket. Product ID: ',NEW.productID,' Quantity: ', NEW.quantity), SYSDATE());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logs_deleting_basket` AFTER DELETE ON `basket` FOR EACH ROW BEGIN
INSERT INTO logs VALUES (OLD.userID, CONCAT('Product was deleted from the basket. Product No: ',OLD.productID), SYSDATE());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logs_updating_basket` AFTER UPDATE ON `basket` FOR EACH ROW BEGIN
INSERT INTO logs VALUES (NEW.userID, CONCAT('Basket is updated. Product No: ',NEW.productID, ' Quantity: ',NEW.quantity), SYSDATE());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `card`
--

CREATE TABLE `card` (
  `cardID` int(11) NOT NULL,
  `cardName` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `cardNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `expirationMonth` int(2) NOT NULL,
  `expirationYear` int(2) NOT NULL,
  `CVC` varchar(4) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `ownerName` varchar(100) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `ownerSurname` varchar(100) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `card`
--

INSERT INTO `card` (`cardID`, `cardName`, `cardNo`, `expirationMonth`, `expirationYear`, `CVC`, `ownerName`, `ownerSurname`) VALUES
(1, 'İşbank', '3333333333333333', 1, 21, '333', 'engin', 'kırklar'),
(2, 'ziraat', '3535353535353535', 1, 21, '353', 'engin', 'kırklar'),
(6, 'kart', '2222222222222222', 2, 22, '222', 'asd', 'asd');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `logs`
--

CREATE TABLE `logs` (
  `userID` int(11) NOT NULL,
  `activities` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `logs`
--


-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `message`
--

CREATE TABLE `message` (
  `userID` int(11) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `date` date NOT NULL,
  `addressID` int(11) NOT NULL,
  `cardID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`orderID`, `userID`, `totalPrice`, `date`, `addressID`, `cardID`) VALUES
(64, 7, 850, '2017-05-31', 1, 0),
(66, 7, 6250, '2017-05-31', 1, 0),
(67, 7, 850, '2017-05-31', 1, 0),
(68, 1, 7000, '2017-05-31', 46, 0),
(69, 1, 850, '2017-05-31', 46, 0),
(70, 1, 850, '2017-05-31', 46, 0),
(88, 1, 3500, '2017-05-31', 46, 0),
(89, 7, 1200, '2017-05-31', 1, 0),
(90, 7, 1200, '2017-05-31', 1, 0),
(91, 7, 1200, '2017-05-31', 1, 0),
(92, 7, 1200, '2017-05-31', 1, 0),
(93, 7, 850, '2017-05-31', 1, 0),
(94, 1, 600, '2017-05-31', 46, 0);

--
-- Tetikleyiciler `orders`
--
DELIMITER $$
CREATE TRIGGER `logs_taken_orders` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
INSERT INTO logs VALUES (NEW.userID, CONCAT('Order is taken. Order No: ',NEW.orderID, ' Address ID: ',NEW.addressID,' Total Price: ',NEW.totalPrice), SYSDATE());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_cargo`
--

CREATE TABLE `order_cargo` (
  `orderID` int(11) NOT NULL,
  `trackingNo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `order_cargo`
--

INSERT INTO `order_cargo` (`orderID`, `trackingNo`) VALUES
(64, 1880029),
(64, 1880030),
(66, 1880031),
(67, 1880032),
(68, 1880033),
(69, 1880034),
(70, 1880035),
(71, 1880036),
(72, 1880037),
(73, 1880038),
(74, 1880039),
(75, 1880040),
(76, 1880041),
(77, 1880042),
(78, 1880043),
(79, 1880044),
(80, 1880045),
(81, 1880046),
(82, 1880047),
(83, 1880048),
(84, 1880049),
(85, 1880050),
(86, 1880051),
(87, 1880052),
(88, 1880053),
(89, 1880054),
(90, 1880055),
(91, 1880056),
(92, 1880057),
(93, 1880058),
(94, 1880059);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_product`
--

CREATE TABLE `order_product` (
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '1',
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `order_product`
--

INSERT INTO `order_product` (`orderID`, `productID`, `amount`, `price`) VALUES
(64, 14432, 1, 850),
(66, 14414, 3, 1800),
(66, 14432, 1, 850),
(67, 14432, 1, 850),
(68, 14433, 2, 3500),
(69, 14432, 1, 850),
(70, 14432, 1, 850),
(71, 14414, 1, 1800),
(71, 14432, 1, 850),
(72, 14414, 1, 1800),
(73, 14414, 5, 1800),
(74, 14414, 1, 1800),
(75, 14414, 1, 1800),
(76, 14414, 1, 1800),
(77, 14414, 1, 1800),
(78, 14414, 1, 1800),
(79, 14432, 5, 850),
(80, 14433, 2, 3500),
(81, 14433, 1, 3500),
(82, 14432, 1, 850),
(83, 14432, 1, 850),
(85, 14432, 1, 850),
(86, 14414, 1, 1800),
(87, 14433, 1, 3500),
(88, 14433, 1, 3500),
(89, 14434, 2, 600),
(93, 14432, 1, 850),
(94, 14434, 1, 600);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `userName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `identification` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phoneNumber` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userType` int(11) NOT NULL DEFAULT '1',
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`userID`, `userName`, `password`, `name`, `surname`, `identification`, `birthday`, `gender`, `phoneNumber`, `userType`, `email`) VALUES
(1, 'engin', '123', 'engin', 'kırklar', '25393057554', '1994-11-11', 'Male', '0555555555', 2, 'saasd@asdas.comw'),
(7, 'fehmi', '123456', 'fehmi', 'özkaner', '99999999999', '0000-00-00', 'Male', '5315315555', 2, 'oz@hotmail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_address`
--

CREATE TABLE `user_address` (
  `userID` int(11) NOT NULL,
  `addressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `user_address`
--

INSERT INTO `user_address` (`userID`, `addressID`) VALUES
(7, 8),
(1, 1),
(1, 2);

--
-- Tetikleyiciler `user_address`
--
DELIMITER $$
CREATE TRIGGER `logs_adding_address` AFTER INSERT ON `user_address` FOR EACH ROW BEGIN
INSERT INTO logs VALUES (NEW.userID, CONCAT('Address was added. New Address ID: ',NEW.addressID), SYSDATE());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_card`
--

CREATE TABLE `user_card` (
  `userID` int(11) NOT NULL,
  `cardID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `user_card`
--

INSERT INTO `user_card` (`userID`, `cardID`) VALUES
(1, 1),
(1, 2),
(7, 6);

--
-- Tetikleyiciler `user_card`
--
DELIMITER $$
CREATE TRIGGER `logs_adding_card` AFTER INSERT ON `user_card` FOR EACH ROW BEGIN

INSERT INTO logs VALUES (NEW.userID, CONCAT('New Card is Added. Card ID: ',NEW.cardID), SYSDATE());
END
$$
DELIMITER ;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressID`);

--
-- Tablo için indeksler `basket`
--
ALTER TABLE `basket`
  ADD KEY `userID` (`userID`);

--
-- Tablo için indeksler `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`cardID`);

--
-- Tablo için indeksler `message`
--
ALTER TABLE `message`
  ADD KEY `userID` (`userID`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `addressID` (`addressID`),
  ADD KEY `cardID` (`cardID`);

--
-- Tablo için indeksler `order_product`
--
ALTER TABLE `order_product`
  ADD KEY `orderID` (`orderID`);

--
-- Tablo için indeksler `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `identification` (`identification`),
  ADD UNIQUE KEY `phoneNumber` (`phoneNumber`);

--
-- Tablo için indeksler `user_address`
--
ALTER TABLE `user_address`
  ADD KEY `userID` (`userID`),
  ADD KEY `adressID` (`addressID`);

--
-- Tablo için indeksler `user_card`
--
ALTER TABLE `user_card`
  ADD KEY `userID` (`userID`),
  ADD KEY `cardID` (`cardID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `address`
--
ALTER TABLE `address`
  MODIFY `addressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- Tablo için AUTO_INCREMENT değeri `card`
--
ALTER TABLE `card`
  MODIFY `cardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- Tablo için AUTO_INCREMENT değeri `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Tablo kısıtlamaları `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`);

--
-- Tablo kısıtlamaları `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_address_ibfk_2` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `user_card`
--
ALTER TABLE `user_card`
  ADD CONSTRAINT `user_card_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_card_ibfk_2` FOREIGN KEY (`cardID`) REFERENCES `card` (`cardID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
