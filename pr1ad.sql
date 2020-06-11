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

 Date: 11/06/2020 16:32:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_auditentry
-- ----------------------------
DROP TABLE IF EXISTS `app_auditentry`;
CREATE TABLE `app_auditentry`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip` char(39) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `username` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_auditentry
-- ----------------------------
INSERT INTO `app_auditentry` VALUES (1, 'user_logged_out', '127.0.0.1', 'super', '2020-06-11 15:21:41.005560');
INSERT INTO `app_auditentry` VALUES (2, 'user_logged_in', '127.0.0.1', 'super', '2020-06-11 15:21:41.005560');
INSERT INTO `app_auditentry` VALUES (3, 'user_logged_out', '127.0.0.1', 'super', '2020-06-11 15:21:41.005560');
INSERT INTO `app_auditentry` VALUES (4, 'user_logged_in', '127.0.0.1', 'super', '2020-06-11 15:21:41.005560');
INSERT INTO `app_auditentry` VALUES (5, 'user_logged_out', '127.0.0.1', 'super', '2020-06-11 14:49:47.933138');
INSERT INTO `app_auditentry` VALUES (6, 'user_logged_in', '127.0.0.1', 'super', '2020-06-11 14:49:56.229613');
INSERT INTO `app_auditentry` VALUES (7, 'user_logged_out', '127.0.0.1', 'super', '2020-06-11 15:57:36.547850');
INSERT INTO `app_auditentry` VALUES (8, 'user_logged_in', '127.0.0.1', 'super', '2020-06-11 15:57:43.542250');

-- ----------------------------
-- Table structure for app_customuser
-- ----------------------------
DROP TABLE IF EXISTS `app_customuser`;
CREATE TABLE `app_customuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `ip_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `country` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `login_count` int(10) UNSIGNED NOT NULL,
  `user_level` int(11) NOT NULL,
  `user_email_change_permission` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_customuser
-- ----------------------------
INSERT INTO `app_customuser` VALUES (1, 'pbkdf2_sha256$120000$UvkV5v3bBoag$2gn1DZ1e9ldzBGYtGwMqdMkm0TgSf+JKG5azjkzINrs=', '2020-06-11 08:57:43.000000', 1, 'super', 'GuangCheng', 'Wang', 'super@gmail.com1', 1, 1, '2020-06-10 02:32:51.000000', '', 'hochiminh', '90923232', 'hochiminh', 'Vietnam', 11, 0, 0);
INSERT INTO `app_customuser` VALUES (3, 'pbkdf2_sha256$120000$I2MtqaOHjDN5$acAa1AaB6gUb+ZjaaFqGSQgoADvu/CzeOgrFD/RP7SE=', '2020-06-10 06:07:34.000000', 0, 'Test1', 'GuangCheng', 'Wang', 'guangchengwang9174@yandex.com', 0, 1, '2020-06-10 06:07:08.000000', '', 'hochiminh', '090923232', 'hochiminh', 'Vietnam', 1, 0, 0);
INSERT INTO `app_customuser` VALUES (4, 'pbkdf2_sha256$120000$Cx7gVtFl4Gyi$8TkaFERSkVFmWgjpXUKN5UX8JiKMAHgmixqF7YJqdP0=', '2020-06-11 02:11:30.665201', 0, 'test21232', 'pum', 'viet', 'test2@gmail.com', 0, 1, '2020-06-11 02:11:22.014706', '', 'address 10', '089304343', 'rocknum', 'India', 1, 0, 0);

-- ----------------------------
-- Table structure for app_customuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `app_customuser_groups`;
CREATE TABLE `app_customuser_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `App_customuser_groups_customuser_id_group_id_df552c33_uniq`(`customuser_id`, `group_id`) USING BTREE,
  INDEX `App_customuser_groups_customuser_id_3d19b914`(`customuser_id`) USING BTREE,
  INDEX `App_customuser_groups_group_id_866c84c5`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for app_customuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `app_customuser_user_permissions`;
