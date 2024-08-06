-- --------------------------------------------------------
-- 主機:                           127.0.0.1
-- 伺服器版本:                        10.4.32-MariaDB - mariadb.org binary distribution
-- 伺服器作業系統:                      Win64
-- HeidiSQL 版本:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 傾印 fantasy_universe 的資料庫結構
CREATE DATABASE IF NOT EXISTS `fantasy_universe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `fantasy_universe`;

-- 傾印  資料表 fantasy_universe.user_data 結構
CREATE TABLE IF NOT EXISTS `user_data` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL DEFAULT '',
  `email` varchar(50) DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  `password` char(100) NOT NULL DEFAULT '0',
  `sex` tinyint(2) DEFAULT 2,
  `birthday` date DEFAULT NULL,
  `phone` char(12) DEFAULT NULL,
  `permission` tinyint(2) NOT NULL DEFAULT 2 COMMENT '特權',
  `date` date NOT NULL DEFAULT "0000-00-00",
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.user_data 的資料：~4 rows (近似值)
INSERT INTO `user_data` (`user_id`, `name`, `email`, `account`, `password`, `sex`, `birthday`, `phone`, `permission`, `date`) VALUES
	(1, '凱薩', 'cherhorn@gmail.com', 'cisco', '$2y$10$F2.uBZ26xxG4tk.f09WD5OvwNi4EtJBXhkGFVy.KmLWBqUxchLmKm', 2, '2001-05-12', '0123456789', 0, '2024-06-23'),
	(2, 'asd', 'asd@gmail.com', 'asd', '$2y$10$xNWHpNCgZPD6QFuen5MB6OnXKoUYVCiChXuzDg0E9txvaLJPm1HRK', 2, '0000-00-00', '', 2, '2024-07-21'),
	(3, 'asd01', 'asd01@gmail.com', 'asd01', '$2y$10$/bRSVCGD/auwc54J/vGkiOwOjagS08DBLv6gKLs4Zmub4uIAniu32', 2, '0000-00-00', '', 2, '2024-07-21'),
	(4, 'xxxasd', '45668@gmail.com', 'asdasd001', '$2y$10$nPjhuUlFILzoJFS6CJIjuuejSuQooeVQ0BvdrsU5Qpv6zH2Ee.e6a', 2, '2024-07-10', '', 2, '2024-07-27');


-- 傾印  資料表 fantasy_universe.game_date 結構
CREATE TABLE IF NOT EXISTS `game_date` (
  `game_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '製作人',
  `name` varchar(200) NOT NULL DEFAULT '',
  `price` int(6) NOT NULL DEFAULT 0 COMMENT '價格',
  `sale_price` int(6) NOT NULL DEFAULT 0 COMMENT '特價',
  `files` varchar(200) DEFAULT NULL COMMENT '安裝檔',
  `date` date NOT NULL DEFAULT "0000-00-00" COMMENT '上市日期',
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.game_date 的資料：~0 rows (近似值)
INSERT INTO `game_date` (`game_id`, `user_id`, `name`, `price`, `sale_price`, `files`, `date`) VALUES
	(1, 1, '冰與火之舞', 123, 100, NULL, '2024-06-04');

-- 傾印  資料表 fantasy_universe.comments 結構
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL COMMENT '留言',
  `reply` bigint(20) DEFAULT 0 COMMENT '回覆',
  `date_time` timestamp NULL DEFAULT current_timestamp() COMMENT '回覆日期時間',
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_comments_game_date` FOREIGN KEY (`game_id`) REFERENCES `game_date` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_comments_user_data` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.comments 的資料：~0 rows (近似值)

-- 傾印  資料表 fantasy_universe.game_article_data 結構
CREATE TABLE IF NOT EXISTS `game_article_data` (
  `game_id` bigint(20) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `system` varchar(100) DEFAULT NULL,
  `cpu` varchar(100) DEFAULT NULL,
  `ram` char(10) DEFAULT NULL,
  `display_card` varchar(100) DEFAULT NULL,
  `directX` char(12) DEFAULT NULL,
  `rom` char(10) DEFAULT NULL,
  `date` date DEFAULT "0000-00-00",
  KEY `game_id` (`game_id`),
  CONSTRAINT `FK_game_article_data_game_date` FOREIGN KEY (`game_id`) REFERENCES `game_date` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.game_article_data 的資料：~0 rows (近似值)


-- 傾印  資料表 fantasy_universe.photo_data 結構
CREATE TABLE IF NOT EXISTS `photo_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `folder` varchar(200) NOT NULL DEFAULT '0' COMMENT '資料夾',
  `name` varchar(200) NOT NULL DEFAULT '0' COMMENT '檔名',
  `game_id` bigint(20) NOT NULL DEFAULT 0,
  `game_article` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK__game_date` (`game_id`),
  CONSTRAINT `FK__game_date` FOREIGN KEY (`game_id`) REFERENCES `game_date` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.photo_data 的資料：~0 rows (近似值)

-- 傾印  資料表 fantasy_universe.sale_data 結構
CREATE TABLE IF NOT EXISTS `sale_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL DEFAULT 0,
  `sale` int(11) NOT NULL DEFAULT 0 COMMENT '銷售量',
  `stat` float DEFAULT NULL COMMENT '評分',
  `comment_num` int(11) NOT NULL DEFAULT 0 COMMENT '留言數',
  PRIMARY KEY (`id`),
  KEY `game_name` (`game_id`) USING BTREE,
  CONSTRAINT `FK_sale_data_game_date` FOREIGN KEY (`game_id`) REFERENCES `game_date` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.sale_data 的資料：~0 rows (近似值)
INSERT INTO `sale_data` (`id`, `game_id`, `sale`, `stat`, `comment_num`) VALUES
	(1, 1, 12345, 4.4, 0);

-- 傾印  資料表 fantasy_universe.shop_cart_data 結構
CREATE TABLE IF NOT EXISTS `shop_cart_data` (
  `game_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date` date DEFAULT "0000-00-00",
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_shop_cart_data_game_date` FOREIGN KEY (`game_id`) REFERENCES `game_date` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.shop_cart_data 的資料：~0 rows (近似值)

-- 傾印  資料表 fantasy_universe.shop_his_data 結構
CREATE TABLE IF NOT EXISTS `shop_his_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL DEFAULT 0,
  `user_id` bigint(20) NOT NULL DEFAULT 0,
  `star` tinyint(4) DEFAULT NULL,
  `date` date NOT NULL DEFAULT "0000-00-00",
  PRIMARY KEY (`id`),
  KEY `FK_shop_his_data_game_date` (`game_id`),
  CONSTRAINT `FK_shop_his_data_game_date` FOREIGN KEY (`game_id`) REFERENCES `game_date` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.shop_his_data 的資料：~0 rows (近似值)


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
