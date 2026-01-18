/*
Navicat MySQL Data Transfer

Source Server         : dbtb
Source Server Version : 50173
Source Host           : 192.168.1.7:3306
Source Database       : dbtaobao

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2022-05-25 21:21:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hour_analysis
-- ----------------------------
DROP TABLE IF EXISTS `hour_analysis`;
CREATE TABLE `hour_analysis` (
  `action_hour` text,
  `count` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hour_analysis
-- ----------------------------
INSERT INTO `hour_analysis` VALUES ('07', '75018');
INSERT INTO `hour_analysis` VALUES ('11', '142991');
INSERT INTO `hour_analysis` VALUES ('15', '161061');
INSERT INTO `hour_analysis` VALUES ('01', '46269');
INSERT INTO `hour_analysis` VALUES ('22', '248249');
INSERT INTO `hour_analysis` VALUES ('18', '142799');
INSERT INTO `hour_analysis` VALUES ('16', '155486');
INSERT INTO `hour_analysis` VALUES ('00', '101887');
INSERT INTO `hour_analysis` VALUES ('17', '139533');
INSERT INTO `hour_analysis` VALUES ('09', '126653');
INSERT INTO `hour_analysis` VALUES ('05', '18588');
INSERT INTO `hour_analysis` VALUES ('19', '179911');
INSERT INTO `hour_analysis` VALUES ('23', '188436');
INSERT INTO `hour_analysis` VALUES ('08', '103204');
INSERT INTO `hour_analysis` VALUES ('03', '17746');
INSERT INTO `hour_analysis` VALUES ('02', '26049');
INSERT INTO `hour_analysis` VALUES ('06', '38755');
INSERT INTO `hour_analysis` VALUES ('10', '146386');
INSERT INTO `hour_analysis` VALUES ('20', '219736');
INSERT INTO `hour_analysis` VALUES ('12', '144222');
INSERT INTO `hour_analysis` VALUES ('04', '15568');
INSERT INTO `hour_analysis` VALUES ('13', '158107');
INSERT INTO `hour_analysis` VALUES ('21', '249636');
INSERT INTO `hour_analysis` VALUES ('14', '153710');