CREATE TABLE `app_customuser_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `App_customuser_user_perm_customuser_id_permission_dfcd5057_uniq`(`customuser_id`, `permission_id`) USING BTREE,
  INDEX `App_customuser_user_permissions_customuser_id_a001c150`(`customuser_id`) USING BTREE,
  INDEX `App_customuser_user_permissions_permission_id_454c1db8`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

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

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissions_group_id_b120cbf9`(`group_id`) USING BTREE,
  INDEX `auth_group_permissions_permission_id_84c5c92e`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  INDEX `auth_permission_content_type_id_2f476e4b`(`content_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 61 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add homepage setting', 6, 'add_homepagesetting');
INSERT INTO `auth_permission` VALUES (22, 'Can change homepage setting', 6, 'change_homepagesetting');
INSERT INTO `auth_permission` VALUES (23, 'Can delete homepage setting', 6, 'delete_homepagesetting');
INSERT INTO `auth_permission` VALUES (24, 'Can view homepage setting', 6, 'view_homepagesetting');
INSERT INTO `auth_permission` VALUES (25, 'Can add user', 7, 'add_customuser');
INSERT INTO `auth_permission` VALUES (26, 'Can change user', 7, 'change_customuser');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user', 7, 'delete_customuser');
INSERT INTO `auth_permission` VALUES (28, 'Can view user', 7, 'view_customuser');
INSERT INTO `auth_permission` VALUES (29, 'Can add audit entry', 8, 'add_auditentry');
INSERT INTO `auth_permission` VALUES (30, 'Can change audit entry', 8, 'change_auditentry');
INSERT INTO `auth_permission` VALUES (31, 'Can delete audit entry', 8, 'delete_auditentry');
INSERT INTO `auth_permission` VALUES (32, 'Can view audit entry', 8, 'view_auditentry');
INSERT INTO `auth_permission` VALUES (33, 'Can add IP Group', 9, 'add_ipgroup');
INSERT INTO `auth_permission` VALUES (34, 'Can change IP Group', 9, 'change_ipgroup');
INSERT INTO `auth_permission` VALUES (35, 'Can delete IP Group', 9, 'delete_ipgroup');
INSERT INTO `auth_permission` VALUES (36, 'Can view IP Group', 9, 'view_ipgroup');
INSERT INTO `auth_permission` VALUES (37, 'Can add IP Range', 10, 'add_iprange');
INSERT INTO `auth_permission` VALUES (38, 'Can change IP Range', 10, 'change_iprange');
INSERT INTO `auth_permission` VALUES (39, 'Can delete IP Range', 10, 'delete_iprange');
INSERT INTO `auth_permission` VALUES (40, 'Can view IP Range', 10, 'view_iprange');
INSERT INTO `auth_permission` VALUES (41, 'Can add reload rules request', 11, 'add_reloadrulesrequest');
INSERT INTO `auth_permission` VALUES (42, 'Can change reload rules request', 11, 'change_reloadrulesrequest');
INSERT INTO `auth_permission` VALUES (43, 'Can delete reload rules request', 11, 'delete_reloadrulesrequest');
INSERT INTO `auth_permission` VALUES (44, 'Can view reload rules request', 11, 'view_reloadrulesrequest');
INSERT INTO `auth_permission` VALUES (45, 'Can add rule', 12, 'add_rule');
INSERT INTO `auth_permission` VALUES (46, 'Can change rule', 12, 'change_rule');
INSERT INTO `auth_permission` VALUES (47, 'Can delete rule', 12, 'delete_rule');
INSERT INTO `auth_permission` VALUES (48, 'Can view rule', 12, 'view_rule');
INSERT INTO `auth_permission` VALUES (49, 'Can add Location Based IP Group', 9, 'add_locationbasedipgroup');
INSERT INTO `auth_permission` VALUES (50, 'Can change Location Based IP Group', 9, 'change_locationbasedipgroup');
INSERT INTO `auth_permission` VALUES (51, 'Can delete Location Based IP Group', 9, 'delete_locationbasedipgroup');
INSERT INTO `auth_permission` VALUES (52, 'Can view Location Based IP Group', 9, 'view_locationbasedipgroup');
INSERT INTO `auth_permission` VALUES (53, 'Can add IP Group', 9, 'add_rangebasedipgroup');
INSERT INTO `auth_permission` VALUES (54, 'Can change IP Group', 9, 'change_rangebasedipgroup');
INSERT INTO `auth_permission` VALUES (55, 'Can delete IP Group', 9, 'delete_rangebasedipgroup');
INSERT INTO `auth_permission` VALUES (56, 'Can view IP Group', 9, 'view_rangebasedipgroup');
INSERT INTO `auth_permission` VALUES (57, 'Can add IP Location', 13, 'add_iplocation');
INSERT INTO `auth_permission` VALUES (58, 'Can change IP Location', 13, 'change_iplocation');
INSERT INTO `auth_permission` VALUES (59, 'Can delete IP Location', 13, 'delete_iplocation');
INSERT INTO `auth_permission` VALUES (60, 'Can view IP Location', 13, 'view_iplocation');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `object_repr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2020-06-10 02:38:31.222716', '1', 'super', 2, '[{\"changed\": {\"fields\": [\"country\", \"city\", \"phone\", \"address\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2020-06-11 08:22:24.640055', '3', 'Test1', 2, '[]', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2020-06-11 08:28:12.494952', '1', 'super', 2, '[{\"changed\": {\"fields\": [\"user_email_change_permission\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2020-06-11 08:28:24.965665', '1', 'super', 2, '[{\"changed\": {\"fields\": [\"user_email_change_permission\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (5, '2020-06-11 08:45:57.006838', '1', 'super', 2, '[{\"changed\": {\"fields\": [\"user_email_change_permission\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (6, '2020-06-11 08:59:20.692806', '1', 'Rule object (1)', 2, '[{\"changed\": {\"fields\": [\"ip_group\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (7, '2020-06-11 09:00:45.761672', '3', '79.12.45.168', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"IP Range\", \"object\": \"79.12.45.168-\"}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (8, '2020-06-11 09:00:58.701412', '3', 'Rule object (3)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (9, '2020-06-11 09:01:53.184528', '1', 'super', 2, '[{\"changed\": {\"fields\": [\"user_email_change_permission\"]}}]', 7, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (6, 'App', 'homepagesetting');
INSERT INTO `django_content_type` VALUES (7, 'App', 'customuser');
INSERT INTO `django_content_type` VALUES (8, 'App', 'auditentry');
INSERT INTO `django_content_type` VALUES (9, 'iprestrict', 'ipgroup');
INSERT INTO `django_content_type` VALUES (10, 'iprestrict', 'iprange');
INSERT INTO `django_content_type` VALUES (11, 'iprestrict', 'reloadrulesrequest');
INSERT INTO `django_content_type` VALUES (12, 'iprestrict', 'rule');
INSERT INTO `django_content_type` VALUES (13, 'iprestrict', 'iplocation');
INSERT INTO `django_content_type` VALUES (14, 'iprestrict', 'locationbasedipgroup');
INSERT INTO `django_content_type` VALUES (15, 'iprestrict', 'rangebasedipgroup');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-06-10 02:32:13.045086');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2020-06-10 02:32:13.101089');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2020-06-10 02:32:13.481111');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2020-06-10 02:32:13.496111');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2020-06-10 02:32:13.504112');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2020-06-10 02:32:13.510112');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2020-06-10 02:32:13.518113');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2020-06-10 02:32:13.520113');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2020-06-10 02:32:13.526113');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2020-06-10 02:32:13.533114');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2020-06-10 02:32:13.542114');
INSERT INTO `django_migrations` VALUES (12, 'App', '0001_initial', '2020-06-10 02:32:13.856132');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0001_initial', '2020-06-10 02:32:13.993140');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0002_logentry_remove_auto_add', '2020-06-10 02:32:14.005141');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0003_logentry_add_action_flag_choices', '2020-06-10 02:32:14.016141');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2020-06-10 02:32:14.117147');
INSERT INTO `django_migrations` VALUES (17, 'App', '0002_auto_20200611_1349', '2020-06-11 06:50:14.259736');
INSERT INTO `django_migrations` VALUES (18, 'App', '0003_auditentry', '2020-06-11 07:46:17.847122');
INSERT INTO `django_migrations` VALUES (19, 'App', '0004_auditentry_date_time', '2020-06-11 07:48:17.841985');
INSERT INTO `django_migrations` VALUES (20, 'iprestrict', '0001_initial', '2020-06-11 08:09:35.213047');
INSERT INTO `django_migrations` VALUES (21, 'iprestrict', '0002_initial_data', '2020-06-11 08:09:35.226047');
INSERT INTO `django_migrations` VALUES (22, 'iprestrict', '0003_add_ipgroup_types', '2020-06-11 08:09:35.259049');
INSERT INTO `django_migrations` VALUES (23, 'iprestrict', '0004_add_iplocation', '2020-06-11 08:09:35.314052');
INSERT INTO `django_migrations` VALUES (24, 'iprestrict', '0005_add_reverse_ipgroup', '2020-06-11 08:09:35.342054');
INSERT INTO `django_migrations` VALUES (25, 'iprestrict', '0006_auto_20161013_1327', '2020-06-11 08:09:35.359055');
INSERT INTO `django_migrations` VALUES (26, 'iprestrict', '0007_iprange_description', '2020-06-11 08:09:35.382056');
INSERT INTO `django_migrations` VALUES (27, 'App', '0005_auto_20200611_1521', '2020-06-11 08:21:41.045562');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `session_data` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3515azukw0gaxajgj2l4h6cydeh62c8u', 'YjE2MjI2N2JiNDg1MjVjMmUyNWRkYTg4YWRmNmMyMTlmZGM5ZDY1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjM0NGZiNmU4MDZmZWU5ZjFkNjc1MTJiODU2NGQ1ZjMzOGFjOTQwIn0=', '2020-06-25 08:57:43.546250');

