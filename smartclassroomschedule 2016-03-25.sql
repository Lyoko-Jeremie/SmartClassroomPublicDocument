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

-- 导出 smartclassroomschedule 的数据库结构
CREATE DATABASE IF NOT EXISTS `smartclassroomschedule` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smartclassroomschedule`;


-- 导出  表 smartclassroomschedule.classtype 结构
CREATE TABLE IF NOT EXISTS `classtype` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '课时id',
  `return_type` int(64) NOT NULL DEFAULT '0' COMMENT '重复周期（每天1，每周2，每月3，双周4，指定日期（单次有效）0）',
  `begin_date` date NOT NULL COMMENT '最大有效期开始日期',
  `begin_time` time NOT NULL COMMENT '开始 时分秒',
  `end_date` date NOT NULL COMMENT '最大有效期结束日期',
  `end_time` time NOT NULL COMMENT '结束 时分秒',
  `week` int(64) NOT NULL COMMENT '星期几',
  `day` int(64) NOT NULL COMMENT '日期',
  `name` varchar(64) NOT NULL COMMENT '课时名称（第几节  XX活动  XX考试）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 smartclassroomschedule.devicestate 结构
CREATE TABLE IF NOT EXISTS `devicestate` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '状态表条目id',
  `main_id` int(64) NOT NULL DEFAULT '0' COMMENT '日程条目id',
  `controller_id` int(64) NOT NULL DEFAULT '0' COMMENT '控制器id',
  `device_id` int(64) NOT NULL DEFAULT '0' COMMENT '设备id',
  `state` int(64) NOT NULL DEFAULT '0' COMMENT '设备状态',
  `substate` int(64) NOT NULL DEFAULT '0' COMMENT '设备附属状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 smartclassroomschedule.main 结构
CREATE TABLE IF NOT EXISTS `main` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '唯一id（id总不为0）（至少64位int）',
  `parent_id` int(64) NOT NULL DEFAULT '0' COMMENT '作用条目对象id（无作用对象时为0）【0代表世界】【进阶功能】',
  `class_id` int(64) NOT NULL DEFAULT '0' COMMENT '课时时段表 课时id',
  `user_id` int(64) NOT NULL DEFAULT '0' COMMENT '控制者id 用户id',
  `name` varchar(64) NOT NULL COMMENT '条目名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
