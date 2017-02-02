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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `user_id` varchar(9) COLLATE utf8_bin NOT NULL,
  `album_name` varchar(60) COLLATE utf8_bin NOT NULL,
  `intro` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `album_cover` varchar(260) COLLATE utf8_bin NOT NULL DEFAULT '\\\\res\\\\default_cover.png',
  `create_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`album_name`),
  CONSTRAINT `A_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES ('#00000001','daily life','Pictures in daily life.','\\\\#00000001\\\\daily life\\\\cover.jpg','2016-12-15 09:58:06');
INSERT INTO `album` VALUES ('#00000001','del_test','album for delete test','\\res\\default_cover.png','2017-02-03 00:30:14');
INSERT INTO `album` VALUES ('#00000001','user','This is a default album.','\\\\res\\\\default_cover.png','2016-12-15 09:58:06');
INSERT INTO `album` VALUES ('#00000002','user','This is a default album.','\\\\#00000002\\\\user\\\\avatar.jpg','2016-12-15 09:58:06');
INSERT INTO `album` VALUES ('#00000003','study','','\\\\#00000003\\\\study\\\\oso.jpg','2016-12-15 09:58:06');
INSERT INTO `album` VALUES ('#00000003','tour','nice scenary','\\\\#00000003\\\\tour\\\\golden gate bridge.jpg','2016-12-15 09:58:06');
INSERT INTO `album` VALUES ('#00000003','user','This is a default album.','\\\\#00000003\\\\user\\\\logo.png','2016-12-15 09:58:06');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-03  0:31:58