-- ----------------------------
-- Table structure for iprestrict_ipgroup
-- ----------------------------
DROP TABLE IF EXISTS `iprestrict_ipgroup`;
CREATE TABLE `iprestrict_ipgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iprestrict_ipgroup
-- ----------------------------
INSERT INTO `iprestrict_ipgroup` VALUES (1, 'ALL', 'Matches all IP Addresses', 'range');
INSERT INTO `iprestrict_ipgroup` VALUES (2, 'localhost', 'IP address of localhost', 'range');
INSERT INTO `iprestrict_ipgroup` VALUES (3, '79.12.45.168', '79.12.45.168', 'range');

-- ----------------------------
-- Table structure for iprestrict_iplocation
-- ----------------------------
DROP TABLE IF EXISTS `iprestrict_iplocation`;
CREATE TABLE `iprestrict_iplocation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_codes` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `iprestrict_iplocation_ip_group_id_85131882`(`ip_group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for iprestrict_iprange
-- ----------------------------
DROP TABLE IF EXISTS `iprestrict_iprange`;
CREATE TABLE `iprestrict_iprange`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_ip` char(39) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cidr_prefix_length` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `last_ip` char(39) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ip_group_id` int(11) NOT NULL,
  `description` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `iprestrict_iprange_ip_group_id_859eff71`(`ip_group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iprestrict_iprange
