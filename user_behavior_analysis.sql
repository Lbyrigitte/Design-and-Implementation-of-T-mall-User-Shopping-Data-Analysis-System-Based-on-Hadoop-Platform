/*
Navicat MySQL Data Transfer

Source Server         : dbtb
Source Server Version : 50173
Source Host           : 192.168.1.7:3306
Source Database       : dbtaobao

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2022-05-25 21:21:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_behavior_analysis
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_analysis`;
CREATE TABLE `user_behavior_analysis` (
  `behavior_type` text,
  `count` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_behavior_analysis
-- ----------------------------
INSERT INTO `user_behavior_analysis` VALUES ('buy', '59975');
INSERT INTO `user_behavior_analysis` VALUES ('fav', '86576');
INSERT INTO `user_behavior_analysis` VALUES ('pv', '2685877');
INSERT INTO `user_behavior_analysis` VALUES ('cart', '167572');
