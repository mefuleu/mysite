/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : myweb

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 09/11/2020 07:21:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add product type first', 7, 'add_producttypefirst');
INSERT INTO `auth_permission` VALUES (26, 'Can change product type first', 7, 'change_producttypefirst');
INSERT INTO `auth_permission` VALUES (27, 'Can delete product type first', 7, 'delete_producttypefirst');
INSERT INTO `auth_permission` VALUES (28, 'Can view product type first', 7, 'view_producttypefirst');
INSERT INTO `auth_permission` VALUES (29, 'Can add product type second', 8, 'add_producttypesecond');
INSERT INTO `auth_permission` VALUES (30, 'Can change product type second', 8, 'change_producttypesecond');
INSERT INTO `auth_permission` VALUES (31, 'Can delete product type second', 8, 'delete_producttypesecond');
INSERT INTO `auth_permission` VALUES (32, 'Can view product type second', 8, 'view_producttypesecond');
INSERT INTO `auth_permission` VALUES (33, 'Can add product', 9, 'add_product');
INSERT INTO `auth_permission` VALUES (34, 'Can change product', 9, 'change_product');
INSERT INTO `auth_permission` VALUES (35, 'Can delete product', 9, 'delete_product');
INSERT INTO `auth_permission` VALUES (36, 'Can view product', 9, 'view_product');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$216000$tRu7MIKxWrOo$p15O1helxK+0RtqEUnEbXfwL7cyIaHDUvs9VTS5s/U8=', '2020-11-07 15:31:13.785609', 1, 'root', '', '', '', 1, 1, '2020-10-26 09:26:29.577134');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2020-10-26 09:30:32.205211', '1', 'Outdoor play equipment', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2020-10-26 09:31:13.677824', '2', 'Indoor play equipment', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2020-10-26 09:32:10.642373', '3', 'Other preschool education equipment', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2020-10-26 09:34:39.085593', '1', 'Non-standard customized amusement equipment', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (5, '2020-10-26 09:35:02.553095', '2', 'Stainless steel slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (6, '2020-10-26 09:35:25.753115', '3', 'Wooden slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (7, '2020-10-26 09:35:53.832479', '4', 'Plastic combined slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (8, '2020-10-26 09:36:20.116392', '5', 'Outdoor swing', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (9, '2020-10-26 09:36:46.317517', '6', 'overall plan', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (10, '2020-10-26 09:37:04.293765', '7', 'Outdoor rock climbing', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (11, '2020-10-26 09:37:22.176467', '8', 'Fitness Equipment', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (12, '2020-10-26 09:37:49.520625', '9', 'Outdoor rocking', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (13, '2020-10-26 11:14:37.477980', '10', 'Indoor stainless steel slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (14, '2020-10-26 11:15:04.177053', '11', 'Indoor children\'s playground', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (15, '2020-10-26 11:15:11.869851', '11', 'Indoor children\'s playground', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (16, '2020-10-26 11:15:47.034913', '12', 'Indoor trampoline park', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (17, '2020-10-26 11:16:15.122846', '13', 'Indoor family restaurant', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (18, '2020-10-26 11:16:47.554247', '14', 'Naughty Castle', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (19, '2020-10-26 11:17:22.647808', '15', 'Kindergarten furniture', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (20, '2020-10-26 11:17:39.981236', '16', 'kids toys', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (21, '2020-10-26 14:50:08.302249', '1', '{product_title: Parent-child restaurant manufacturer designs and decorates a dragon children\'s paradise theme restaurant}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (22, '2020-10-26 15:01:00.755300', '3', '{product_title: Parent-child restaurant manufacturer designs and decorates a dragon children\'s paradise theme restaurant}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (23, '2020-10-26 15:01:00.764301', '2', '{product_title: Parent-child restaurant manufacturer designs and decorates a dragon children\'s paradise theme restaurant}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (24, '2020-10-27 00:27:50.331436', '4', '{product_title: Parent-child restaurant manufacturer designs and decorates a dragon children\'s paradise theme restaurant}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (25, '2020-10-27 04:42:48.796454', '11', '{product_title: Huanghua pear pine antiseptic wood Sophora non standard customized amusement equipment}', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (26, '2020-10-27 11:15:22.734697', '11', '{product_title: Huanghua pear pine antiseptic wood Sophora non standard customized amusement equipment}', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (27, '2020-11-03 07:36:55.819624', '11', '{product_title: Huanghua pear pine antiseptic wood Sophora non standard customized amusement equipment}', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (28, '2020-11-04 15:35:17.858713', '11', '{product_title: Huanghua pear pine antiseptic wood Sophora non standard customized amusement equipment}', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (29, '2020-11-04 15:35:36.512966', '11', '{product_title: Huanghua pear pine antiseptic wood Sophora non standard customized amusement equipment}', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (30, '2020-11-04 16:04:48.001525', '41', '{product_title: Outdoor plastic net red rainbow slide large colorful dry snow slide}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (31, '2020-11-04 16:04:48.013556', '40', '{product_title: Large scale slide King Kong Theme kindergarten community fitness facilities 94A}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (32, '2020-11-04 16:04:48.020388', '39', '{product_title: Nature Theme Park kindergarten real estate community supporting fitness 072a}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (33, '2020-11-04 16:04:48.027032', '38', '{product_title: Sports Theme Park kindergarten community fitness facilities 45A}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (34, '2020-11-04 16:04:48.031636', '37', '{product_title: Kindergarten community park large sports theme slide 2019 new 29a}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (35, '2020-11-04 16:04:48.037061', '36', '{product_title: Kindergarten community park large children\'s slide sports plastic slide combination}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (36, '2020-11-04 16:04:48.041250', '35', '{product_title: Sports Theme Park kindergarten real estate community supporting fitness facilities 4}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (37, '2020-11-04 16:04:48.045301', '34', '{product_title: Kindergarten large combination slide jungle theme slide sp1810101}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (38, '2020-11-04 16:04:48.051119', '33', '{product_title: Kindergarten large combination slide jungle theme slide sp1811701}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (39, '2020-11-04 16:04:48.056139', '32', '{product_title: Kindergarten large combination slide jungle theme slide sp1811801}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (40, '2020-11-04 16:04:48.061076', '31', '{product_title: Kindergarten large combined slide jungle theme slide sp1808901}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (41, '2020-11-04 16:04:48.067549', '30', '{product_title: Shangde amusement kindergarten big jungle theme slide sp1810301}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (42, '2020-11-04 16:04:48.074692', '29', '{product_title: Shangde amusement kindergarten large slide jungle theme slide sp1810401}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (43, '2020-11-04 16:04:48.081067', '28', '{product_title: Shangde amusement kindergarten large slide jungle theme slide sp1809301}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (44, '2020-11-04 16:04:48.085863', '27', '{product_title: Large slide King Kong Theme kindergarten community supporting cultural tourism sports park}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (45, '2020-11-04 16:04:48.092050', '26', '{product_title: Nature Theme Park kindergarten community fitness facilities 067a}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (46, '2020-11-04 16:04:48.096807', '25', '{product_title: Wooden slide wooden slide sp1818605}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (47, '2020-11-04 16:04:48.101533', '24', '{product_title: Imported logs from Africa Huali wooden slide wooden slide sp1818903}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (48, '2020-11-04 16:04:48.106740', '23', '{product_title: Wooden slide wooden slide sp1818503}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (49, '2020-11-04 16:04:48.110980', '22', '{product_title: Wooden slide imported rosewood combined slide sp1818505}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (50, '2020-11-04 16:04:48.116105', '21', '{product_title: Wooden slide Shangde amusement imported rosewood combination slide sp1818801}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (51, '2020-11-04 16:04:48.121573', '20', '{product_title: Kindergarten wooden slide imported rosewood combined slide sp18801603}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (52, '2020-11-04 16:04:48.126195', '19', '{product_title: Kindergarten wooden slide imported rosewood combined slide sp1818701}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (53, '2020-11-04 16:04:48.130418', '18', '{product_title: Kindergarten wooden slide imported rosewood combined slide sp1818702}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (54, '2020-11-04 16:04:48.137011', '17', '{product_title: Kindergarten wooden slide imported rosewood combined slide sp1818801602}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (55, '2020-11-04 16:04:48.142324', '16', '{product_title: Wooden slide Shangde amusement imported rosewood combination slide sp1818601}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (56, '2020-11-04 16:04:48.147481', '15', '{product_title: Large outdoor super long game ladder stainless steel slide spss18008}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (57, '2020-11-04 16:04:48.152297', '14', '{product_title: Outdoor and outdoor stainless steel slide spss18011 in Shangde}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (58, '2020-11-04 16:04:48.157297', '13', '{product_title: Shangde amusement outdoor stainless steel slide spss18010}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (59, '2020-11-04 16:04:48.163228', '12', '{product_title: Outdoor large stainless steel combination slide without power for Shangde amusement}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (60, '2020-11-04 16:04:48.167220', '10', '{product_title: Outdoor non standard customized amusement equipment African rosewood pine}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (61, '2020-11-04 16:04:48.172257', '9', '{product_title: Non standard amusement park equipment personality tree house solid wood cabin site}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (62, '2020-11-04 16:04:48.176864', '8', '{product_title: Personalized amusement equipment: cute bear bee climbing net}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (63, '2020-11-04 16:04:48.183894', '7', '{product_title: Customized slide personalized slide stainless steel slide field customized children\'s play}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (64, '2020-11-04 16:04:48.188366', '6', '{product_title: Outdoor large expansion Diamond Tower matrix}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (65, '2020-11-04 16:04:48.192914', '5', '{product_title: Outdoor new air film interactive experience for children}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (66, '2020-11-04 16:04:48.198445', '11', '{product_title: Huanghua pear pine antiseptic wood Sophora non standard customized amusement equipment}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (67, '2020-11-04 16:23:35.138121', '62', '{product_title: Wooden slide wooden slide sp1818605}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (68, '2020-11-04 16:23:35.143717', '61', '{product_title: Imported logs from Africa Huali wooden slide wooden slide sp1818903}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (69, '2020-11-04 16:23:35.150490', '60', '{product_title: Wooden slide wooden slide sp1818503}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (70, '2020-11-04 16:23:35.155138', '59', '{product_title: Wooden slide imported rosewood combined slide sp1818505}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (71, '2020-11-04 16:23:35.158818', '58', '{product_title: Wooden slide Shangde amusement imported rosewood combination slide sp1818801}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (72, '2020-11-04 16:23:35.162983', '57', '{product_title: Kindergarten wooden slide imported rosewood combined slide sp18801603}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (73, '2020-11-04 16:23:35.167856', '56', '{product_title: Kindergarten wooden slide imported rosewood combined slide sp1818701}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (74, '2020-11-04 16:23:35.171823', '55', '{product_title: Kindergarten wooden slide imported rosewood combined slide sp1818702}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (75, '2020-11-04 16:23:35.176569', '54', '{product_title: Kindergarten wooden slide imported rosewood combined slide sp1818801602}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (76, '2020-11-04 16:23:35.181031', '53', '{product_title: Wooden slide Shangde amusement imported rosewood combination slide sp1818601}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (77, '2020-11-04 16:23:35.185444', '52', '{product_title: Large outdoor super long game ladder stainless steel slide spss18008}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (78, '2020-11-04 16:23:35.190752', '51', '{product_title: Outdoor and outdoor stainless steel slide spss18011 in Shangde}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (79, '2020-11-04 16:23:35.194916', '50', '{product_title: Shangde amusement outdoor stainless steel slide spss18010}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (80, '2020-11-04 16:23:35.199743', '49', '{product_title: Outdoor large stainless steel combination slide without power for Shangde amusement}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (81, '2020-11-04 16:25:46.193986', '70', '{product_title: Large outdoor super long game ladder stainless steel slide spss18008}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (82, '2020-11-04 16:25:46.211143', '69', '{product_title: Outdoor and outdoor stainless steel slide spss18011 in Shangde}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (83, '2020-11-04 16:25:46.218353', '68', '{product_title: Shangde amusement outdoor stainless steel slide spss18010}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (84, '2020-11-04 16:25:46.224817', '67', '{product_title: Outdoor large stainless steel combination slide without power for Shangde amusement}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (85, '2020-11-04 16:25:46.230193', '66', '{product_title: Large outdoor super long game ladder stainless steel slide spss18008}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (86, '2020-11-04 16:25:46.235432', '65', '{product_title: Outdoor and outdoor stainless steel slide spss18011 in Shangde}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (87, '2020-11-04 16:25:46.240629', '64', '{product_title: Shangde amusement outdoor stainless steel slide spss18010}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (88, '2020-11-04 16:25:46.245622', '63', '{product_title: Outdoor large stainless steel combination slide without power for Shangde amusement}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (89, '2020-11-04 16:25:46.249522', '48', '{product_title: Huanghua pear pine antiseptic wood Sophora non standard customized amusement equipment}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (90, '2020-11-04 16:25:46.255910', '47', '{product_title: Outdoor non standard customized amusement equipment African rosewood pine}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (91, '2020-11-04 16:25:46.260855', '46', '{product_title: Non standard amusement park equipment personality tree house solid wood cabin site}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (92, '2020-11-04 16:25:46.266241', '45', '{product_title: Personalized amusement equipment: cute bear bee climbing net}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (93, '2020-11-04 16:25:46.272254', '44', '{product_title: Customized slide personalized slide stainless steel slide field customized children\'s play}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (94, '2020-11-04 16:25:46.278286', '43', '{product_title: Outdoor large expansion Diamond Tower matrix}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (95, '2020-11-04 16:25:46.283962', '42', '{product_title: Outdoor new air film interactive experience for children}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (96, '2020-11-04 16:39:29.007612', '77', '{product_title: Huanghua pear pine antiseptic wood Sophora non standard customized amusement equipment}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (97, '2020-11-04 16:39:29.022089', '76', '{product_title: Outdoor non standard customized amusement equipment African rosewood pine}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (98, '2020-11-04 16:39:29.027228', '75', '{product_title: Non standard amusement park equipment personality tree house solid wood cabin site}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (99, '2020-11-04 16:39:29.032937', '74', '{product_title: Personalized amusement equipment: cute bear bee climbing net}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (100, '2020-11-04 16:39:29.037995', '73', '{product_title: Customized slide personalized slide stainless steel slide field customized children\'s play}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (101, '2020-11-04 16:39:29.042351', '72', '{product_title: Outdoor large expansion Diamond Tower matrix}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (102, '2020-11-04 16:39:29.047181', '71', '{product_title: Outdoor new air film interactive experience for children}', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (103, '2020-11-04 17:29:06.665723', '16', 'kids toys', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (104, '2020-11-04 17:29:06.679758', '15', 'Kindergarten furniture', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (105, '2020-11-04 17:29:06.685104', '14', 'Naughty Castle', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (106, '2020-11-04 17:29:06.689881', '13', 'Indoor family restaurant', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (107, '2020-11-04 17:29:06.695996', '12', 'Indoor trampoline park', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (108, '2020-11-04 17:29:06.700745', '11', 'Indoor children\'s playground', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (109, '2020-11-04 17:29:06.705893', '10', 'Indoor stainless steel slide', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (110, '2020-11-04 17:29:06.710739', '9', 'Outdoor rocking', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (111, '2020-11-04 17:29:06.716490', '8', 'Fitness Equipment', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (112, '2020-11-04 17:29:06.721337', '7', 'Outdoor rock climbing', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (113, '2020-11-04 17:29:06.725703', '6', 'overall plan', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (114, '2020-11-04 17:29:06.730628', '5', 'Outdoor swing', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (115, '2020-11-04 17:29:06.734389', '4', 'Plastic combined slide', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (116, '2020-11-04 17:29:06.738946', '3', 'Wooden slide', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (117, '2020-11-04 17:29:06.743358', '2', 'Stainless steel slide', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (118, '2020-11-04 17:29:06.747825', '1', 'Non-standard customized amusement equipment', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (119, '2020-11-04 17:52:36.662438', '17', 'Non-standard customized amusement equipment', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (120, '2020-11-05 08:10:17.984835', '18', 'Non-standard customized amusement equipment', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (121, '2020-11-05 08:29:48.248306', '19', 'Stainless steel slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (122, '2020-11-05 08:39:00.353414', '20', 'Wooden slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (123, '2020-11-05 08:40:15.697464', '21', 'Plastic combined slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (124, '2020-11-05 08:46:34.613089', '2', 'Stainless steel slide', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (125, '2020-11-05 08:46:45.841891', '22', 'Outdoor swing', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (126, '2020-11-05 08:53:29.603257', '22', 'Outdoor swing', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (127, '2020-11-05 08:53:29.612283', '21', 'Plastic combined slide', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (128, '2020-11-05 08:53:29.617186', '3', 'Wooden slide', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (129, '2020-11-05 08:53:29.621274', '1', 'Non-standard customized amusement equipment', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (130, '2020-11-05 08:54:18.755591', '23', 'Non-standard customized amusement equipment', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (131, '2020-11-05 08:54:33.937767', '24', 'Stainless steel slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (132, '2020-11-05 08:54:47.917557', '25', 'Wooden slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (133, '2020-11-05 09:21:34.615449', '26', 'Non-standard customized amusement equipment', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (134, '2020-11-05 09:27:23.234409', '2', 'Stainless steel slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (135, '2020-11-05 11:50:45.885989', '3', 'Wooden slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (136, '2020-11-05 11:50:54.520116', '4', 'Plastic combined slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (137, '2020-11-05 11:51:02.973128', '5', 'Outdoor swing', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (138, '2020-11-05 11:51:12.123885', '6', 'overall plan', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (139, '2020-11-05 11:51:46.316772', '7', 'Fitness Equipment', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (140, '2020-11-05 11:52:44.609077', '7', 'Outdoor rock climbing', 2, '[{\"changed\": {\"fields\": [\"Second typename\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (141, '2020-11-05 11:52:54.919240', '8', 'Fitness Equipment', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (142, '2020-11-05 11:53:45.055193', '9', 'Outdoor rocking', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (143, '2020-11-05 11:54:21.018318', '10', 'Indoor stainless steel slide', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (144, '2020-11-05 11:54:35.687729', '11', 'Indoor children\'s playground', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (145, '2020-11-05 11:55:07.635553', '12', 'Indoor trampoline park', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (146, '2020-11-05 11:55:22.876449', '13', 'Indoor family restaurant', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (147, '2020-11-05 11:56:11.425588', '14', 'Naughty Castle', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (148, '2020-11-05 11:56:43.142825', '15', 'Kindergarten furniture', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (149, '2020-11-05 11:56:49.625184', '15', 'Kindergarten furniture', 2, '[{\"changed\": {\"fields\": [\"Typename_first\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (150, '2020-11-05 11:57:21.787091', '16', 'kids toys', 1, '[{\"added\": {}}]', 8, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (9, 'product', 'product');
INSERT INTO `django_content_type` VALUES (7, 'product', 'producttypefirst');
INSERT INTO `django_content_type` VALUES (8, 'product', 'producttypesecond');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-10-26 09:25:25.142624');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-10-26 09:25:25.373123');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-10-26 09:25:26.089263');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-10-26 09:25:26.261759');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-10-26 09:25:26.273626');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-10-26 09:25:26.388317');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-10-26 09:25:26.463086');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-10-26 09:25:26.496996');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-10-26 09:25:26.514996');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-10-26 09:25:26.610740');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-10-26 09:25:26.617759');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-10-26 09:25:26.639664');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-10-26 09:25:26.734362');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-10-26 09:25:26.838122');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-10-26 09:25:26.876016');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-10-26 09:25:26.893931');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2020-10-26 09:25:26.993715');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2020-10-26 09:25:27.042583');
INSERT INTO `django_migrations` VALUES (19, 'product', '0001_initial', '2020-10-26 09:25:56.901694');
INSERT INTO `django_migrations` VALUES (20, 'product', '0002_auto_20201026_2007', '2020-10-26 12:08:02.345045');
INSERT INTO `django_migrations` VALUES (21, 'product', '0003_auto_20201027_0932', '2020-10-27 01:32:55.678937');
INSERT INTO `django_migrations` VALUES (22, 'product', '0004_auto_20201027_0936', '2020-10-27 01:36:33.524338');
INSERT INTO `django_migrations` VALUES (23, 'product', '0005_auto_20201027_1242', '2020-10-27 04:42:41.723367');
INSERT INTO `django_migrations` VALUES (24, 'product', '0006_auto_20201104_2350', '2020-11-04 15:51:02.796644');
INSERT INTO `django_migrations` VALUES (25, 'product', '0007_auto_20201105_0027', '2020-11-04 16:27:17.628051');
INSERT INTO `django_migrations` VALUES (26, 'product', '0008_auto_20201105_0028', '2020-11-04 16:28:18.336634');
INSERT INTO `django_migrations` VALUES (27, 'product', '0002_auto_20201105_2003', '2020-11-05 12:03:17.880484');
INSERT INTO `django_migrations` VALUES (28, 'product', '0003_auto_20201106_2318', '2020-11-06 15:19:07.647174');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3rovgsr0h62tcx5d5z4bzu1ujq97ivxh', '.eJxVjDkOwjAUBe_iGlle4o2SnjNY_ktwADlSnFSIu0OkFNC-mXkvkcu21rx1XvJE4iy0OP1uUPDBbQd0L-02S5zbukwgd0UetMvrTPy8HO7fQS29fmvUOGoY2QaMiSxEHygA2IR2oOI0egY1RDDstAnsnU1AHKLyTiVlonh_AAH3N9w:1kbJ2e:6NiqKOcKm_U6tFMvBKAQliiVl4T6cvLmb5APIX6xm-Y', '2020-11-21 07:53:44.223723');
INSERT INTO `django_session` VALUES ('9i0a8op3nkqw7f6v5932dm6x7266mem2', '.eJzFkstOwzAQRX8l8rqPpGle3YGEWCGxYUVRZXsmrSFxKttZAOq_EzepVAzpAyp1FWvm-thznE-yoLVZLWqNaiGAzEhABvs1RvkbStuAVyqX1YhX0ijBRjYy6rp69FABFrdd9htgRfWq2c0DngcsxzDhaQYhS-MEEsbCjIdToFHAY2T-NGUTjIJJgnEUZgwwSf048jN_klpoibLWDev5c04kLXFOZt6c3DRHoTSCUyMq6VEJni1VSnxsK3MyaFKC25XN51R7OR3qlcAChrQwbaC0E2gb-Y6_V1W91j0QO6Ee8mrZ9mtVtO0xhVLIsbUwXlrAuA1QgKf-TNPtckwhBa7qkv1yowsMvBl4fxpy82ITKMAGAt-fuKAnm_3JUTvOAU-2fUTTNnI9S8eHc_2EbiFwmXcgjLdWFdTcbC-5W5v3NfacxYXiBR7-bR_3MF4ulDZ9N9-nuQ_TXWb3tbAtq_-denec-Gz_8eG6Pd-B-1zRQaTGhgMX8trCzhLbbbm22dM0uGrjHuYFdJ4s8YrqztWVuIXp5oVsvgAeEYjG:1kbKox:PJ9obem5OBIxl6noiPfhpSUK3Mgi5_rOqj5TXPsSQXs', '2020-11-21 09:47:43.154692');
INSERT INTO `django_session` VALUES ('g0mkfcjhdq9kturaeomdswpryh3xvxo7', '.eJxVjs0OgjAQhN-lZ21aSv88evcZyO52oagpCYWLxncXEg56nW_my7xFB-uSu7Xy3I1JXIQWp98MgR5cdpDuUIZJ0lSWeUS5V-RBq7xNiZ_Xo_snyFDztiZNvcaejacQk8HgfPKIJpJpE1hNjlG1ARu2uvHsrImY2AflrIqqCbv0uR1YYeBN98rnDKWKzxce6D8m:1kb1r3:nwC4MCGm2UNRWC4Z6FCxZGcDpokYCWDKSfkBH_of4ZY', '2020-11-20 13:32:37.162692');

-- ----------------------------
-- Table structure for product_product
-- ----------------------------
DROP TABLE IF EXISTS `product_product`;
CREATE TABLE `product_product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_specifications` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usage_area` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicable_scene` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_age` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering_hotline` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create` datetime(6) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `typename_second_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `typename_second_id`(`typename_second_id`) USING BTREE,
  CONSTRAINT `product_product_ibfk_1` FOREIGN KEY (`typename_second_id`) REFERENCES `product_producttypesecond` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_product
-- ----------------------------
INSERT INTO `product_product` VALUES (1, 'Outdoor new air film interactive experience for children', 'Customizable', 'Customizable', 'Outdoor, indoor', '3-17 years old', '18958833302', '2020-11-05 12:05:52.875774', '', 1);
INSERT INTO `product_product` VALUES (2, 'Outdoor large expansion Diamond Tower matrix', 'Customizable', 'Customizable', 'outdoors', 'Over 5 years old', '18958833302', '2020-11-05 12:05:52.890737', '', 1);
INSERT INTO `product_product` VALUES (3, 'Customized slide personalized slide stainless steel slide field customized children\'s play', 'According to site design', '', '', '6+', '18958833302', '2020-11-05 12:05:52.894727', '', 1);
INSERT INTO `product_product` VALUES (4, 'Personalized amusement equipment: cute bear bee climbing net', 'Customized according to the site', '', '', '3-12', '18958833302', '2020-11-05 12:05:52.899718', '', 1);
INSERT INTO `product_product` VALUES (5, 'Non standard amusement park equipment personality tree house solid wood cabin site', 'On site customization', '', '', '6+', '18958833302', '2020-11-05 12:05:52.903701', '', 1);
INSERT INTO `product_product` VALUES (6, 'Outdoor non standard customized amusement equipment African rosewood pine', 'According to site design', '', '', '6+', '18958833302', '2020-11-05 12:05:52.906693', '', 1);
INSERT INTO `product_product` VALUES (7, 'Huanghua pear pine antiseptic wood Sophora non standard customized amusement equipment', 'It can be customized according to customer site', '', '', '6+', '18958833302', '2020-11-05 12:05:52.909696', '', 1);
INSERT INTO `product_product` VALUES (8, 'Outdoor large stainless steel combination slide without power for Shangde amusement', 'Customized according to specific site', 'Customized according to specific site', 'Public places such as shopping malls, supermarkets, children\'s centers, playgrounds, communities, resorts, etc', '3-15 years old', '18958833302', '2020-11-05 12:05:52.911679', '', 2);
INSERT INTO `product_product` VALUES (9, 'Shangde amusement outdoor stainless steel slide spss18010', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-15 years old', '18958833302', '2020-11-05 12:05:52.914671', '', 2);
INSERT INTO `product_product` VALUES (10, 'Outdoor and outdoor stainless steel slide spss18011 in Shangde', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-15 years old', '18958833302', '2020-11-05 12:05:52.917665', '', 2);
INSERT INTO `product_product` VALUES (11, 'Large outdoor super long game ladder stainless steel slide spss18008', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-15 years old', '18958833302', '2020-11-05 12:05:52.919657', '', 2);
INSERT INTO `product_product` VALUES (12, 'Wooden slide Shangde amusement imported rosewood combination slide sp1818601', '1140*960*450cm', '1540*1360cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.922651', '', 3);
INSERT INTO `product_product` VALUES (13, 'Kindergarten wooden slide imported rosewood combined slide sp1818801602', '1200*760*560cm', '1600*1160cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.924644', '', 3);
INSERT INTO `product_product` VALUES (14, 'Kindergarten wooden slide imported rosewood combined slide sp1818702', '570*530*480cm', '970*930cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-15 years old', '18958833302', '2020-11-05 12:05:52.927636', '', 3);
INSERT INTO `product_product` VALUES (15, 'Kindergarten wooden slide imported rosewood combined slide sp1818701', '730*550*400cm', '1130*950cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.929631', '', 3);
INSERT INTO `product_product` VALUES (16, 'Kindergarten wooden slide imported rosewood combined slide sp18801603', '1160*640*550cm', '1560*1040cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.932626', '', 3);
INSERT INTO `product_product` VALUES (17, 'Wooden slide Shangde amusement imported rosewood combination slide sp1818801', '1120*220*370cm', '1520*620cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.936613', '', 3);
INSERT INTO `product_product` VALUES (18, 'Wooden slide imported rosewood combined slide sp1818505', '1140*960*450cm', '1540*1360cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.940603', '', 3);
INSERT INTO `product_product` VALUES (19, 'Wooden slide wooden slide sp1818503', '1100*650*450cm', '1500*1050cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.942597', '', 3);
INSERT INTO `product_product` VALUES (20, 'Imported logs from Africa Huali wooden slide wooden slide sp1818903', '3000*1500*490cm', '3400*1900cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.945589', '', 3);
INSERT INTO `product_product` VALUES (21, 'Wooden slide wooden slide sp1818605', '1500*810*550cm', '1900*1210cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.948715', '', 3);
INSERT INTO `product_product` VALUES (22, 'Nature Theme Park kindergarten community fitness facilities 067a', '1500*680*520cm', '', '', '3-12 years old', '18958833302', '2020-11-05 12:05:52.950600', '', 4);
INSERT INTO `product_product` VALUES (23, 'Large slide King Kong Theme kindergarten community supporting cultural tourism sports park', '1090*830*530cm', '', '', '3-12 years old', '18958833302', '2020-11-05 12:05:52.953567', '', 4);
INSERT INTO `product_product` VALUES (24, 'Shangde amusement kindergarten large slide jungle theme slide sp1809301', '1250*320*510cm', '1650*720cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.955561', '', 4);
INSERT INTO `product_product` VALUES (25, 'Shangde amusement kindergarten large slide jungle theme slide sp1810401', '830*420*410cm', '1230*820cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.956558', '', 4);
INSERT INTO `product_product` VALUES (26, 'Shangde amusement kindergarten big jungle theme slide sp1810301', '860*750*410cm', '1260*1150cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.958553', '', 4);
INSERT INTO `product_product` VALUES (27, 'Kindergarten large combined slide jungle theme slide sp1808901', '1250*860*510cm', '1650*1260cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.960548', '', 4);
INSERT INTO `product_product` VALUES (28, 'Kindergarten large combination slide jungle theme slide sp1811801', '770*440*410cm', '1170*840cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.962542', '', 4);
INSERT INTO `product_product` VALUES (29, 'Kindergarten large combination slide jungle theme slide sp1811701', '870*600*510cm', '1270*1000cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.964538', '', 4);
INSERT INTO `product_product` VALUES (30, 'Kindergarten large combination slide jungle theme slide sp1810101', '1200*870*510cm', '1600*1270cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:52.965535', '', 4);
INSERT INTO `product_product` VALUES (31, 'Sports Theme Park kindergarten real estate community supporting fitness facilities 4', '1020*560*520cm', '', '', '3-12 years old', '18958833302', '2020-11-05 12:05:52.967530', '', 4);
INSERT INTO `product_product` VALUES (32, 'Kindergarten community park large children\'s slide sports plastic slide combination', '940*820*530cm', '', '', '3-12 years old', '18958833302', '2020-11-05 12:05:52.969525', '', 4);
INSERT INTO `product_product` VALUES (33, 'Kindergarten community park large sports theme slide 2019 new 29a', '1100*930*530cm', '', '', '3-12 years old', '18958833302', '2020-11-05 12:05:52.971519', '', 4);
INSERT INTO `product_product` VALUES (34, 'Shangde outdoor swing C', 'Diverse, customizable', '', '', '', '18958833302', '2020-11-05 12:05:52.973514', '', 5);
INSERT INTO `product_product` VALUES (35, 'Shangde amusement outdoor multifunctional swing', 'Diverse, customizable', '', '', '', '18958833302', '2020-11-05 12:05:52.977507', '', 5);
INSERT INTO `product_product` VALUES (36, 'Shangde outdoor children\'s multifunctional swing a', 'Diverse, customizable', '', '', '', '18958833302', '2020-11-05 12:05:52.980497', '', 5);
INSERT INTO `product_product` VALUES (37, 'Non standard playground design of new large playground construction project in kindergarten', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-12 years old', '18958833302', '2020-11-05 12:05:52.983487', '', 6);
INSERT INTO `product_product` VALUES (38, 'Kindergarten large playground construction project non standard playground facilities 4', 'According to the actual site', 'According to actual size', 'Children\'s Park, theme park, residential community, Park', '3-12 years old', '18958833302', '2020-11-05 12:05:52.986479', '', 6);
INSERT INTO `product_product` VALUES (39, 'Non standard playground design of new large playground construction project in kindergarten', 'According to the actual site', 'According to actual size', 'Children\'s Park, theme park, residential community, park, resort, hotel, kindergarten, school', '3-12 years old', '18958833302', '2020-11-05 12:05:52.988474', '', 6);
INSERT INTO `product_product` VALUES (40, 'Equipment customization of kindergarten new large playground construction project', 'According to the actual site', 'According to actual size', 'Children\'s Park, theme park, residential community, park, resort, hotel, kindergarten, school', '3-12 years old', '18958833302', '2020-11-05 12:05:52.990474', '', 6);
INSERT INTO `product_product` VALUES (41, 'Non standard amusement equipment customization for new kindergarten park construction project 8', 'According to the actual site', 'According to actual size', 'Children\'s Park, theme park, residential community, park, resort, hotel, kindergarten, school', '3-12 years old', '18958833302', '2020-11-05 12:05:52.992462', '', 6);
INSERT INTO `product_product` VALUES (42, 'Non standard amusement park equipment customization of new kindergarten park construction project', 'According to the actual site', 'According to actual size', 'Children\'s Park, theme park, residential community, park, resort, hotel, kindergarten, school', '3-12 years old', '18958833302', '2020-11-05 12:05:52.994457', '', 6);
INSERT INTO `product_product` VALUES (43, 'Overall site planning of new kindergarten park construction project 10', 'According to the actual site', 'According to actual size', 'Children\'s Park, theme park, residential community, park, resort, hotel, kindergarten, school', '3-12 years old', '18958833302', '2020-11-05 12:05:52.996452', '', 6);
INSERT INTO `product_product` VALUES (44, 'Overall site planning for new construction project of kindergarten Park', 'According to the actual site', 'According to actual size', 'Children\'s Park, theme park, residential community, park, resort, hotel, kindergarten, school', '3-12 years old', '18958833302', '2020-11-05 12:05:52.998446', '', 6);
INSERT INTO `product_product` VALUES (45, 'Overall site planning for new construction project of kindergarten Park', 'According to the actual site', 'According to actual size', 'Children\'s Park, theme park, residential community, park, resort, hotel, kindergarten, school', '3-12 years old', '18958833302', '2020-11-05 12:05:53.000442', '', 6);
INSERT INTO `product_product` VALUES (46, 'Physical training and development of outdoor children\'s rope net climbing frame sp1815902', '520*520*550cm', '920*920cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:53.002436', '', 7);
INSERT INTO `product_product` VALUES (47, 'Physical training of rope net climbing frame in outdoor kindergarten sp1815901', '360*400*250cm', '760*800cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:53.004431', '', 7);
INSERT INTO `product_product` VALUES (48, 'Outdoor school rope net climbing frame physical training development sp1815802', '680*680*260cm', '1080*1080cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:53.006430', '', 7);
INSERT INTO `product_product` VALUES (49, 'Physical training of rope net climbing frame in outdoor children\'s paradise sp1815702', '360*360*180cm', '760*760cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:53.008423', '', 7);
INSERT INTO `product_product` VALUES (50, 'Outdoor park rope net climbing frame physical training expansion sp1815801', '320*320*200cm', '720*720cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:53.010416', '', 7);
INSERT INTO `product_product` VALUES (51, 'Physical training of rope net climbing frame in outdoor children\'s paradise sp1815701', '600*600*300cm', '1000*1000cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:53.012414', '', 7);
INSERT INTO `product_product` VALUES (52, 'Universal fitness outdoor rope net climbing frame physical training expansion sp1813401', '1780*800*320cm', '2180*1200cm', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards', '3-15 years old', '18958833302', '2020-11-05 12:05:53.014404', '', 7);
INSERT INTO `product_product` VALUES (53, 'Shangde recreation outdoor fitness equipment c series', 'Diverse, customizable', '', '', '', '18958833302', '2020-11-05 12:05:53.016398', '', 8);
INSERT INTO `product_product` VALUES (54, 'Shangde amusement outdoor fitness equipment D', 'Diverse, customizable', '', '', '', '18958833302', '2020-11-05 12:05:53.018393', '', 8);
INSERT INTO `product_product` VALUES (55, 'Shangde amusement outdoor fitness equipment e', 'Diverse, customizable', '', '', '', '18958833302', '2020-11-05 12:05:53.020394', '', 8);
INSERT INTO `product_product` VALUES (56, 'Shangde recreation outdoor fitness equipment f', 'Diverse, customizable', '', '', '', '18958833302', '2020-11-05 12:05:53.022388', '', 8);
INSERT INTO `product_product` VALUES (57, 'Shangde amusement outdoor fitness equipment G', 'Diverse, customizable', '', '', '', '18958833302', '2020-11-05 12:05:53.024385', '', 8);
INSERT INTO `product_product` VALUES (58, 'Outdoor fitness equipment B series of Shangde amusement Community Park', 'Diverse, customizable', '', '', '', '18958833302', '2020-11-05 12:05:53.028366', '', 8);
INSERT INTO `product_product` VALUES (59, 'Shangde outdoor fitness equipment series a', 'Diverse, customizable', '', '', '', '18958833302', '2020-11-05 12:05:53.030362', '', 8);
INSERT INTO `product_product` VALUES (60, 'Spring single side PE board crocodile and other rocking music sp18619', 'varied', '', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-12 years old', '18958833302', '2020-11-05 12:05:53.033354', '', 9);
INSERT INTO `product_product` VALUES (61, 'Spring PE board single side motorcycle boat rock music sp18602', 'varied', '', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-12 years old', '18958833302', '2020-11-05 12:05:53.036346', '', 9);
INSERT INTO `product_product` VALUES (62, 'Non standard customized indoor seven color stainless steel slide spss18003', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-15 years old', '18958833302', '2020-11-05 12:05:53.038342', '', 10);
INSERT INTO `product_product` VALUES (63, 'Shangde amusement fire ladder escape ladder stainless steel slide spss18007', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-15 years old', '18958833302', '2020-11-05 12:05:53.040335', '', 10);
INSERT INTO `product_product` VALUES (64, 'Super long spiral stainless steel slide for fire safety in public places spss180', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-15 years old', '18958833302', '2020-11-05 12:05:53.042330', '', 10);
INSERT INTO `product_product` VALUES (65, 'Fire escape ladder play ladder stainless steel slide spss18006', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-15 years old', '18958833302', '2020-11-05 12:05:53.045322', '', 10);
INSERT INTO `product_product` VALUES (66, 'Shangde amusement outdoor color painted stainless steel slide spss18005', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-15 years old', '18958833302', '2020-11-05 12:05:53.047316', '', 10);
INSERT INTO `product_product` VALUES (67, 'Stainless steel slide spss18004 in public places of Shangde amusement indoor shopping mall', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-15 years old', '18958833302', '2020-11-05 12:05:53.049311', '', 10);
INSERT INTO `product_product` VALUES (68, 'Seven color super long stainless steel spss18009', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3 years old+', '18958833302', '2020-11-05 12:05:53.051306', '', 10);
INSERT INTO `product_product` VALUES (69, 'Shopping mall naughty castle English style forest wind ocean style children\'s paradise', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-12 years old', '18958833302', '2020-11-05 12:05:53.054298', '', 11);
INSERT INTO `product_product` VALUES (70, 'British style ocean style naughty castle with million ball pool sptqb19108', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-12 years old', '18958833302', '2020-11-05 12:05:53.056292', '', 11);
INSERT INTO `product_product` VALUES (71, 'Shopping mall theme naughty castle ocean forest candy development series with sand pool ball', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-12 years old', '18958833302', '2020-11-05 12:05:53.058286', '', 11);
INSERT INTO `product_product` VALUES (72, 'Shangde indoor trampoline Park sp20022901', 'Customized according to specific site', 'Customized according to specific site', 'Public places such as shopping malls, supermarkets, children\'s centers, playgrounds, communities, resorts, etc', '3-70 years old', '18958833302', '2020-11-05 12:05:53.060282', '', 12);
INSERT INTO `product_product` VALUES (73, 'Parent child restaurant manufacturer designs and decorates the theme restaurant of children\'s paradise', 'Customized according to the site', 'According to actual size', '', 'unlimited', '18958833302', '2020-11-05 12:05:53.063274', '', 13);
INSERT INTO `product_product` VALUES (74, 'Children\'s theme naughty castle physical development smart and brave breakthrough sptqb19106', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-12', '18958833302', '2020-11-05 12:05:53.064271', '', 14);
INSERT INTO `product_product` VALUES (75, 'Indoor children\'s naughty castle maze series primitive tribal paradise sptqb19105', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-12', '18958833302', '2020-11-05 12:05:53.066266', '', 14);
INSERT INTO `product_product` VALUES (76, 'Indoor children\'s paradise theme naughty castle British style series sptqb19104', 'According to the actual site', 'According to actual size', 'Kindergartens, schools, children\'s parks, theme parks, residential communities, parks, resorts, hotels, courtyards, shopping malls, playgrounds', '3-12', '18958833302', '2020-11-05 12:05:53.069260', '', 14);
INSERT INTO `product_product` VALUES (77, 'Detachable kindergarten nap bed plastic bed main style sp1820801', '138*60*26cm', '', 'Kindergartens, early education institutions, training centers, schools, families, bedrooms', '3-12 years old', '18958833302', '2020-11-05 12:05:53.071255', '', 15);
INSERT INTO `product_product` VALUES (78, 'Note plastic lift table luxury kindergarten rectangular table sp1827804', '120*60*50-60cm', '', 'Kindergartens, early education institutions, training centers, schools', '3-12 years old', '18958833302', '2020-11-05 12:05:53.074249', '', 15);
INSERT INTO `product_product` VALUES (79, 'Six beam plastic lifting table rectangular table sp1827803 / 4', '120 * 60 * 48-60cm height: 7 gears', '', 'Kindergartens, early education institutions, training centers, schools, families', '3-12 years old', '18958833302', '2020-11-05 12:05:53.077241', '', 15);
INSERT INTO `product_product` VALUES (80, 'Kindergarten solid wood Mongolian pine wood bed laminated bed', '130*60*18cm,138*60*20cm', '', '', '3-6 years old', '18958833302', '2020-11-05 12:05:53.080233', '', 15);
INSERT INTO `product_product` VALUES (81, 'Rubber wood mortise tenon structure oak solid wood chair in kindergarten', '56cm*28cm*29cm', '', 'Kindergarten, family and early education center', '3-12 years old', '18958833302', '2020-11-05 12:05:53.083225', '', 15);
INSERT INTO `product_product` VALUES (82, 'Plastic rectangular table for six', 'Specification 120 * 60 * 50cm', '', 'Kindergartens, early education institutions, training centers, schools, families', '3-12 years old', '18958833302', '2020-11-05 12:05:53.086212', '', 15);
INSERT INTO `product_product` VALUES (83, 'Adjustable steel leg rectangular table lift table', '120*60*37-62cm', '', 'Kindergarten, early education institutions, training centers, schools, families', '3-12 years old', '18958833302', '2020-11-05 12:05:53.089209', '', 15);
INSERT INTO `product_product` VALUES (84, 'Kindergarten disassembly plastic bed - kindergarten nap bed', '138*62*26cm', '', 'Kindergartens, early education institutions, training centers, schools, families, bedrooms', '3-12 years old', '18958833302', '2020-11-05 12:05:53.091201', '', 15);
INSERT INTO `product_product` VALUES (85, 'Four layer push broaching machine for Pinus sylvestris var. mongolica', '4-person 150 * 65 * 100cm, 8-person 150 * 90 * 100cm', '', 'Kindergartens, early education institutions, training centers, schools, families, bedrooms', '3-12 years old', '18958833302', '2020-11-05 12:05:53.093196', '', 15);
INSERT INTO `product_product` VALUES (86, 'Log Mongolian pine double deck table', '120*60*55cm', '', 'Kindergartens, early education institutions, training centers, schools, families', '3-12 years old', '18958833302', '2020-11-05 12:05:53.095188', '', 15);
INSERT INTO `product_product` VALUES (87, 'Single log square foot laminated bed of Pinus sylvestris var. mongolica_ Kindergarten solid wood bed Square Leg Bed', '130 * 58 * 20cm and more', 'According to product specification', 'Kindergartens, early education institutions, training centers, schools, families', '3-6 years old', '18958833302', '2020-11-05 12:05:53.097183', '', 15);
INSERT INTO `product_product` VALUES (88, 'Solid wood kindergarten tables and chairs single side children\'s Scotch pine table', '120 * 60 * 55cm, various specifications', 'According to product specification', 'Kindergartens, kindergartens, tutorial classes, families and early education centers', '2-12 years old', '18958833302', '2020-11-05 12:05:53.099184', '', 15);
INSERT INTO `product_product` VALUES (89, 'Magic tower puzzle Star Toys make up soft square toothed toys', 'varied', '', 'Kindergartens, early education institutions, training centers, schools, families', '3-12 years old', '18958833302', '2020-11-05 12:05:53.101178', '', 16);
INSERT INTO `product_product` VALUES (90, 'Leaves and snowflakes three dimensional flower arrangement', 'varied', 'According to the actual situation of the site', 'Kindergartens, early education institutions, training centers, schools, families', '3-12 years old', '18958833302', '2020-11-05 12:05:53.103172', '', 16);
INSERT INTO `product_product` VALUES (91, 'Sports Theme Park kindergarten community fitness facilities 45A', '900*550*400cm', '', '', '3-12 years old', '18958833302', '2020-11-05 12:21:01.009400', '', 4);
INSERT INTO `product_product` VALUES (92, 'Nature Theme Park kindergarten real estate community supporting fitness 072a', '1150*720*520cm', '', '', '3-12 years old', '18958833302', '2020-11-05 12:21:01.019378', '', 4);
INSERT INTO `product_product` VALUES (93, 'Large scale slide King Kong Theme kindergarten community fitness facilities 94A', '1100*630*530cm', '', '', '3-12 years old', '18958833302', '2020-11-05 12:21:01.022369', '', 4);
INSERT INTO `product_product` VALUES (94, 'Outdoor plastic net red rainbow slide large colorful dry snow slide', 'customized', '', 'Net red rainbow slide, dry snow slide, grass slide', '3+', '18958833302', '2020-11-05 12:21:01.027356', '', 4);
INSERT INTO `product_product` VALUES (95, 'Special plastic bed with buckle for kindergarten [recommended by manufacturer]', '136 * 57 * 24.5cm, various specifications', 'According to product specifications', 'Kindergartens, kindergartens, tutorial classes and families', '2-8', '18958833302', '2020-11-05 12:21:13.689804', '', 15);
INSERT INTO `product_product` VALUES (96, 'Log toy Cabinet Series D', 'Various specifications can be customized', '', 'Kindergartens, early education institutions, training centers, schools, families', '3-12 years old', '18958833302', '2020-11-05 12:21:13.704774', '', 15);

-- ----------------------------
-- Table structure for product_producttypefirst
-- ----------------------------
DROP TABLE IF EXISTS `product_producttypefirst`;
CREATE TABLE `product_producttypefirst`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_producttypefirst
-- ----------------------------
INSERT INTO `product_producttypefirst` VALUES (1, 'Outdoor play equipment');
INSERT INTO `product_producttypefirst` VALUES (2, 'Indoor play equipment');
INSERT INTO `product_producttypefirst` VALUES (3, 'Other preschool education equipment');

-- ----------------------------
-- Table structure for product_producttypesecond
-- ----------------------------
DROP TABLE IF EXISTS `product_producttypesecond`;
CREATE TABLE `product_producttypesecond`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `second_typename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `typename_first_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_producttypes_typename_first_id_495ec8b6_fk_product_p`(`typename_first_id`) USING BTREE,
  CONSTRAINT `product_producttypes_typename_first_id_495ec8b6_fk_product_p` FOREIGN KEY (`typename_first_id`) REFERENCES `product_producttypefirst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_producttypesecond
-- ----------------------------
INSERT INTO `product_producttypesecond` VALUES (1, 'Non-standard customized amusement equipment', 1);
INSERT INTO `product_producttypesecond` VALUES (2, 'Stainless steel slide', 1);
INSERT INTO `product_producttypesecond` VALUES (3, 'Wooden slide', 1);
INSERT INTO `product_producttypesecond` VALUES (4, 'Plastic combined slide', 1);
INSERT INTO `product_producttypesecond` VALUES (5, 'Outdoor swing', 1);
INSERT INTO `product_producttypesecond` VALUES (6, 'overall plan', 1);
INSERT INTO `product_producttypesecond` VALUES (7, 'Outdoor rock climbing', 1);
INSERT INTO `product_producttypesecond` VALUES (8, 'Fitness Equipment', 1);
INSERT INTO `product_producttypesecond` VALUES (9, 'Outdoor rocking', 1);
INSERT INTO `product_producttypesecond` VALUES (10, 'Indoor stainless steel slide', 2);
INSERT INTO `product_producttypesecond` VALUES (11, 'Indoor children\'s playground', 2);
INSERT INTO `product_producttypesecond` VALUES (12, 'Indoor trampoline park', 2);
INSERT INTO `product_producttypesecond` VALUES (13, 'Indoor family restaurant', 2);
INSERT INTO `product_producttypesecond` VALUES (14, 'Naughty Castle', 2);
INSERT INTO `product_producttypesecond` VALUES (15, 'Kindergarten furniture', 3);
INSERT INTO `product_producttypesecond` VALUES (16, 'kids toys', 3);

SET FOREIGN_KEY_CHECKS = 1;
