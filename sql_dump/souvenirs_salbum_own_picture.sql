CREATE DATABASE  IF NOT EXISTS `souvenirs` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `souvenirs`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
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
-- Table structure for table `salbum_own_picture`
--

DROP TABLE IF EXISTS `salbum_own_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salbum_own_picture` (
  `group_id` varchar(9) NOT NULL,
  `user_id` varchar(9) NOT NULL,
  `album_name` varchar(50) NOT NULL,
  `filename` varchar(55) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`,`album_name`,`filename`),
  KEY `SAOP2P_idx` (`user_id`,`album_name`,`filename`),
  CONSTRAINT `SAOP2G` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SAOP2P` FOREIGN KEY (`user_id`, `album_name`, `filename`) REFERENCES `picture` (`user_id`, `album_name`, `filename`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salbum_own_picture`
--

LOCK TABLES `salbum_own_picture` WRITE;
/*!40000 ALTER TABLE `salbum_own_picture` DISABLE KEYS */;
INSERT INTO `salbum_own_picture` VALUES ('000000001','#00000001','daily life','tour.jpg'),('000000002','#00000003','study','oso.jpg'),('000000003','#00000003','tour','golden gate bridge.jpg'),('000000003','#00000003','tour','night sakura.jpg');
/*!40000 ALTER TABLE `salbum_own_picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-06  9:21:38
