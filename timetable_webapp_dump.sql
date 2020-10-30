-- MySQL dump 10.13  Distrib 5.7.31, for macos10.14 (x86_64)
--
-- Host: localhost    Database: timetable_webapp
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colleges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(8) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `undergraduate_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_a93ugma3st6063ucmj2dsopyt` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES (9,'10000000','経済学科','a大学','経済学部','2020-10-16 18:31:56','2020-10-16 18:32:18'),(7,'00000000','管理科','運営','管理部','2020-10-16 18:29:41','2020-10-16 18:30:40'),(10,'10000001','地域経済学科','a大学','経済学部','2020-10-16 18:33:08','2020-10-16 18:33:08'),(11,'10000002','国際経済学科','a大学','経済学部','2020-10-16 18:33:34','2020-10-16 18:33:34'),(12,'10000100','経営学科','a大学','経営学部','2020-10-16 18:34:12','2020-10-16 18:34:12'),(13,'10000101','法務学科','a大学','経営学部','2020-10-16 18:35:06','2020-10-16 18:35:06'),(14,'10000102','商学科','a大学','経営学部','2020-10-16 18:36:33','2020-10-16 18:36:33'),(15,'10000200','教育学科','a大学','教育学部','2020-10-16 18:37:47','2020-10-16 18:39:40'),(16,'10000201','美術学科','a大学','教育学部','2020-10-16 18:38:48','2020-10-16 18:38:48'),(17,'10000202','音楽学科','a大学','教育学部','2020-10-16 18:39:17','2020-10-16 18:39:17'),(18,'10000203','幼児教育学科','a大学','教育学部','2020-10-16 18:39:59','2020-10-16 18:39:59'),(19,'10000204','健康スポーツ学科','a大学','教育学部','2020-10-16 18:40:41','2020-10-16 18:40:41'),(20,'10000300','社会学科','a大学','社会学部','2020-10-16 18:41:48','2020-10-16 18:41:48'),(21,'10000301','地域政策学科','a大学','社会学部','2020-10-16 18:42:16','2020-10-16 18:42:16'),(44,'10010000','法学科','b大学','法学部','2020-10-29 15:34:49','2020-10-29 15:34:49'),(23,'10010001','国際法学科','b大学','法学部','2020-10-16 18:48:01','2020-10-16 18:48:01'),(26,'10010002','歴史学科','b大学','法学部','2020-10-16 18:50:29','2020-10-16 18:50:29'),(25,'10010003','政治学科','b大学','法学部','2020-10-16 18:49:27','2020-10-16 18:49:27'),(27,'10010100','経済学科','b大学','経済学部','2020-10-16 18:51:48','2020-10-16 18:51:48'),(28,'10010101','経済史学科','b大学','経済学部','2020-10-16 18:52:59','2020-10-16 18:52:59'),(29,'10010102','政治経済学科','b大学','経済学部','2020-10-16 18:55:14','2020-10-16 18:55:14'),(30,'10010200','経営学科','b大学','経営学部','2020-10-16 18:55:59','2020-10-16 18:55:59'),(31,'10010300','情報社会学科','b大学','情報社会学部','2020-10-16 18:56:23','2020-10-16 18:56:23'),(32,'10010301','IoT学科','b大学','情報社会学部','2020-10-16 18:57:09','2020-10-16 18:57:09'),(33,'10010400','理工学科','b大学','理工学部','2020-10-16 18:57:33','2020-10-16 18:57:33'),(34,'10010401','プログラミング学科','b大学','理工学部','2020-10-16 18:58:02','2020-10-16 18:58:02'),(35,'10010402','コンピューターサイエンス学科','b大学','理工学部','2020-10-16 18:58:24','2020-10-16 18:58:24'),(36,'10010500','日本専攻学科','b大学','文学部','2020-10-16 18:59:22','2020-10-16 18:59:22'),(37,'10010501','西洋専攻学科','b大学','文学科','2020-10-16 18:59:57','2020-10-16 18:59:57'),(38,'10010600','商学科','b大学','商学部','2020-10-16 19:02:25','2020-10-16 19:02:25'),(41,'10010700','マネジメント学科','b大学','マネジメント学部','2020-10-17 18:38:10','2020-10-18 13:08:45');
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `updated_at` datetime NOT NULL,
  `college_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ajflqx9dbuh26q7nfapkr0rkh` (`code`),
  KEY `FKivbkl10swbap6pfu8e9a9o82n` (`college_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (18,2,'ad00000','2020-10-29 15:25:21','admin_1','D511DA96261869607DBF6873817296D47657919FFF80C21CDB7EC96D9014F892','2020-10-29 15:25:21',7),(3,1,'th10000001','2020-10-19 15:38:49','teacher_1','2C6633D761B93A85B494B59A3D6F5D92CDEF87A4F8DF7FEE247939332AA38D1E','2020-10-29 15:32:51',9),(8,0,'st10000001','2020-10-19 17:17:33','student_1','3B2D4F85EABDF55172604EB58FA5F91431BD9EF8AD91B78D043B0FDDD23A0AD8','2020-10-29 15:42:11',9),(10,2,'ad00001','2020-10-20 16:09:56','admin_2','876124EECA62ED19BAD66A28D72567026FF5E3B63E38001905F06F837DF6E899','2020-10-29 15:25:40',7),(19,2,'ad00002','2020-10-29 15:26:07','admin_3','1CA15DFBFD2A559D67C02C823E8A8C01E0AFCAF2249694FA9E154A5584EBA677','2020-10-29 15:26:07',7),(20,2,'ad00003','2020-10-29 15:26:37','admin_4','5D1A40F4C9CE51AAA4A537DCD5515346672AF5F944A414B61820E5FD1700C290','2020-10-29 15:26:37',7),(21,1,'th10000002','2020-10-29 15:28:08','teacher_2','2C6633D761B93A85B494B59A3D6F5D92CDEF87A4F8DF7FEE247939332AA38D1E','2020-10-29 15:32:43',9),(22,1,'th10000003','2020-10-29 15:28:37','teacher_3','565D4CD4E0BF71767C1DB1A10E5A39660E58CF570FDE203AF26E4279933CC40C','2020-10-29 15:32:37',10),(23,1,'th10000004','2020-10-29 15:29:28','teacher_4','5389166E5BA562CEA26426563D8FC3F6F84FA1EF640963CF9AFBCA860B7613E4','2020-10-29 15:29:28',11),(24,1,'th10000005','2020-10-29 15:32:01','teacher_5','058A6E411BA84B4323B2739F0807944468D83DC30ACE23F03FC48A06D6596681','2020-10-29 15:32:01',12),(25,1,'th10000006','2020-10-29 15:34:25','teacher_6','77DFA26A4BAD9A71AE287E7054B73258848AE64447B7BAE6674D185215D8AA4E','2020-10-29 15:45:47',23),(26,0,'st10000002','2020-10-29 15:42:58','student_2','1126EDCA8983743C5FDD9158EB11D1F4A9A47FB23E5DC44B71308D877215A04C','2020-10-29 15:42:58',10),(27,0,'st10000003','2020-10-29 15:43:23','student_3','ACFE9EDB36BDDAB22341EBAA9F29C01EDE7B8A50C331577615EDF1243FF66DAC','2020-10-29 15:43:23',10),(28,0,'st10000004','2020-10-29 15:43:57','student_4','56BEC48C230C1CB3541F7527444E1D2EA4DA7CFD8FB83A534DF0562F832FE08C','2020-10-29 15:43:57',23),(29,1,'th10000007','2020-10-29 15:53:18','teacher_7','D6843B51E427A7FD9309B6B58FD48F7D018FC155A97A3E84B3A5A7D98F9CAFA7','2020-10-29 15:53:18',26),(30,1,'th10000008','2020-10-29 16:21:43','teacher_8','B86594D569FFAC8CDA8E659B28D807354FC9CA61F7FB63967E73830E4DD51E74','2020-10-29 16:21:43',25),(31,1,'th10000009','2020-10-29 16:26:58','teacher_9','D6C5CE540AA6668F691DC1BCD7F33AD5AEDF6199D788101BF9D23782C3546DDD','2020-10-29 16:28:05',27),(32,1,'th10000010','2020-10-29 16:34:30','teacher_10','D18D5C9BF3B17CBCEF8EACAB0A07BC2242ECB6CFB4AF5511AE8996A2B71E9818','2020-10-29 16:34:30',28);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `day_of_week` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `open_flag` int(11) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `college_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdwmbfehg8ylc40fpsvmgqqvih` (`college_id`),
  KEY `FKnrpgntu6qggv6q2047xmd00q0` (`teacher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (8,'11112','blue','2020-10-22 20:05:34','tuesday','a','経済学基礎演習',2,1,'2020-10-22 20:05:34',9,3),(12,'11116','red','2020-10-24 17:29:41','friday','','マクロ経済学',2,6,'2020-10-25 14:29:00',9,3),(23,'11113','red','2020-10-29 15:47:22','monday','','法学入門',2,1,'2020-10-29 15:47:22',44,25),(24,'33241','green','2020-10-29 15:48:26','tuesday','','国際法特論',0,5,'2020-10-29 15:48:26',23,25),(25,'11122','red','2020-10-29 15:49:55','tuesday','','国際法入門',2,4,'2020-10-29 15:49:55',23,25),(26,'11121','red','2020-10-29 15:50:35','thursday','','国際法入門',2,2,'2020-10-29 15:50:35',23,25),(27,'11124','blue','2020-10-29 15:54:39','friday','','法律の歴史',2,3,'2020-10-29 15:54:39',26,29),(28,'11112','red','2020-10-29 15:55:15','thursday','','法学入門',2,1,'2020-10-29 15:55:15',44,29),(29,'21113','purple','2020-10-29 16:12:57','wednesday','','法律の歴史特講',1,2,'2020-10-29 16:14:37',26,29),(30,'41112','red','2020-10-29 16:13:52','wednesday','','西洋法学',1,5,'2020-10-29 16:13:52',26,29),(31,'30011','green','2020-10-29 16:23:22','friday','','政治学特論',0,4,'2020-10-29 16:23:22',25,30),(32,'11111','red','2020-10-29 16:24:09','thursday','','政治学入門',2,1,'2020-10-29 16:24:09',25,30),(33,'20111','purple','2020-10-29 16:24:57','tuesday','','政治学特講',1,4,'2020-10-29 16:24:57',25,30),(34,'19939','yellow_green','2020-10-29 16:25:48','monday','','国際法学',1,5,'2020-10-29 16:25:48',25,30),(35,'12131','red','2020-10-29 16:29:10','friday','','経済入門',2,1,'2020-10-29 16:29:10',27,31),(36,'20031','purple','2020-10-29 16:30:02','friday','','経済特講',1,2,'2020-10-29 16:30:02',27,31),(37,'19911','yellow_green','2020-10-29 16:36:18','thursday','','経済史入門',2,4,'2020-10-29 16:36:18',28,32),(38,'10101','blue','2020-10-29 16:40:34','tuesday','','世界経済史',2,1,'2020-10-29 16:40:34',28,32),(39,'12121','green','2020-10-29 16:50:25','monday','','経済学2',2,1,'2020-10-29 16:50:25',9,3),(40,'91919','red','2020-10-29 16:54:13','wednesday','','法学',2,1,'2020-10-29 16:54:24',44,25);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takesubject`
--

DROP TABLE IF EXISTS `takesubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `takesubject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tasksubject_index` (`college_id`),
  KEY `takesubject_index` (`college_id`),
  KEY `FKca8j8a6sh2es3vhjoupjyviyq` (`person_id`),
  KEY `FKq42ed6t6ld3xriie03s248xac` (`subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takesubject`
--

LOCK TABLES `takesubject` WRITE;
/*!40000 ALTER TABLE `takesubject` DISABLE KEYS */;
INSERT INTO `takesubject` VALUES (24,28,34,25);
/*!40000 ALTER TABLE `takesubject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-30 10:10:00
