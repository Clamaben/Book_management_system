CREATE DATABASE IF NOT EXISTS `book_management` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `book_management`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: book_management
-- ------------------------------------------------------
-- Server version	5.7.26

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `name`        varchar(20)  DEFAULT NULL,
    `ISBN`        varchar(25)  DEFAULT NULL,
    `type`        varchar(10)  DEFAULT NULL,
    `description` varchar(150) DEFAULT NULL,
    `img_url`     varchar(255) DEFAULT NULL,
    `stock`       int(11) NOT NULL,
    `onLoan`      int(11) NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book`
    DISABLE KEYS */;
INSERT INTO `book`
VALUES (1, 'C++ primer', 'ISBN123456', 'CS', 'a book to learn c++', 'images/1.jpg', 1, 0),
       (2, 'Machine Yearning', 'ISBN123123', 'CS', 'a book to learn machine learning', 'images/2.jpg', 0, 0),
       (3, '十二个圣诞古树', 'ISBN9787559618566', 'fiction', '《橘子不是唯一的水果》作者珍妮特·温特森的魔法时间！', 'images/3.jpg', 1, 0),
       (4, '无羁', 'ISBN9787541151736', 'fiction', '这一次，“夷陵老祖”魏无羡与“含光君”蓝忘机携手探秘，能否解开这几十年间的重重谜团？', 'images/4.jpg', 1, 0),
       (5, '极简科学起源课', 'ISBN9787535799500', 'science',
        '古希腊的阿那克西曼德，见证科学思想从萌芽到生长，一路讲述到哥白尼、伽利略、爱因斯坦，用诗意优美的语言引领我们重走这趟长达26世纪的伟大旅程。', 'images/5.jpg', 1, 0),
       (6, '如何成为一个有绝活的人', 'ISBN9787121346187', 'other',
        '这是一本少有的、以工作为主题却能让上班族广泛传阅的杰作，总会有小员工如获至宝地在网络上转发，也会有大老板交代下属大量复印，让员工仔细阅读。', 'images/6.jpg', 1, 0),
       (7, '有斐：男士基本款', 'ISBN9787807682615', 'life',
        '《有斐Basic：男士基本款》是知名新媒体品牌“杜绍斐”出版的第一本主题MOOK（杂志书）。旨在推广时尚、健康的男装文化的同时，帮助中国当下亿万“嗷嗷待哺”的直男，认识男装历史，了解男装礼仪、培养男装审美以及建立自己的衣着品格。',
        'images/7.jpg', 1, 0),
       (8, '沉睡的记忆', 'ISBN9787020145492', 'other', '《沉睡的记忆》出版于2017年，是莫迪亚诺荣获诺贝尔文学奖之后首部新作', 'images/8.jpg', 1, 0),
       (9, '无规则游戏', 'ISBN9787213088308', 'fiction',
        '塔米姆·安萨利是一位阿富汗裔美国人，他出生和成长在喀布尔，于1964年移居美国，兼有阿富汗和美国两国血统。他讲述的阿富汗故事饱含对故国家园的深切关怀，从局内人的视角为我们解读阿富汗动荡不安的内在原因。他坦言，在阿富汗，西方式的民主没有植根的土壤；按照西方的游戏规则，阿富汗人将无法生存。',
        'images/9.jpg', 1, 0),
       (10, '镖人', 'ISBN9787559625793', 'other', '3次登上日本央视NHK电视台新闻报道节目，被日本媒体誉为“太阳系级别的中国动漫精品”！ 日文单行本热卖中！',
        'images/10.jpg', 1, 0),
       (11, '进击的智人', 'ISBN9787508695655', 'other', '“特别会讲故事的博物学者”河森堡首部作品。同名演讲《进击的智人》播放量破亿次。', 'images/11.jpg', 0, 0),
       (12, '310上海异人故事', 'ISBN9787532167845', 'fiction', '310，上海人身份证数字前三位，一组刻进身体的社会基因密码；', 'images/12.jpg', 1, 0);
/*!40000 ALTER TABLE `book`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow_record`
--

DROP TABLE IF EXISTS `borrow_record`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrow_record`
(
    `recordID`   int(11) NOT NULL AUTO_INCREMENT,
    `borrowerID` int(11) NOT NULL,
    `bookID`     int(11) NOT NULL,
    `borrowTime` datetime DEFAULT NULL,
    `returnTime` datetime DEFAULT NULL,
    `status`     int(11)  DEFAULT NULL,
    PRIMARY KEY (`recordID`),
    KEY `boog_foreign_key_idx` (`bookID`),
    KEY `borrower_foreign_key_idx` (`borrowerID`),
    CONSTRAINT `book_foreign_key` FOREIGN KEY (`bookID`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `borrower_foreign_key` FOREIGN KEY (`borrowerID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_record`
--

LOCK TABLES `borrow_record` WRITE;
/*!40000 ALTER TABLE `borrow_record`
    DISABLE KEYS */;
INSERT INTO `borrow_record`
VALUES (1, 3, 1, '2019-07-31 07:29:16', '2019-07-31 07:29:23', 0),
       (2, 3, 2, '2019-07-21 07:29:42', NULL, 1);
/*!40000 ALTER TABLE `borrow_record`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginticket`
--

