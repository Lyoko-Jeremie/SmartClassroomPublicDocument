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

-- 导出 smartclassroomdeviceapplicationlayerdatabase 的数据库结构
CREATE DATABASE IF NOT EXISTS `smartclassroomdeviceapplicationlayerdatabase` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smartclassroomdeviceapplicationlayerdatabase`;


-- 导出  表 smartclassroomdeviceapplicationlayerdatabase.device 结构
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

-- 正在导出表  smartclassroomdeviceapplicationlayerdatabase.device 的数据：~0 rows (大约)
DELETE FROM `device`;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;


-- 导出  表 smartclassroomdeviceapplicationlayerdatabase.deviceinfo 结构
CREATE TABLE IF NOT EXISTS `deviceinfo` (
  `controllerid` int(64) unsigned NOT NULL,
  `deviceid` int(64) unsigned NOT NULL,
  `last_flush_time_table` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '这个时间是插入到本表的时间而不是控制器上传的时间，是数据库服务器的时间，有极大的延迟但可以保证数据库中的一致性',
  `last_flush_time_node` datetime NOT NULL COMMENT '这个时间是控制器节点上传刷新消息的时间，为控制器自己的时钟时间，不能保证一定与国际时钟同步，只能保证一个控制器下的时钟一致性',
  `last_flush_time_root` datetime NOT NULL COMMENT '这个时间是根节点收到刷新推送的时间，能够保证所有设备的刷新时间一致性',
  `device_name` varchar(50) NOT NULL COMMENT '节点上配置的设备名',
  `devicetype` int(64) unsigned NOT NULL,
  `state` int(64) unsigned NOT NULL COMMENT '节点上配置的设备state',
  `substate` int(64) unsigned NOT NULL COMMENT '节点上配置的设备substate',
  `now_state` int(64) unsigned NOT NULL COMMENT '设备的最新state',
  `now_substate` int(64) unsigned NOT NULL COMMENT '设备的最新substate',
  UNIQUE KEY `controllerid_deviceid` (`controllerid`,`deviceid`),
  KEY `devicetype` (`devicetype`),
  CONSTRAINT `FK_deviceinfo_devicetype` FOREIGN KEY (`devicetype`) REFERENCES `devicetype` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备最新状态信息表，这是设备高速缓存信在前端的数据库表副本，作为二级信息表，更新有延迟，不能代表设备的最新状态。\r\n注1：不能保证两个ID一定在静态信息表中存在（这意味着可能有设备没有注册，或者静态信息表太老），但这一点数据不一致并不影响正常使用。\r\n注2：静态信息表中存在的设备不代表在此表中一定存在，查询不到即表示设备不在线，没有此设备的信息，（此数据不一致性是正常情况）。\r\n注3：这个表中数据的更新一定会有延迟，并且更新频率越低延迟越大。\r\n注4：这个表肯定会受到频繁更新，不保证MySQL和MariaDB能在这么频繁的更新操作下还能正常提供存取服务，可以通过降低更新频率来降低负载。但当设备网络规模巨大时一定会在峰值时有巨量的更新操作，现在Mark一下，这样的负载也许可以使用MSSQL解决。';

-- 正在导出表  smartclassroomdeviceapplicationlayerdatabase.deviceinfo 的数据：~0 rows (大约)
DELETE FROM `deviceinfo`;
/*!40000 ALTER TABLE `deviceinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `deviceinfo` ENABLE KEYS */;


-- 导出  表 smartclassroomdeviceapplicationlayerdatabase.devicetype 结构
CREATE TABLE IF NOT EXISTS `devicetype` (
  `type` int(64) unsigned NOT NULL COMMENT '设备类型',
  `status` int(64) unsigned NOT NULL COMMENT '主可选状态表',
  `substatus` int(64) unsigned NOT NULL COMMENT '副可选状态表',
  `name` varchar(50) NOT NULL DEFAULT '未定义' COMMENT '类型通用名',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备类型对应可选状态表';

-- 正在导出表  smartclassroomdeviceapplicationlayerdatabase.devicetype 的数据：~0 rows (大约)
DELETE FROM `devicetype`;
/*!40000 ALTER TABLE `devicetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `devicetype` ENABLE KEYS */;


-- 导出  表 smartclassroomdeviceapplicationlayerdatabase.room 结构
CREATE TABLE IF NOT EXISTS `room` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT COMMENT '房间ID',
  `name` varchar(256) NOT NULL COMMENT '房间名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教室表';

-- 正在导出表  smartclassroomdeviceapplicationlayerdatabase.room 的数据：~0 rows (大约)
DELETE FROM `room`;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
