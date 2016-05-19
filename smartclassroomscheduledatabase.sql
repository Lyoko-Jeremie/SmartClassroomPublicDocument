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

-- 导出 smartclassroomscheduledatabase 的数据库结构
CREATE DATABASE IF NOT EXISTS `smartclassroomscheduledatabase` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smartclassroomscheduledatabase`;


-- 导出  表 smartclassroomscheduledatabase.devicerelation 结构
CREATE TABLE IF NOT EXISTS `devicerelation` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `scheduleid` int(64) unsigned NOT NULL,
  `controllerid` int(64) unsigned NOT NULL,
  `deviceid` int(64) unsigned NOT NULL,
  `status` varbinary(1024) NOT NULL,
  `substatus` varbinary(1024) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 smartclassroomscheduledatabase.schedule 结构
CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(128) unsigned NOT NULL AUTO_INCREMENT,
  `patch` int(64) unsigned NOT NULL DEFAULT '0',
  `effectivetimebegin` time NOT NULL,
  `effectivetimeend` time NOT NULL,
  `periodflag` int(10) unsigned NOT NULL DEFAULT '0',
  `periodinfo` char(50) DEFAULT NULL,
  `effectivedatebegin` date NOT NULL,
  `effectivedateend` date NOT NULL,
  `userid` int(64) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
