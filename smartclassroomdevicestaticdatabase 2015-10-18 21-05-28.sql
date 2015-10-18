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

-- 导出 smartclassroomdevicestaticdatabase 的数据库结构
CREATE DATABASE IF NOT EXISTS `smartclassroomdevicestaticdatabase` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smartclassroomdevicestaticdatabase`;


-- 导出  表 smartclassroomdevicestaticdatabase.device 结构
CREATE TABLE IF NOT EXISTS `device` (
  `controllerid` int(64) unsigned NOT NULL COMMENT '控制器ID（树莓派主机）',
  `deviceid` int(64) unsigned NOT NULL COMMENT '设备ID（相对与控制器的下属设备）',
  `devicename` varchar(50) NOT NULL COMMENT '设备名',
  `devicetype` int(64) unsigned NOT NULL COMMENT '设备类型',
  UNIQUE KEY `Index 1` (`controllerid`,`deviceid`),
  KEY `devicetype` (`devicetype`),
  CONSTRAINT `FK_device_devicetype` FOREIGN KEY (`devicetype`) REFERENCES `devicetype` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备信息表';

-- 正在导出表  smartclassroomdevicestaticdatabase.device 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT IGNORE INTO `device` (`controllerid`, `deviceid`, `devicename`, `devicetype`) VALUES
	(1438799721, 1438799727, 'testdevice', 2),
	(1441298534, 1441298541, 'testdevice', 2);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;


-- 导出  表 smartclassroomdevicestaticdatabase.devicetype 结构
CREATE TABLE IF NOT EXISTS `devicetype` (
  `type` int(64) unsigned NOT NULL COMMENT '设备类型',
  `status` varbinary(1024) NOT NULL COMMENT '主可选状态表',
  `substatus` varbinary(1024) NOT NULL COMMENT '副可选状态表',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备类型对应可选状态表';

-- 正在导出表  smartclassroomdevicestaticdatabase.devicetype 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `devicetype` DISABLE KEYS */;
INSERT IGNORE INTO `devicetype` (`type`, `status`, `substatus`) VALUES
	(1, _binary 0x00, _binary 0x00),
	(2, _binary 0x00, _binary 0x00);
/*!40000 ALTER TABLE `devicetype` ENABLE KEYS */;


-- 导出  表 smartclassroomdevicestaticdatabase.link 结构
CREATE TABLE IF NOT EXISTS `link` (
  `controllerid` int(64) unsigned NOT NULL COMMENT '设备ID',
  `roomid` int(64) unsigned NOT NULL COMMENT '房间ID',
  PRIMARY KEY (`controllerid`),
  KEY `FK_link_room` (`roomid`),
  CONSTRAINT `FK_link_device` FOREIGN KEY (`controllerid`) REFERENCES `device` (`controllerid`),
  CONSTRAINT `FK_link_room` FOREIGN KEY (`roomid`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房间与设备关系表';

-- 正在导出表  smartclassroomdevicestaticdatabase.link 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT IGNORE INTO `link` (`controllerid`, `roomid`) VALUES
	(1438799721, 2);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;


-- 导出  表 smartclassroomdevicestaticdatabase.room 结构
CREATE TABLE IF NOT EXISTS `room` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT COMMENT '房间ID',
  `name` varchar(256) NOT NULL COMMENT '房间名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='教室表';

-- 正在导出表  smartclassroomdevicestaticdatabase.room 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT IGNORE INTO `room` (`id`, `name`) VALUES
	(1, '未绑定设备'),
	(2, '1-101'),
	(3, '1-102'),
	(4, '1-103');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
