/*
Navicat MySQL Data Transfer

Source Server         : 我的数据库
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : cqtiq

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-10 13:39:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bardata
-- ----------------------------
DROP TABLE IF EXISTS `bardata`;
CREATE TABLE `bardata` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `y` varchar(255) DEFAULT NULL,
  `a` int(255) DEFAULT NULL,
  `b` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2036 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bardata
-- ----------------------------
INSERT INTO `bardata` VALUES ('2030', '2024', '16', '64');
INSERT INTO `bardata` VALUES ('2031', '2025', '67', '87');
INSERT INTO `bardata` VALUES ('2032', '2026', '44', '55');
INSERT INTO `bardata` VALUES ('2033', '2027', '45', '43');
INSERT INTO `bardata` VALUES ('2034', '2028', '45', '5');
INSERT INTO `bardata` VALUES ('2035', '2029', '77', '5');

-- ----------------------------
-- Table structure for tbperson
-- ----------------------------
DROP TABLE IF EXISTS `tbperson`;
CREATE TABLE `tbperson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbperson
-- ----------------------------
INSERT INTO `tbperson` VALUES ('20', '赵四', '女', '12');
INSERT INTO `tbperson` VALUES ('21', '王五', '男', '45');
INSERT INTO `tbperson` VALUES ('23', '张三', '男', '11');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `onOff` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', 'open');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zs', '123');
