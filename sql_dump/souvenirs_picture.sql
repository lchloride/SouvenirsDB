CREATE DATABASE  IF NOT EXISTS `souvenirs` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `souvenirs`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: souvenirs
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture` (
  `user_id` varchar(9) COLLATE utf8_bin NOT NULL,
  `album_name` varchar(60) COLLATE utf8_bin NOT NULL,
  `filename` varchar(70) COLLATE utf8_bin NOT NULL,
  `format` varchar(10) COLLATE utf8_bin NOT NULL,
  `description` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `upload_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`album_name`,`filename`),
  CONSTRAINT `P_user` FOREIGN KEY (`user_id`, `album_name`) REFERENCES `album` (`user_id`, `album_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES ('#00000001','daily life','cover.jpg','jpg','cover','2016-12-05 16:42:17');
INSERT INTO `picture` VALUES ('#00000001','daily life','party.jpg','jpg','Nice tour','2016-12-05 16:36:08');
INSERT INTO `picture` VALUES ('#00000001','daily life','tour.jpg','jpg','Tour to beach','2016-12-05 16:35:17');
INSERT INTO `picture` VALUES ('#00000001','del_test','1.jpg','jpg','example1','2017-02-03 00:30:14');
INSERT INTO `picture` VALUES ('#00000001','del_test','2.jpg','jpg','example2','2017-02-03 00:30:15');
INSERT INTO `picture` VALUES ('#00000002','user','avatar.jpg','jpg','This is your profile picture.','2016-12-05 15:57:02');
INSERT INTO `picture` VALUES ('#00000003','study','oso.jpg','jpg','','2016-12-05 16:37:57');
INSERT INTO `picture` VALUES ('#00000003','study','website.jpg','jpg','Souvenirs Website','2016-12-05 16:38:38');
INSERT INTO `picture` VALUES ('#00000003','tour','golden gate bridge.jpg','jpg','','2016-12-05 16:39:06');
INSERT INTO `picture` VALUES ('#00000003','tour','night sakura.jpg','jpg','Sakara blooms at Sumidagawa, Tokyo','2016-12-05 16:41:12');
INSERT INTO `picture` VALUES ('#00000003','user','logo.png','png','This is your profile picture.','2016-12-05 15:57:47');
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-15  0:24:41