-- ----------------------------
INSERT INTO `iprestrict_iprange` VALUES (1, '0.0.0.0', NULL, '255.255.255.255', 1, '');
INSERT INTO `iprestrict_iprange` VALUES (2, '::', NULL, 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff', 1, '');
INSERT INTO `iprestrict_iprange` VALUES (3, '127.0.0.1', NULL, NULL, 2, '');
INSERT INTO `iprestrict_iprange` VALUES (4, '::1', NULL, NULL, 2, '');
INSERT INTO `iprestrict_iprange` VALUES (5, '79.12.45.168', NULL, NULL, 3, '');

-- ----------------------------
-- Table structure for iprestrict_reloadrulesrequest
-- ----------------------------
DROP TABLE IF EXISTS `iprestrict_reloadrulesrequest`;
CREATE TABLE `iprestrict_reloadrulesrequest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for iprestrict_rule
-- ----------------------------
DROP TABLE IF EXISTS `iprestrict_rule`;
CREATE TABLE `iprestrict_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_pattern` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `action` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rank` int(11) NOT NULL,
  `ip_group_id` int(11) NOT NULL,
  `reverse_ip_group` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `iprestrict_rule_ip_group_id_c9f0905f`(`ip_group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iprestrict_rule
-- ----------------------------
INSERT INTO `iprestrict_rule` VALUES (1, 'ALL', 'A', 65535, 1, 0);
INSERT INTO `iprestrict_rule` VALUES (2, 'ALL', 'D', 65536, 1, 0);
INSERT INTO `iprestrict_rule` VALUES (3, '79.12.45.168', 'D', 1, 3, 0);

SET FOREIGN_KEY_CHECKS = 1;
