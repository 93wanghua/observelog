CREATE DATABASE /*!32312 IF NOT EXISTS*/`log_monitor` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `log_monitor`;
DROP TABLE IF EXISTS `log_monitor_app`;

CREATE TABLE `log_monitor_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '应用编号',
  `name` varchar(100) DEFAULT NULL COMMENT '应用名称',
  `desc` varchar(250) DEFAULT NULL COMMENT '应用简要描述',
  `isOnline` int(1) DEFAULT NULL COMMENT '应用是否在线',
  `typeId` int(1) DEFAULT NULL COMMENT '应用类型对应的ID',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '应用录入时间',
  `updateaDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '应用信息修改时间',
  `createUser` varchar(100) DEFAULT NULL COMMENT '创建用户',
  `updateUser` varchar(100) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `log_monitor_app_type`;

CREATE TABLE `log_monitor_app_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '应用类型编号',
  `name` varchar(100) DEFAULT NULL COMMENT '应用类型名称，如linux，web，java，storm，kafka等',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '应用类型录入时间',
  `updataDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '应用类型修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `log_monitor_rule`;

CREATE TABLE `log_monitor_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则编号，自增长',
  `name` varchar(100) DEFAULT NULL COMMENT '规则名称',
  `desc` varchar(250) DEFAULT NULL COMMENT '规则描述',
  `keyword` varchar(100) DEFAULT NULL COMMENT '规则关键词',
  `isValid` int(1) DEFAULT NULL COMMENT '规则是否可用',
  `appId` int(11) DEFAULT NULL COMMENT '规则所属应用',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '规则创建时间',
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '规则修改时间',
  `createUser` varchar(100) DEFAULT NULL COMMENT '创建用户',
  `updateUser` varchar(100) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `log_monitor_rule_record`;

CREATE TABLE `log_monitor_rule_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '告警信息编号',
  `appId` int(11) DEFAULT NULL COMMENT '告警信息所属应用编号',
  `ruleId` int(11) DEFAULT NULL COMMENT '告警信息所属规则编号',
  `isEmail` int(11) DEFAULT '0' COMMENT '是否邮件告知，0：未告知  1：告知',
  `isPhone` int(11) DEFAULT '0' COMMENT '是否短信告知，0：未告知  1：告知',
  `isColose` int(11) DEFAULT '0' COMMENT '是否处理完毕，0：未处理  1：已处理',
  `noticeInfo` varchar(500) DEFAULT NULL COMMENT '告警信息明细',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '告警信息入库时间',
  `updataDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '告警信息修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `log_monitor_user`;

CREATE TABLE `log_monitor_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号，自增长',
  `name` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `mobile` varchar(11) DEFAULT NULL COMMENT '用户手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '用户的邮箱地址，默认为公司邮箱',
  `isValid` int(1) DEFAULT NULL COMMENT '用户是否有效',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户录入时间',
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '用户信息修改时间',
  `createUser` varchar(100) DEFAULT NULL COMMENT '创建用户',
  `updateUser` varchar(100) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;