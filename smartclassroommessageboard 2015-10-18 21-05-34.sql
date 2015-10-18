-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.0.17-MariaDB - mariadb.org binary distribution
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
  `state` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '留言状态',
  `userid` int(64) unsigned NOT NULL COMMENT '留言用户ID',
  `username` char(128) NOT NULL COMMENT '留言者用户名',
  `message` varchar(1024) NOT NULL COMMENT '留言内容',
  `controllerid` int(255) unsigned NOT NULL,
  `deviceid` int(255) unsigned NOT NULL,
  `deleted` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- 正在导出表  smartclassroommessageboard.messageboard 的数据：~27 rows (大约)
/*!40000 ALTER TABLE `messageboard` DISABLE KEYS */;
INSERT IGNORE INTO `messageboard` (`id`, `state`, `userid`, `username`, `message`, `controllerid`, `deviceid`, `deleted`) VALUES
	(1, 1, 123, '123', '123', 123, 123, 0),
	(2, 0, 123, '123', '123', 123, 123, 0),
	(3, 1, 123, '123', '123', 123, 123, 1),
	(4, 0, 123, '123', '123', 123, 123, 0),
	(5, 0, 123, '123', '123', 123, 123, 1),
	(6, 0, 123, '123', '123', 123, 123, 0),
	(7, 0, 123, '123', '123', 123, 123, 0),
	(8, 1, 123, '123', '123', 123, 123, 1),
	(9, 0, 123, '123', '123', 123, 123, 0),
	(10, 1, 123, '123', '123', 123, 123, 0),
	(11, 0, 123, '123', '123', 123, 123, 0),
	(12, 0, 123, '123', '123', 123, 123, 1),
	(13, 0, 123, '123', '123', 123, 123, 0),
	(14, 0, 123, '123', '123', 123, 123, 0),
	(15, 0, 123, '123', '123', 123, 123, 0),
	(16, 0, 123, '123', '123', 123, 123, 0),
	(17, 0, 123, '123', '123', 123, 123, 0),
	(18, 0, 123, '123', '123', 123, 123, 0),
	(19, 0, 123, '123', '123', 123, 123, 0),
	(20, 0, 123, '123', '123', 123, 123, 1),
	(21, 0, 123, '123', '123', 123, 123, 0),
	(22, 0, 123, '123', '123', 123, 123, 0),
	(23, 0, 123, '123', '123', 123, 123, 0),
	(24, 0, 123, '123', '123', 123, 123, 0),
	(25, 0, 123, '123', '123', 123, 123, 0),
	(26, 0, 123, '123', '123', 123, 123, 0),
	(27, 0, 123, '123', '123', 123, 123, 0);
/*!40000 ALTER TABLE `messageboard` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
