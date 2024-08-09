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
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.comments 的資料：~0 rows (近似值)

-- 傾印  資料表 fantasy_universe.game_article_data 結構
CREATE TABLE IF NOT EXISTS `game_article_data` (
  `game_id` bigint(20) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `system` varchar(100) DEFAULT NULL COMMENT '系統',
  `cpu` varchar(100) DEFAULT NULL,
  `ram` char(10) DEFAULT NULL COMMENT '記憶體',
  `display_card` varchar(100) DEFAULT NULL,
  `directX` char(12) DEFAULT NULL COMMENT '顯示卡',
  `rom` char(10) DEFAULT NULL COMMENT '儲存空間',
  `date` date DEFAULT NULL COMMENT '上架時間',
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.game_article_data 的資料：~2 rows (近似值)
INSERT INTO `game_article_data` (`game_id`, `content`, `system`, `cpu`, `ram`, `display_card`, `directX`, `rom`, `date`) VALUES
	(7, 'Windows 版 Minecraft\r\n探索隨機產生的世界，建造各種令人讚嘆的事物，從最簡單的房屋到最宏偉的城堡都能實現。在創造模式中使用無限的資源，或在生存模式中深入挖掘世界，合成武器和護甲來抵禦危險生物。攀登陡峭的山脈，探索精緻的洞穴，並開採大型礦脈。探索蒼鬱洞窟和滴水石洞窟生態域。用蠟燭照亮你的世界，讓大家看看你是多高超的洞窟冒險者和登山大師！\r\n\r\n特色：\r\n- 只要想像得到，就能建造出來。在創造模式中活用你的想像力和無限資源。\r\n- 在生存模式中，你必在一天中與生物戰鬥、打造庇護所並探索環境，如此才有機會順利生存和發展。\r\n- 感謝我們的定期更新，提供各種新工具、地點和空間等你來探索。\r\n- 可跨平台遊玩，最多能讓八名玩家在 Windows、PlayStation、Nintendo、Xbox 和行動裝置上進行遊戲。Windows 版 Minecraft 還可在 Windows Mixed Reality 和 Oculus Rift 裝置上執行，且支援所有功能。\r\n- Slash 命令：調整遊戲玩法：可贈送物品、召喚生物、更改時間等。\r\n- 可在社群中尋找外觀、材質和混搭套件！造訪 minecraft.net/marketplace 了解更多資訊。\r\n- 加入免費大型多人伺服器，與數千名玩家一起遊玩！探索社群經營的廣闊世界，參加獨特的小遊戲，並在大廳中與眾多新朋友進行社交活動。\r\n- Windows 版的光線追蹤技術為 Minecraft 帶來了不同凡響的圖形體驗！透過逼真的光影變化、鮮豔的色彩、自然的水面反射和會發光的材質，體驗創作者所構築的世界。', '	Windows 10 版 19041.0 或更新版本', '	Intel Celeron J4105 | AMD FX-4100', '4G', 'Intel HD Graphics 4000 | AMD Radeon R5', '11', '2G', '2024-08-07'),
	(8, '《冰與火之舞》——高難度單鍵節奏遊戲。\r\n\r\n只需一個按鍵，控制盤旋飛舞的雙星，踏著搖曳的舞步，在一條跟隨音樂節奏變化的蜿蜒道路上不斷前進，探索音樂的宇宙。\r\n\r\n將節奏巧妙地使用可視的形式呈現出來。\r\n這將是一次充滿挑戰的音樂之旅，保持平穩的心態，跟隨內心的律動，這並不是一款依賴快速反應的遊戲，你需要通過反復練習來學習不同的音樂模式。\r\n你將與各種困難不期而遇，而每一次突破，都會帶來無與倫比的成就感。\r\n\r\n\r\n\r\n探索音樂宇宙：每一片星系都對應著一種截然不同的音樂類型，跟隨糾纏的雙星遊蕩在充滿美妙音樂的宇宙當中。\r\n可預判的機制： 你能通過識別前方的道路來預判即將迎來的音軌節奏。遊戲並不依賴快速反應，註意聆聽音樂，反復練習，掌控應對不同類型的節奏的操作。\r\n未來的音樂關卡將免費更新：我們會在遊戲發售後陸續更新更多新關卡，已經購買過遊戲的玩家無須為這些更新再次付費。但遊戲的售價可能會隨著更新有所提升。\r\n支持延遲校準：既可以隨時通過按鍵手動校準，也可以使用我們的自動校準功能。作為音樂創作者，我們非常了解音軌不同步會極大地影響音樂遊戲的體驗，因此，這款遊戲采用了極其嚴格的時間判定方式。\r\n飆速模式：完成一周目後，你將迎來速度與挑戰不斷飆升的全新模式。專為那些永不滿足的玩家準備。\r\n只需一個按鍵: 你可以使用鍵盤上的大多數按鍵控制這個遊戲。理論上，可以支持多種外設。你甚至可以使用太鼓來遊玩本遊戲。', 'Windows 7 or later', '', '2GB', 'Intel Graphics 4000, 2GB VRAM', '', '1.5G', '2024-08-07'),
	(9, '《重力美術館 Gravitas》是一款遊戲時間不長的第一人稱平台解謎遊戲，故事發生在一間建於太空中的重力美術館 (或稱GORG)，在那裏面你會遇到一位古怪又多話的「館長先生」陪著你欣賞那些令人費解且越來越致命的藝術品，操縱重力與美術館的展示品來證明你就是那位懂得欣賞館長先生的傑作的學徒。\r\n\r\n改變重力以穿梭於館長大人令人好奇的藝術品之間。\r\n\r\n讓「天才」館長大人陪著你探索美術館。\r\n\r\n\r\n善用改變重力的能力操作美術館內的方塊還有避免死亡。\r\n\r\n《Galaxy Shark Studios》是一個由14名遊戲開發者組成的團隊。三年前在研究所時，團隊深受多款解謎遊戲啟發而開始製作《重力美術館 Gravitas》，我們很開心終於可以把遊戲正式發布出來讓其他深愛解謎遊戲的人一起遊玩。如果你想了解更多關於開發團隊或遊戲的訊息，請到我們的官方網站，或者你有任何關於《重力美術館 Gravitas》的建議與問題，歡迎聯絡我們!', 'Windows 7/8/10 64-bit', '64-bit Quad-core Intel or AMD, 2.0 GHz or faster', '4GB', 'OpenGL 3.0+ / DirectX, 1GB Video RAM', '10', '8GB', '2024-08-07');

-- 傾印  資料表 fantasy_universe.game_data 結構
CREATE TABLE IF NOT EXISTS `game_data` (
  `game_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` int(6) NOT NULL DEFAULT 0 COMMENT '價格',
  `sale_price` int(6) NOT NULL DEFAULT 0 COMMENT '特價',
  `img` text DEFAULT NULL COMMENT '封面',
  `files` text DEFAULT NULL COMMENT '安裝檔',
  `type` text DEFAULT NULL,
  `date` date NOT NULL COMMENT '上市日期',
  `store_shelves` tinyint(2) DEFAULT 1 COMMENT '是否在架上',
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.game_data 的資料：~2 rows (近似值)
INSERT INTO `game_data` (`game_id`, `name`, `price`, `sale_price`, `img`, `files`, `type`, `date`, `store_shelves`) VALUES
	(7, 'Minecraft', 1000, 1000, 'Minecraft_1_e2464240708250e0.jpg', 'Minecraft_1_522e15688bd6a010.zip', '開放世界,3D,沙盒,第一人稱', '2024-08-07', 1),
	(8, '冰與火之舞', 123, 100, 'A Dance of Fire and Ice_6_d1eb06048cef93b2.jpg', 'A Dance of Fire and Ice_4_78adf96c308ee2a3.zip', '節奏,音樂', '2024-08-07', 1),
	(9, 'Gravitas', 0, 0, 'Gravitas_1_bdf518bd7cdf9e4c.jpg', 'Gravitas_1_0220607d921822e3.zip', '單人,第一人稱,解謎,免費遊玩', '2024-08-07', 1);

-- 傾印  資料表 fantasy_universe.game_type 結構
CREATE TABLE IF NOT EXISTS `game_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.game_type 的資料：~8 rows (近似值)
INSERT INTO `game_type` (`id`, `name`) VALUES
	(1, '節奏'),
	(2, '音樂'),
	(3, '單人'),
	(4, '2D'),
	(7, '開放世界'),
	(8, '3D'),
	(9, '沙盒'),
	(10, '第一人稱'),
	(11, '解謎'),
	(12, '免費遊玩');

-- 傾印  資料表 fantasy_universe.photo_data 結構
CREATE TABLE IF NOT EXISTS `photo_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '0' COMMENT '檔名',
  `game_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.photo_data 的資料：~11 rows (近似值)
INSERT INTO `photo_data` (`id`, `name`, `game_id`) VALUES
	(49, 'Minecraft_1_e2464240708250e0.jpg', 7),
	(50, 'Minecraft_11_2aad8f4e4f098d42.jpg', 7),
	(51, 'Minecraft_16_767d9434f4dd9ff0.jpg', 7),
	(52, 'Minecraft_20_f03a0d4f4445bcf3.jpg', 7),
	(53, 'A Dance of Fire and Ice_6_d1eb06048cef93b2.jpg', 8),
	(54, 'A Dance of Fire and Ice_home_39a7d72684610771.jpg', 8),
	(55, 'A Dance of Fire and Ice_5_24c95244c6050726.jpg', 8),
	(56, 'Gravitas_1_bdf518bd7cdf9e4c.jpg', 9),
	(57, 'Gravitas_9_85d8f17bdbf6613b.jpg', 9),
	(58, 'Gravitas_11_b76d703ec9573ed4.jpg', 9),
	(59, 'Gravitas_home_0112c9554250aee8.jpg', 9);

-- 傾印  資料表 fantasy_universe.shop_cart_data 結構
CREATE TABLE IF NOT EXISTS `shop_cart_data` (
  `game_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.shop_cart_data 的資料：~3 rows (近似值)
INSERT INTO `shop_cart_data` (`game_id`, `user_id`, `date`) VALUES
	(8, 1, '2024-08-09'),
	(9, 1, '2024-08-09'),
	(7, 1, '2024-08-09');

-- 傾印  資料表 fantasy_universe.shop_his_data 結構
CREATE TABLE IF NOT EXISTS `shop_his_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL DEFAULT 0,
  `user_id` bigint(20) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_shop_his_data_game_date` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在傾印表格  fantasy_universe.shop_his_data 的資料：~0 rows (近似值)

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
  `date` date NOT NULL,
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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
