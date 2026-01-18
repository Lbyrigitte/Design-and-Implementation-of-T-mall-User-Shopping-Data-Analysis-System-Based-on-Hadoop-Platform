/*
Navicat MySQL Data Transfer

Source Server         : dbtb
Source Server Version : 50173
Source Host           : 192.168.1.7:3306
Source Database       : dbtaobao

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2022-05-25 21:21:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pv_number
-- ----------------------------
DROP TABLE IF EXISTS `pv_number`;
CREATE TABLE `pv_number` (
  `behavior_type` text,
  `count` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_number
-- ----------------------------
INSERT INTO `pv_number` VALUES ('pv', '2685877');
