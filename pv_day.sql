/*
Navicat MySQL Data Transfer

Source Server         : dbtb
Source Server Version : 50173
Source Host           : 192.168.1.7:3306
Source Database       : dbtaobao

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2022-05-25 21:21:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pv_day
-- ----------------------------
DROP TABLE IF EXISTS `pv_day`;
CREATE TABLE `pv_day` (
  `actiondate` text,
  `count` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv_day
-- ----------------------------
INSERT INTO `pv_day` VALUES ('1970-01-01', '1');
INSERT INTO `pv_day` VALUES ('2017-07-03', '2');
INSERT INTO `pv_day` VALUES ('2017-09-11', '1');
INSERT INTO `pv_day` VALUES ('2015-02-06', '1');
INSERT INTO `pv_day` VALUES ('2017-09-16', '2');
INSERT INTO `pv_day` VALUES ('2017-11-03', '14');
INSERT INTO `pv_day` VALUES ('2017-11-05', '1');
INSERT INTO `pv_day` VALUES ('2017-11-06', '1');
INSERT INTO `pv_day` VALUES ('2017-11-10', '1');
INSERT INTO `pv_day` VALUES ('2017-11-11', '2');
INSERT INTO `pv_day` VALUES ('2017-11-12', '2');
INSERT INTO `pv_day` VALUES ('2017-11-13', '1');
INSERT INTO `pv_day` VALUES ('2017-11-15', '1');
INSERT INTO `pv_day` VALUES ('2017-11-16', '5');
INSERT INTO `pv_day` VALUES ('2017-11-17', '7');
INSERT INTO `pv_day` VALUES ('2017-11-18', '7');
INSERT INTO `pv_day` VALUES ('2017-11-19', '15');
INSERT INTO `pv_day` VALUES ('2017-11-20', '10');
INSERT INTO `pv_day` VALUES ('2017-11-14', '5');
INSERT INTO `pv_day` VALUES ('2017-11-21', '20');
INSERT INTO `pv_day` VALUES ('2017-11-22', '37');
INSERT INTO `pv_day` VALUES ('2017-11-23', '124');
INSERT INTO `pv_day` VALUES ('2017-11-25', '278615');
INSERT INTO `pv_day` VALUES ('2017-11-24', '1184');
INSERT INTO `pv_day` VALUES ('2017-11-26', '285850');
INSERT INTO `pv_day` VALUES ('2017-11-28', '265157');
INSERT INTO `pv_day` VALUES ('2017-11-27', '267000');
INSERT INTO `pv_day` VALUES ('2017-11-29', '271342');
INSERT INTO `pv_day` VALUES ('2017-11-30', '280678');
INSERT INTO `pv_day` VALUES ('2017-12-01', '294298');
INSERT INTO `pv_day` VALUES ('2017-12-03', '371188');
INSERT INTO `pv_day` VALUES ('2017-12-04', '4');
INSERT INTO `pv_day` VALUES ('2017-12-02', '370282');
INSERT INTO `pv_day` VALUES ('2017-12-06', '3');
INSERT INTO `pv_day` VALUES ('2018-08-28', '16');
