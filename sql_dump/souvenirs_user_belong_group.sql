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
-- Table structure for table `user_belong_group`
--

DROP TABLE IF EXISTS `user_belong_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_belong_group` (
  `user_id` varchar(9) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(9) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `UBG_group_idx` (`group_id`),
  CONSTRAINT `UBG_group` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UBG_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_belong_group`
--

LOCK TABLES `user_belong_group` WRITE;
/*!40000 ALTER TABLE `user_belong_group` DISABLE KEYS */;
INSERT INTO `user_belong_group` VALUES ('#00000001','000000001');
INSERT INTO `user_belong_group` VALUES ('#00000002','000000002');
INSERT INTO `user_belong_group` VALUES ('#00000003','000000002');
INSERT INTO `user_belong_group` VALUES ('#00000001','000000003');
INSERT INTO `user_belong_group` VALUES ('#00000002','000000003');
INSERT INTO `user_belong_group` VALUES ('#00000003','000000003');
/*!40000 ALTER TABLE `user_belong_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-27 20:25:55
