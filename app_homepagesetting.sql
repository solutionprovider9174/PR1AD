/*
 Navicat Premium Data Transfer

 Source Server         : jincowboy
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : pr1ad

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 10/06/2020 09:31:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_homepagesetting
-- ----------------------------
DROP TABLE IF EXISTS `app_homepagesetting`;
CREATE TABLE `app_homepagesetting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `background_color` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Font_color` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `homeslider_text1` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `homeslider_text2` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `homeslider_text3` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `homeslider1` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `homeslider2` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `homeslider3` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `homeimage1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `homeimage2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `homeimage3` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `validFrom` datetime(6) NOT NULL,
  `validTo` datetime(6) NOT NULL,
  `Is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `App_homepagesetting_homeslider1_4637a613`(`homeslider1`) USING BTREE,
  INDEX `App_homepagesetting_homeslider2_6c438360`(`homeslider2`) USING BTREE,
  INDEX `App_homepagesetting_homeslider3_a3f10fc0`(`homeslider3`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_homepagesetting
-- ----------------------------
INSERT INTO `app_homepagesetting` VALUES (1, '#FCFF57', '#210FFF', 'First Slider>>', 'Second Slider>>', 'Third Slider>>', 'http://www.google.com', 'http://stackoverflow.com', 'http://www.jincowboy.com', 'logo/10_Adptjid.jpg', 'logo/1.jpg', 'logo/19.jpg', '2020-06-10 08:59:37.000000', '2021-04-16 08:59:37.000000', 1);

SET FOREIGN_KEY_CHECKS = 1;
