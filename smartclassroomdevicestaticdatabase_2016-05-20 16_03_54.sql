-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.1.14-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
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
  `roomid` int(64) unsigned NOT NULL,
  UNIQUE KEY `Index 1` (`controllerid`,`deviceid`),
  KEY `devicetype` (`devicetype`),
  KEY `roomid` (`roomid`),
  CONSTRAINT `FK_device_devicetype` FOREIGN KEY (`devicetype`) REFERENCES `devicetype` (`type`),
  CONSTRAINT `FK_device_room` FOREIGN KEY (`roomid`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备信息表';

-- 正在导出表  smartclassroomdevicestaticdatabase.device 的数据：~3 rows (大约)
DELETE FROM `device`;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` (`controllerid`, `deviceid`, `devicename`, `devicetype`, `roomid`) VALUES
	(200000001, 1, 'LED1', 20001, 2),
	(200000001, 2, 'LED1', 20001, 2),
	(200000001, 3, 'LED1', 20001, 2),
	(200000001, 201, 'Computer1', 40001, 2);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;


-- 导出  表 smartclassroomdevicestaticdatabase.devicetype 结构
CREATE TABLE IF NOT EXISTS `devicetype` (
  `type` int(64) unsigned NOT NULL COMMENT '设备类型',
  `status` int(64) unsigned NOT NULL COMMENT '主可选状态表',
  `substatus` int(64) unsigned NOT NULL COMMENT '副可选状态表',
  `name` varchar(50) NOT NULL DEFAULT '未定义' COMMENT '类型通用名',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备类型对应可选状态表';

-- 正在导出表  smartclassroomdevicestaticdatabase.devicetype 的数据：~0 rows (大约)
DELETE FROM `devicetype`;
/*!40000 ALTER TABLE `devicetype` DISABLE KEYS */;
INSERT INTO `devicetype` (`type`, `status`, `substatus`, `name`) VALUES
	(20001, 3, 0, 'LED'),
	(40001, 2, 0, '电脑');
/*!40000 ALTER TABLE `devicetype` ENABLE KEYS */;


-- 导出  表 smartclassroomdevicestaticdatabase.flushtime 结构
CREATE TABLE IF NOT EXISTS `flushtime` (
  `table` enum('device','devicetype','room') NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  smartclassroomdevicestaticdatabase.flushtime 的数据：~3 rows (大约)
DELETE FROM `flushtime`;
/*!40000 ALTER TABLE `flushtime` DISABLE KEYS */;
INSERT INTO `flushtime` (`table`, `time`) VALUES
	('device', '2016-05-20 15:47:05'),
	('devicetype', '2016-05-20 15:44:22'),
	('room', '2016-01-05 03:17:22');
/*!40000 ALTER TABLE `flushtime` ENABLE KEYS */;


-- 导出  表 smartclassroomdevicestaticdatabase.room 结构
CREATE TABLE IF NOT EXISTS `room` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT COMMENT '房间ID',
  `name` varchar(256) NOT NULL COMMENT '房间名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='教室表';

-- 正在导出表  smartclassroomdevicestaticdatabase.room 的数据：~3 rows (大约)
DELETE FROM `room`;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`id`, `name`) VALUES
	(1, 'Unbind'),
	(2, 'test1'),
	(3, 'test2');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;


-- 导出  视图 smartclassroomdevicestaticdatabase.room_device_count 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `room_device_count` (
	`roomid` INT(64) UNSIGNED NOT NULL,
	`controllerid` INT(64) UNSIGNED NOT NULL COMMENT '控制器ID（树莓派主机）',
	`devicecount` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- 导出  触发器 smartclassroomdevicestaticdatabase.devicetype_after_delete 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `devicetype_after_delete` AFTER DELETE ON `devicetype` FOR EACH ROW BEGIN
update flushtime set `time`=now() where `table`='devicetype';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 smartclassroomdevicestaticdatabase.devicetype_after_insert 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `devicetype_after_insert` AFTER INSERT ON `devicetype` FOR EACH ROW BEGIN
update flushtime set `time`=now() where `table`='devicetype';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 smartclassroomdevicestaticdatabase.devicetype_after_update 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `devicetype_after_update` AFTER UPDATE ON `devicetype` FOR EACH ROW BEGIN
update flushtime set `time`=now() where `table`='devicetype';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 smartclassroomdevicestaticdatabase.device_after_delete 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `device_after_delete` AFTER DELETE ON `device` FOR EACH ROW BEGIN
update flushtime set `time`=now() where `table`='device';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 smartclassroomdevicestaticdatabase.device_after_insert 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `device_after_insert` AFTER INSERT ON `device` FOR EACH ROW BEGIN
update flushtime set `time`=now() where `table`='device';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 smartclassroomdevicestaticdatabase.device_after_update 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `device_after_update` AFTER UPDATE ON `device` FOR EACH ROW BEGIN
update flushtime set `time`=now() where `table`='device';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 smartclassroomdevicestaticdatabase.room_after_delete 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `room_after_delete` AFTER DELETE ON `room` FOR EACH ROW BEGIN
update flushtime set `time`=now() where `table`='room';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 smartclassroomdevicestaticdatabase.room_after_insert 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `room_after_insert` AFTER INSERT ON `room` FOR EACH ROW BEGIN
update flushtime set `time`=now() where `table`='room';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 smartclassroomdevicestaticdatabase.room_after_update 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `room_after_update` AFTER UPDATE ON `room` FOR EACH ROW BEGIN
update flushtime set `time`=now() where `table`='room';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  触发器 smartclassroomdevicestaticdatabase.room_before_delete 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `room_before_delete` BEFORE DELETE ON `room` FOR EACH ROW BEGIN
UPDATE `device` SET `roomid`=1 WHERE  `roomid`=TRIM(OLD.id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- 导出  视图 smartclassroomdevicestaticdatabase.room_device_count 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `room_device_count`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` VIEW `room_device_count` AS SELECT roomid, controllerid, count(deviceid) as devicecount FROM `device` GROUP BY `controllerid` ORDER BY `roomid` ASC ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
