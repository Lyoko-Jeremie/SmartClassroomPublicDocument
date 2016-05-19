-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.1.8-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 smartclassroommessageboard 的数据库结构
CREATE DATABASE IF NOT EXISTS `smartclassroommessageboard` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smartclassroommessageboard`;


-- 导出  表 smartclassroommessageboard.messageboard 结构
CREATE TABLE IF NOT EXISTS `messageboard` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `state` int(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(64) unsigned NOT NULL,
  `username` char(128) NOT NULL,
  `message` varchar(1024) NOT NULL,
  `controllerid` int(255) unsigned NOT NULL,
  `deviceid` int(255) unsigned NOT NULL,
  `deleted` int(1) unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- 正在导出表  smartclassroommessageboard.messageboard 的数据：~28 rows (大约)
DELETE FROM `messageboard`;
/*!40000 ALTER TABLE `messageboard` DISABLE KEYS */;
INSERT INTO `messageboard` (`id`, `state`, `userid`, `username`, `message`, `controllerid`, `deviceid`, `deleted`, `date`) VALUES
	(1, 1, 123, '123', '123', 123, 123, 0, '2015-11-23 09:55:38'),
	(2, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(3, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(4, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(5, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(6, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(7, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(8, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(9, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(10, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(11, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(12, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(13, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(14, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(15, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(16, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(17, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(18, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(19, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(20, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(21, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(22, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(23, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(24, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(25, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(26, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(27, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38'),
	(28, 0, 456, '123', '123', 456, 456, 0, '2015-11-23 09:55:38');
/*!40000 ALTER TABLE `messageboard` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
