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
-- Table structure for table `comment_report`
--

DROP TABLE IF EXISTS `comment_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_user_id` varchar(9) COLLATE utf8_bin NOT NULL,
  `picture_user_id` varchar(9) COLLATE utf8_bin NOT NULL,
  `album_name` varchar(60) COLLATE utf8_bin NOT NULL,
  `picture_name` varchar(70) COLLATE utf8_bin NOT NULL,
  `comment_id` int(11) NOT NULL,
  `report_label` varchar(50) COLLATE utf8_bin NOT NULL,
  `report_content` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '',
  `report_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_solved` int(11) NOT NULL DEFAULT '0',
  `solver_id` varchar(9) COLLATE utf8_bin DEFAULT NULL,
  `solution` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `solve_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `CReport_USER_idx` (`report_user_id`),
  KEY `CReport_COMMENT_idx` (`picture_user_id`,`album_name`,`picture_name`,`comment_id`),
  KEY `CReport_user2_idx` (`solver_id`),
  CONSTRAINT `CReport_COMMENT` FOREIGN KEY (`picture_user_id`, `album_name`, `picture_name`, `comment_id`) REFERENCES `comment` (`user_id`, `album_name`, `filename`, `comment_id_in_pic`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CReport_USER` FOREIGN KEY (`report_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CReport_user2` FOREIGN KEY (`solver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_report`
--

LOCK TABLES `comment_report` WRITE;
/*!40000 ALTER TABLE `comment_report` DISABLE KEYS */;
INSERT INTO `comment_report` VALUES (2,'#00000001','#00000001','daily life','tour.jpg',1,'HARSSMENT','','2017-02-14 11:36:35',0,NULL,NULL,'2017-02-14 11:36:35');
INSERT INTO `comment_report` VALUES (3,'#00000001','#00000001','daily life','tour.jpg',1,'HARSSMENT','','2017-02-14 11:37:13',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `comment_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-20  0:22:01
