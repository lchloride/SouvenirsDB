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
-- Temporary view structure for view `check_image_priv_direct`
--

DROP TABLE IF EXISTS `check_image_priv_direct`;
/*!50001 DROP VIEW IF EXISTS `check_image_priv_direct`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `check_image_priv_direct` AS SELECT 
 1 AS `allowed_user_id`,
 1 AS `owner_id`,
 1 AS `album_name`,
 1 AS `filename`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_available_album`
--

DROP TABLE IF EXISTS `query_available_album`;
/*!50001 DROP VIEW IF EXISTS `query_available_album`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_available_album` AS SELECT 
 1 AS `album_name`,
 1 AS `user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_available_image`
--

DROP TABLE IF EXISTS `query_available_image`;
/*!50001 DROP VIEW IF EXISTS `query_available_image`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_available_image` AS SELECT 
 1 AS `user_id`,
 1 AS `album_name`,
 1 AS `owner_id`,
 1 AS `owner_album_name`,
 1 AS `owner_filename`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `check_image_priv_direct`
--

/*!50001 DROP VIEW IF EXISTS `check_image_priv_direct`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `check_image_priv_direct` AS select `user`.`user_id` AS `allowed_user_id`,`salbum_own_picture`.`user_id` AS `owner_id`,`salbum_own_picture`.`album_name` AS `album_name`,`salbum_own_picture`.`filename` AS `filename` from (((`user` join `user_belong_group`) join `group`) join `salbum_own_picture`) where ((`user`.`user_id` = `user_belong_group`.`user_id`) and (`user_belong_group`.`group_id` = `group`.`group_id`) and (`group`.`group_id` = `salbum_own_picture`.`group_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_available_album`
--

/*!50001 DROP VIEW IF EXISTS `query_available_album`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_available_album` AS select `album`.`album_name` AS `album_name`,`album`.`user_id` AS `user_id` from `album` union select `group`.`shared_album_name` AS `album_name`,`user_belong_group`.`user_id` AS `user_id` from (`user_belong_group` join `group`) where (`group`.`group_id` = `user_belong_group`.`group_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_available_image`
--

/*!50001 DROP VIEW IF EXISTS `query_available_image`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_available_image` AS select `user`.`user_id` AS `user_id`,`group`.`shared_album_name` AS `album_name`,`salbum_own_picture`.`user_id` AS `owner_id`,`salbum_own_picture`.`album_name` AS `owner_album_name`,`salbum_own_picture`.`filename` AS `owner_filename` from (((`user` join `user_belong_group`) join `group`) join `salbum_own_picture`) where ((`user`.`user_id` = `user_belong_group`.`user_id`) and (`user_belong_group`.`group_id` = `group`.`group_id`) and (`group`.`group_id` = `salbum_own_picture`.`group_id`)) union select `picture`.`user_id` AS `user_id`,`picture`.`album_name` AS `album_name`,`picture`.`user_id` AS `owner_id`,`picture`.`album_name` AS `owner_album_name`,`picture`.`filename` AS `owner_filename` from `picture` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'souvenirs'
--

--
-- Dumping routines for database 'souvenirs'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddGroup`(IN gn varchar(50), IN intro varchar(200), In ac varchar(260))
BEGIN
declare x int;
declare id varchar(9);
DECLARE t_error INTEGER DEFAULT 0;  
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  

START TRANSACTION;
select int_val into x from info where key_id = "groupid";
set id = LPAD(x+1, 9, '0');
insert into souvenirs.`group`(group_id, group_name, intro, shared_album_name, album_cover) values (id, gn, intro, CONCAT('Shared_album_from_', gn), CONCAT('\\\\group\\\\', id, '_', ac));
update info set int_val = (x+1) where key_id = "groupid";
IF t_error = 1 THEN  
	ROLLBACK;  
ELSE  
	COMMIT;  
END IF; 
select t_error; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddGroupWithoutCover` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddGroupWithoutCover`(IN gn varchar(50), IN intro varchar(200))
BEGIN
declare x int;
declare id varchar(9);
DECLARE t_error INTEGER DEFAULT 0;  
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  

START TRANSACTION;
select int_val into x from info where key_id = "groupid";
set id = LPAD(x+1, 9, '0');
insert into souvenirs.`group`(group_id, group_name, intro, shared_album_name) values (id, gn, intro, CONCAT('Shared_album_from_', gn));
update info set int_val = (x+1) where key_id = "groupid";

IF t_error = 1 THEN  
	ROLLBACK;  
ELSE  
	COMMIT;  
END IF; 
select t_error; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUser`(IN un varchar(50), IN pwd varchar(50), IN ava_name varchar(260))
BEGIN
DECLARE t_error INTEGER DEFAULT 0;  
declare x int;
declare id varchar(9);
declare filename varchar(260);
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  

	
START TRANSACTION;
select count(*) into x from user where username=un;
if x > 0 then
	set t_error = 1;
    rollback;
else
	SELECT int_val iNTO x FROM info WHERE key_id = 'userid';
    set id = CONCAT('#', LPAD(x+1, 8, '0'));
	set filename = CONCAT('\\\\',id, '\\\\user\\\\', ava_name);
	insert into user(user_id, username, password, avatar) values (id, un, pwd, filename);
	UPDATE info SET int_val = (x + 1) WHERE key_id = 'userid';
	insert into album(user_id, album_name, album_cover, intro) values(id, 'user', filename, 'This is the default album');
	insert into picture(user_id, album_name, filename, format, description)
		values(id, 'user', ava_name, substring_index(ava_name, '.', -1), 'This is your profile picture.');

    IF t_error = 1 THEN  
		ROLLBACK;  
	ELSE  
		COMMIT;  
	END IF; 
END if;
select t_error; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddUserWithoutAvatar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUserWithoutAvatar`(IN un varchar(50), IN pwd varchar(50))
BEGIN
declare x int;
declare id varchar(50);
DECLARE t_error INTEGER DEFAULT 0;  
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  

START TRANSACTION;
select count(*) into x from user where username=un;
if x > 0 then
	set t_error = 1;
    rollback;
else
	select int_val into x from info where key_id = "userid";
	set id = CONCAT('#', LPAD(x+1, 8, '0'));
	insert into user(user_id, username, password) values (id, un, pwd);
	update info set int_val = (x+1) where key_id = "userid";
	insert into album(user_id, album_name, intro) values(id, 'user', 'This is a default album');
	IF t_error = 1 THEN  
		ROLLBACK;  
	ELSE  
		COMMIT;  
	END IF; 
END if;
select t_error; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-25 23:44:18
