-- --------------------------------------------------------
-- 主機:                           localhost
-- 伺服器版本:                        10.4.28-MariaDB - mariadb.org binary distribution
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

-- 傾印  資料表 fantasy_universe.game_date 結構
CREATE TABLE IF NOT EXISTS `game_date` (
  `game_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `img` char(50) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT 0,
  `sale_price` int(11) NOT NULL DEFAULT 0,
  `tage` char(50) DEFAULT NULL,
  `slot` char(50) DEFAULT NULL,
  `date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.game_date 的資料：~1 rows (近似值)
INSERT INTO `game_date` (`game_id`, `name`, `img`, `price`, `sale_price`, `tage`, `slot`, `date`) VALUES
	(1, '冰與火之舞', 'abc.jpg', 123, 100, '單人, 音樂', '這是一款考驗你的節奏感遊戲', '2024-06-04');

-- 傾印  資料表 fantasy_universe.sale_data 結構
CREATE TABLE IF NOT EXISTS `sale_data` (
  `game_name` char(50) NOT NULL,
  `sale` int(11) NOT NULL DEFAULT 0,
  `stat` float DEFAULT NULL,
  `comment_num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`game_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.sale_data 的資料：~1 rows (近似值)
INSERT INTO `sale_data` (`game_name`, `sale`, `stat`, `comment_num`) VALUES
	('冰與火之舞', 12345, 4.4, 0);

-- 傾印  資料表 fantasy_universe.user_data 結構
CREATE TABLE IF NOT EXISTS `user_data` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL DEFAULT '',
  `sex` char(3) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `permission` int(2) NOT NULL DEFAULT 1,
  `date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.user_data 的資料：~1 rows (近似值)
INSERT INTO `user_data` (`user_id`, `name`, `sex`, `birthday`, `account`, `password`, `permission`, `date`) VALUES
	(1, '凱薩', '男', '2013-06-04', 'cisco', 'cisco', 0, '2024-06-04');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
