/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : mysite

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 10/10/2020 17:43:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for music_song
-- ----------------------------
DROP TABLE IF EXISTS `music_song`;
CREATE TABLE `music_song`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `singer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `album` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `languages` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `release` date NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lyrics` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `music_song_label_id_47ef17e7_fk_music_label_id`(`label_id`) USING BTREE,
  CONSTRAINT `music_song_label_id_47ef17e7_fk_music_label_id` FOREIGN KEY (`label_id`) REFERENCES `music_label` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of music_song
-- ----------------------------
INSERT INTO `music_song` VALUES (1, '爱 都是对的', '胡夏', '04:20', '胡 爱夏', '国语', '流行', '2010-12-08', 'songImg/1.jpg', '暂无歌词', 'songFile/1.mp3', 3);
INSERT INTO `music_song` VALUES (2, '体面', '于文文', '04:42', '《前任3：再见前任》电影插曲', '国语', '伤感', '2017-12-25', 'songImg/2.jpg', '暂无歌词', 'songFile/2.mp3', 4);
INSERT INTO `music_song` VALUES (3, '三国恋', 'Tank', '04:06', 'Fighting！生存之道', '国语', '摇滚', '2006-04-15', 'songImg/3.jpg', '暂无歌词', 'songFile/3.mp3', 2);
INSERT INTO `music_song` VALUES (4, '会长大的幸福', 'Tank', '04:32', '第三回合', '国语', '励志', '2009-05-29', 'songImg/4.jpg', '暂无歌词', 'songFile/4.mp3', 4);
INSERT INTO `music_song` VALUES (5, '满满', '梁文音/王铮亮', '04:44', '爱，一直存在', '国语', '甜蜜', '2009-11-20', 'songImg/5.jpg', '暂无歌词', 'songFile/5.mp3', 1);
INSERT INTO `music_song` VALUES (6, '别再记起', '吴若希', '04:04', '别再记起', '粤语', '场景', '2017-12-07', 'songImg/6.jpg', '暂无歌词', 'songFile/6.mp3', 4);
INSERT INTO `music_song` VALUES (7, '爱的魔法', '金莎', '03:11', '他不爱我', '国语', '甜蜜', '2012-03-19', 'songImg/7.jpg', '暂无歌词', 'songFile/7.mp3', 1);
INSERT INTO `music_song` VALUES (8, '演员', '薛之谦', '04:11', '演员', '国语', '流行', '2015-06-05', 'songImg/8.jpg', '暂无歌词', 'songFile/8.mp3', 3);
INSERT INTO `music_song` VALUES (9, '放爱情一个假', '许慧欣', '03:24', '谜', '国语', '安静', '2006-10-01', 'songImg/9.jpg', '暂无歌词', 'songFile/9.mp3', 4);
INSERT INTO `music_song` VALUES (10, 'Volar', '侧田', '03:52', 'No Protection', '粤语', '摇滚', '2006-07-05', 'songImg/10.jpg', '暂无歌词', 'songFile/10.mp3', 2);
INSERT INTO `music_song` VALUES (11, '好心分手', '王力宏/卢巧音', '03:00', '2 Love 致情挚爱', '国语', '伤感', '2015-07-24', 'songImg/11.jpg', 'songLyric/11.txt', 'songFile/11.mp3', 1);
INSERT INTO `music_song` VALUES (12, '就是这样', '林采欣', '05:13', '单曲', '国语', '流行', '2016-10-10', 'songImg/12.jpg', '暂无歌词', 'songFile/12.mp3', 3);
INSERT INTO `music_song` VALUES (13, '爱过了 又怎样', '张惠春', '04:09', '单曲', '国语', '流行', '2016-09-07', 'songImg/13.jpg', '暂无歌词', 'songFile/13.mp3', 3);

SET FOREIGN_KEY_CHECKS = 1;
