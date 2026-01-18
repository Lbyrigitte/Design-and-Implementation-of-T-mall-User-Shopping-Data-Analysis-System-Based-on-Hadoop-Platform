/*
Navicat MySQL Data Transfer

Source Server         : dbtb
Source Server Version : 50173
Source Host           : 192.168.1.7:3306
Source Database       : dbtaobao

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2022-05-25 21:21:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for userbt_number
-- ----------------------------
DROP TABLE IF EXISTS `userbt_number`;
CREATE TABLE `userbt_number` (
  `behavior_type` text,
  `count` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userbt_number
-- ----------------------------
INSERT INTO `userbt_number` VALUES ('buy', '19902');
INSERT INTO `userbt_number` VALUES ('fav', '11701');
INSERT INTO `userbt_number` VALUES ('cart', '22061');
INSERT INTO `userbt_number` VALUES ('pv', '29049');