DROP TABLE IF EXISTS `loginticket`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginticket`
(
    `ticket`  varchar(128) NOT NULL,
    `userid`  varchar(36) DEFAULT '',
    `role`    varchar(10) DEFAULT '',
    `expired` date        DEFAULT NULL,
    `status`  tinyint(1)  DEFAULT NULL,
    PRIMARY KEY (`ticket`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginticket`
--

LOCK TABLES `loginticket` WRITE;
/*!40000 ALTER TABLE `loginticket`
    DISABLE KEYS */;
INSERT INTO `loginticket`
VALUES ('03835', '1', 'operator', '2018-12-24', 0),
       ('0ab1a', '1', 'operator', '2018-12-20', 0),
       ('0dbf9', '1', 'borrower', '2019-04-08', 0),
       ('123abcabc', '1', 'admin', '2018-12-02', 1),
       ('1897c', '1', 'borrower', '2018-12-23', 0),
       ('19c0c', '1', 'borrower', '2018-12-21', 0),
       ('1e50a', '1', 'admin', '2018-12-20', 0),
       ('1e6b9', '1', 'operator', '2019-04-08', 0),
       ('1e744', '1', 'admin', '2018-12-20', 0),
       ('1f35f', '6', 'admin', '2018-12-24', 0),
       ('3196f', '1', 'operator', '2018-12-23', 0),
       ('32347', '1', 'operator', '2018-12-23', 0),
       ('46a45', '1', 'admin', '2018-12-20', 0),
       ('47eea', '1', 'borrower', '2018-12-23', 0),
       ('5098b', '1', 'borrower', '2018-12-23', 0),
       ('513f9', '1', 'borrower', '2018-12-24', 0),
       ('5d024', '6', 'admin', '2019-04-08', 0),
       ('5eb2a', '1', 'borrower', '2019-04-08', 0),
       ('6d989', '6', 'admin', '2018-12-23', 0),
       ('71b9c', '6', 'admin', '2018-12-21', 0),
       ('72eeb', '1', 'operator', '2018-12-24', 0),
       ('7a4e0', '1', 'operator', '2018-12-21', 0),
       ('7bbab', '1', 'borrower', '2018-12-20', 0),
       ('80466', '1', 'borrower', '2018-12-21', 0),
       ('86a8b', '1', 'borrower', '2018-12-23', 0),
       ('88bed', '6', 'admin', '2018-12-23', 0),
       ('8de89', '1', 'borrower', '2018-12-21', 0),
       ('93651', '1', 'operator', '2018-12-20', 0),
       ('945ca', '1', 'operator', '2018-12-21', 0),
       ('9a9a0', '1', 'borrower', '2018-12-20', 0),
       ('9ee89', '1', 'borrower', '2018-12-23', 0),
       ('a6001', '1', 'borrower', '2019-04-08', 0),
       ('a6f96', '1', 'operator', '2018-12-23', 0),
       ('aa8da', '1', 'borrower', '2018-12-23', 0),
       ('af4f7', '1', 'admin', '2018-12-20', 0),
       ('bb579', '6', 'admin', '2018-12-21', 0),
       ('bdb0c', '6', 'admin', '2018-12-23', 0),
       ('c1b5b', '1', 'operator', '2019-04-08', 0),
       ('c3e0d', '1', 'operator', '2018-12-21', 0),
       ('d5082', '1', 'borrower', '2018-12-21', 0),
       ('d6fdf', '6', 'admin', '2018-12-23', 0),
       ('d85ed', '1', 'borrower', '2018-12-24', 0),
       ('dadac', '1', 'operator', '2018-12-21', 0),
       ('e6b86', '1', 'operator', '2018-12-21', 0),
       ('ea660', '1', 'borrower', '2018-12-23', 0),
       ('fb341', '1', 'operator', '2018-12-23', 0),
       ('fb939', '1', 'operator', '2018-12-21', 0);
/*!40000 ALTER TABLE `loginticket`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(12) DEFAULT NULL,
    `password` varchar(25) DEFAULT NULL,
    `role`     varchar(25) DEFAULT NULL,
    `degree`   varchar(6)  DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
    DISABLE KEYS */;
INSERT INTO `user`
VALUES (1, 'test', '123456', 'ADMIN,BORROWER', 'BD'),
       (2, 'TianaoGe', '123456', 'LIBRARIAN,BORROWER', NULL),
       (3, 'ChaofanZhu', '123456', 'BORROWER', 'MD');
/*!40000 ALTER TABLE `user`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2019-07-31 15:33:35
