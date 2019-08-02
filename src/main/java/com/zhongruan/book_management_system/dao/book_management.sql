/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : book_management

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 01/08/2019 18:00:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISBN` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `onLoan` int(11) NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'C++ primer', 'ISBN123456', 'CS', 'a book to learn c++', 'images/1.jpg', 1, 0, NULL);
INSERT INTO `book` VALUES (2, 'Machine Yearning', 'ISBN123123', 'CS', 'a book to learn machine learning', 'images/2.jpg', 0, 0, NULL);
INSERT INTO `book` VALUES (3, '十二个圣诞古树', 'ISBN9787559618566', 'fiction', '《橘子不是唯一的水果》作者珍妮特·温特森的魔法时间！', 'images/3.jpg', 1, 0, NULL);
INSERT INTO `book` VALUES (4, '无羁', 'ISBN9787541151736', 'fiction', '这一次，“夷陵老祖”魏无羡与“含光君”蓝忘机携手探秘，能否解开这几十年间的重重谜团？', 'images/4.jpg', 1, 0, NULL);
INSERT INTO `book` VALUES (5, '极简科学起源课', 'ISBN9787535799500', 'science', '古希腊的阿那克西曼德，见证科学思想从萌芽到生长，一路讲述到哥白尼、伽利略、爱因斯坦，用诗意优美的语言引领我们重走这趟长达26世纪的伟大旅程。', 'images/5.jpg', 1, 0, NULL);
INSERT INTO `book` VALUES (6, '如何成为一个有绝活的人', 'ISBN9787121346187', 'other', '这是一本少有的、以工作为主题却能让上班族广泛传阅的杰作，总会有小员工如获至宝地在网络上转发，也会有大老板交代下属大量复印，让员工仔细阅读。', 'images/6.jpg', 1, 0, NULL);
INSERT INTO `book` VALUES (7, '有斐：男士基本款', 'ISBN9787807682615', 'life', '《有斐Basic：男士基本款》是知名新媒体品牌“杜绍斐”出版的第一本主题MOOK（杂志书）。旨在推广时尚、健康的男装文化的同时，帮助中国当下亿万“嗷嗷待哺”的直男，认识男装历史，了解男装礼仪、培养男装审美以及建立自己的衣着品格。', 'images/7.jpg', 1, 0, NULL);
INSERT INTO `book` VALUES (8, '沉睡的记忆', 'ISBN9787020145492', 'other', '《沉睡的记忆》出版于2017年，是莫迪亚诺荣获诺贝尔文学奖之后首部新作', 'images/8.jpg', 1, 0, NULL);
INSERT INTO `book` VALUES (9, '无规则游戏', 'ISBN9787213088308', 'fiction', '塔米姆·安萨利是一位阿富汗裔美国人，他出生和成长在喀布尔，于1964年移居美国，兼有阿富汗和美国两国血统。他讲述的阿富汗故事饱含对故国家园的深切关怀，从局内人的视角为我们解读阿富汗动荡不安的内在原因。他坦言，在阿富汗，西方式的民主没有植根的土壤；按照西方的游戏规则，阿富汗人将无法生存。', 'images/9.jpg', 1, 0, NULL);
INSERT INTO `book` VALUES (10, '镖人', 'ISBN9787559625793', 'other', '3次登上日本央视NHK电视台新闻报道节目，被日本媒体誉为“太阳系级别的中国动漫精品”！ 日文单行本热卖中！', 'images/10.jpg', 1, 0, NULL);
INSERT INTO `book` VALUES (11, '进击的智人', 'ISBN9787508695655', 'other', '“特别会讲故事的博物学者”河森堡首部作品。同名演讲《进击的智人》播放量破亿次。', 'images/11.jpg', 0, 0, NULL);
INSERT INTO `book` VALUES (12, '310上海异人故事', 'ISBN9787532167845', 'fiction', '310，上海人身份证数字前三位，一组刻进身体的社会基因密码；', 'images/12.jpg', 1, 0, NULL);

-- ----------------------------
-- Table structure for borrowerrecord
-- ----------------------------
DROP TABLE IF EXISTS `borrowerrecord`;
CREATE TABLE `borrowerrecord`  (
  `recordId` int(11) NOT NULL AUTO_INCREMENT,
  `borrowerId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `borrowTime` date NULL DEFAULT NULL,
  PRIMARY KEY (`recordId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrowerrecord
-- ----------------------------
INSERT INTO `borrowerrecord` VALUES (1, 1, 1, '0', '2019-08-20');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` enum('ADMIN','BORROWER','LIBRARIAN') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test', '123456', 'ADMIN');
INSERT INTO `user` VALUES (2, 'TianaoGe', '123456', 'LIBRARIAN');
INSERT INTO `user` VALUES (3, 'ChaofanZhu', '123456', 'BORROWER');

SET FOREIGN_KEY_CHECKS = 1;
