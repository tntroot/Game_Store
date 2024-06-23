-- --------------------------------------------------------
-- 主機:                           localhost
-- 伺服器版本:                        10.4.32-MariaDB - mariadb.org binary distribution
-- 伺服器作業系統:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 傾印 fantasy_universe 的資料庫結構
CREATE DATABASE IF NOT EXISTS `fantasy_universe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `fantasy_universe`;

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
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

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
  `date` date DEFAULT curdate(),
  KEY `game_id` (`game_id`),
  CONSTRAINT `FK_game_article_data_game_date` FOREIGN KEY (`game_id`) REFERENCES `game_date` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.game_article_data 的資料：~0 rows (近似值)
/*!40000 ALTER TABLE `game_article_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_article_data` ENABLE KEYS */;

-- 傾印  資料表 fantasy_universe.game_date 結構
CREATE TABLE IF NOT EXISTS `game_date` (
  `game_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '製作人',
  `name` varchar(200) NOT NULL DEFAULT '',
  `price` int(6) NOT NULL DEFAULT 0 COMMENT '價格',
  `sale_price` int(6) NOT NULL DEFAULT 0 COMMENT '特價',
  `files` varchar(200) DEFAULT NULL COMMENT '安裝檔',
  `date` date NOT NULL DEFAULT curdate() COMMENT '上市日期',
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.game_date 的資料：~0 rows (近似值)
/*!40000 ALTER TABLE `game_date` DISABLE KEYS */;
INSERT INTO `game_date` (`game_id`, `user_id`, `name`, `price`, `sale_price`, `files`, `date`) VALUES
	(1, 1, '冰與火之舞', 123, 100, NULL, '2024-06-04');
/*!40000 ALTER TABLE `game_date` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `photo_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `photo_data` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `sale_data` DISABLE KEYS */;
INSERT INTO `sale_data` (`id`, `game_id`, `sale`, `stat`, `comment_num`) VALUES
	(1, 1, 12345, 4.4, 0);
/*!40000 ALTER TABLE `sale_data` ENABLE KEYS */;

-- 傾印  資料表 fantasy_universe.shop_cart_data 結構
CREATE TABLE IF NOT EXISTS `shop_cart_data` (
  `game_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date` date DEFAULT curdate(),
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_shop_cart_data_game_date` FOREIGN KEY (`game_id`) REFERENCES `game_date` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.shop_cart_data 的資料：~0 rows (近似值)
/*!40000 ALTER TABLE `shop_cart_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_cart_data` ENABLE KEYS */;

-- 傾印  資料表 fantasy_universe.shop_his_data 結構
CREATE TABLE IF NOT EXISTS `shop_his_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL DEFAULT 0,
  `user_id` bigint(20) NOT NULL DEFAULT 0,
  `star` float DEFAULT NULL,
  `date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`id`),
  KEY `FK_shop_his_data_game_date` (`game_id`),
  CONSTRAINT `FK_shop_his_data_game_date` FOREIGN KEY (`game_id`) REFERENCES `game_date` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.shop_his_data 的資料：~0 rows (近似值)
/*!40000 ALTER TABLE `shop_his_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_his_data` ENABLE KEYS */;

-- 傾印  資料表 fantasy_universe.user_data 結構
CREATE TABLE IF NOT EXISTS `user_data` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL DEFAULT '',
  `email` varchar(50) DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  `password` char(100) NOT NULL DEFAULT '0',
  `sex` char(3) DEFAULT '不透漏',
  `birthday` date DEFAULT NULL,
  `phone` char(12) DEFAULT NULL,
  `permission` int(2) NOT NULL DEFAULT 2 COMMENT '特權',
  `date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.user_data 的資料：~0 rows (近似值)
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
INSERT INTO `user_data` (`user_id`, `name`, `email`, `account`, `password`, `sex`, `birthday`, `phone`, `permission`, `date`) VALUES
	(1, '凱薩', 'cherhorn@gmail.com', 'cisco', '$2y$10$F2.uBZ26xxG4tk.f09WD5OvwNi4EtJBXhkGFVy.KmLWBqUxchLmKm', '不透漏', '2001-05-12', '0123456789', 2, '2024-06-23');
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
