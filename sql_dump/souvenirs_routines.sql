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
 1 AS `user_id`,
 1 AS `owner_id`,
 1 AS `album_name`,
 1 AS `intro`,
 1 AS `album_cover`,
 1 AS `create_timestamp`,
 1 AS `isPersonal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_comment_and _reply`
--

DROP TABLE IF EXISTS `query_comment_and _reply`;
/*!50001 DROP VIEW IF EXISTS `query_comment_and _reply`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `query_comment_and _reply` AS SELECT 
 1 AS `user_id`,
 1 AS `album_name`,
 1 AS `filename`,
 1 AS `comment_id`,
 1 AS `comment_user_id`,
 1 AS `comment`,
 1 AS `is_valid`,
 1 AS `time`,
 1 AS `replied_comment_id`*/;
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
 1 AS `album_identifier`,
 1 AS `is_personal`,
 1 AS `owner_id`,
 1 AS `owner_album_name`,
 1 AS `owner_filename`,
 1 AS `owner_format`,
 1 AS `owner_description`,
 1 AS `owner_upload_timestamp`*/;
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
/*!50001 VIEW `query_available_album` AS select `album`.`user_id` AS `user_id`,`album`.`user_id` AS `owner_id`,`album`.`album_name` AS `album_name`,`album`.`intro` AS `intro`,`album`.`album_cover` AS `album_cover`,`album`.`create_timestamp` AS `create_timestamp`,'true' AS `isPersonal` from `album` union select `user_belong_group`.`user_id` AS `user_id`,`group`.`group_id` AS `owner_id`,`group`.`shared_album_name` AS `album_name`,`group`.`intro` AS `intro`,`group`.`album_cover` AS `album_cover`,`group`.`create_timestamp` AS `create_timestamp`,'false' AS `isPersonal` from (`user_belong_group` join `group`) where (`group`.`group_id` = `user_belong_group`.`group_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_comment_and _reply`
--

/*!50001 DROP VIEW IF EXISTS `query_comment_and _reply`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_comment_and _reply` AS select `comment`.`user_id` AS `user_id`,`comment`.`album_name` AS `album_name`,`comment`.`filename` AS `filename`,`comment`.`comment_id_in_pic` AS `comment_id`,`comment`.`comment_user_id` AS `comment_user_id`,`comment`.`comment` AS `comment`,`comment`.`is_valid` AS `is_valid`,`comment`.`create_timestamp` AS `time`,`comment_reply`.`comment_id_in_pic` AS `replied_comment_id` from (`comment` left join `comment_reply` on(((`comment`.`user_id` = `comment_reply`.`owner_user_id`) and (`comment`.`album_name` = `comment_reply`.`album_name`) and (`comment`.`filename` = `comment_reply`.`filename`) and (`comment`.`comment_id_in_pic` = `comment_reply`.`reply_id_in_pic`)))) */;
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
/*!50001 VIEW `query_available_image` AS select `user`.`user_id` AS `user_id`,`group`.`group_id` AS `album_identifier`,'false' AS `is_personal`,`salbum_own_picture`.`user_id` AS `owner_id`,`salbum_own_picture`.`album_name` AS `owner_album_name`,`salbum_own_picture`.`filename` AS `owner_filename`,`picture`.`format` AS `owner_format`,`picture`.`description` AS `owner_description`,`picture`.`upload_timestamp` AS `owner_upload_timestamp` from ((((`user` join `user_belong_group`) join `group`) join `salbum_own_picture`) join `picture`) where ((`user`.`user_id` = `user_belong_group`.`user_id`) and (`user_belong_group`.`group_id` = `group`.`group_id`) and (`group`.`group_id` = `salbum_own_picture`.`group_id`) and (`salbum_own_picture`.`user_id` = `picture`.`user_id`) and (`salbum_own_picture`.`album_name` = `picture`.`album_name`) and (`salbum_own_picture`.`filename` = `picture`.`filename`)) union select `picture`.`user_id` AS `user_id`,`picture`.`album_name` AS `album_identifier`,'true' AS `is_personal`,`picture`.`user_id` AS `owner_id`,`picture`.`album_name` AS `owner_album_name`,`picture`.`filename` AS `owner_filename`,`picture`.`format` AS `owner_format`,`picture`.`description` AS `owner_description`,`picture`.`upload_timestamp` AS `owner_upload_timestamp` from `picture` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'souvenirs'
--

--
-- Dumping routines for database 'souvenirs'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddComment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddComment`(IN uid varchar(9), IN an varchar(60), In fn varchar(70), 
	In cuid varchar(9), in c varchar(200), in rid int)
BEGIN
    DECLARE result INTEGER DEFAULT 1;  
	declare x integer default 0;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET result=0;  

    
	START TRANSACTION;
	select count(*) into x from comment where user_id = uid and album_name = an and filename = fn;
    
    INSERT INTO 
    `souvenirs`.`comment`(`user_id`, 
    `album_name`,	
    `filename`, 
    `comment_id_in_pic`,
    `comment_user_id`,
	`comment`) 
    VALUES (uid, an, fn, x+1, cuid, c);
    
    if rid > 0 then
		insert into comment_reply values(uid, an, fn, CONVERT(rid,signed), x+1);
    end if;
    IF result = 0 THEN  
		ROLLBACK;  
	ELSE  
		COMMIT;  
	END IF; 
select result; 	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `ReportComment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportComment`(IN ruid varchar(9), IN puid varchar(9), IN an varchar(9), 
	IN pn varchar(9), IN cid varchar(9), IN rl varchar(50), IN rc varchar(300))
BEGIN
    DECLARE result INTEGER DEFAULT 1;  
	declare x integer default 0;
    declare original_cover varchar(200);
    declare test_cover varchar(200);
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET result=0;  

    
	START TRANSACTION;
    insert into comment_report(report_user_id, picture_user_id, album_name, picture_name, comment_id, report_label, report_content) 
		values(ruid, puid, an, pn, convert(cid, signed), rl, rc);
	IF result = 0 THEN  
		ROLLBACK;  
	ELSE  
		COMMIT;  
	END IF; 
select result;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sharePicture` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sharePicture`(IN uid varchar(9), IN an varchar(60), IN fn varchar(70), IN gid varchar(9))
BEGIN
	DECLARE result INTEGER DEFAULT 1;  
    declare x integer default 0;
    declare y integer default 1;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET result=0; 
    
    START TRANSACTION;
    select count(*) into x from user_belong_group where `user_id`=uid and `group_id`=gid;
    if x = 0 then
		set result = 0;
	else
		select count(*) into y from salbum_own_picture where `user_id`=uid and `group_id`=gid and `album_name`=an and `filename`=fn;
        if y = 0 then
			insert into salbum_own_picture(`group_id`, `user_id`, `album_name`, `filename`) values (gid, uid, an, fn);
		else
			set result = 2;
		end if;
    end if;
    IF result = 0 THEN  
		ROLLBACK;  
	ELSE  
		COMMIT;  
	END IF; 
select result; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UnsharePicture` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UnsharePicture`(IN uid varchar(9), IN an varchar(60), IN fn varchar(70), IN gid varchar(9))
BEGIN
	DECLARE result INTEGER DEFAULT 1;  
    declare x integer default 0;
    declare y integer default 1;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET result=0; 
    
    START TRANSACTION;
    select count(*) into x from user_belong_group where `user_id`=uid and `group_id`=gid;
    if x = 0 then
		set result = 0;
	else
		select count(*) into y from salbum_own_picture where `user_id`=uid and `group_id`=gid and `album_name`=an and `filename`=fn;
        if y = 0 then
			delete from salbum_own_picture where `user_id`=uid and `group_id`=gid and `album_name`=an and `filename`=fn;
		else
			set result = 2;
		end if;
    end if;
    IF result = 0 THEN  
		ROLLBACK;  
	ELSE  
		COMMIT;  
	END IF; 
select result; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateAlbumName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateAlbumName`(IN id varchar(9), IN old_name varchar(60), IN new_name varchar(60))
label:BEGIN
	-- Firstly add new item to table album, picture, comment
    -- Then update original item of table comment_reply, like_picture, salbum_own_picture
    DECLARE result INTEGER DEFAULT 1;  
	declare x integer default 0;
    declare old_album_cover varchar(60);
    declare new_album_cover varchar(60);
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET result=0;  

    
	START TRANSACTION;
    select count(*) into x from album where user_id=id and album_name = old_name; -- no matching item of old_name

    if x = 0 then
		set result = 0;
	else
        insert into album select user_id, new_name, intro, album_cover, create_timestamp from album where user_id=id and album_name=old_name;
		insert into picture select user_id, new_name, filename, `format`, description, upload_timestamp from picture where user_id=id and album_name=old_name;
		insert into comment select user_id, new_name, filename, comment_id_in_pic, comment_user_id, comment, is_valid, create_timestamp from comment where user_id=id and album_name=old_name;

        update comment_reply set album_name = new_name where owner_user_id=id and album_name=old_name;
		update salbum_own_picture set album_name=new_name where user_id=id and album_name=old_name;
		update like_picture set album_name = new_name where user_id=id and album_name=old_name;
		
        delete from comment where user_id=id and album_name=old_name;
		delete from picture where user_id=id and album_name=old_name;
		delete from album where user_id=id and album_name=old_name;
        
        select album_cover into old_album_cover from album where user_id=id and album_name=new_name;
        set new_album_cover = replace(old_album_cover, old_name, new_name);
        update album set album_cover=new_album_cover where user_id=id and album_name=new_name;
	end if;
    
    IF result = 0 THEN  
		ROLLBACK;  
	ELSE  
		COMMIT;  
	END IF; 
select result; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePictureName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePictureName`(IN uid varchar(9), IN an varchar(60), IN ofn varchar(70), in nfn varchar(70))
BEGIN
-- Firstly add new item to table album, picture, comment
    -- Then update original item of table comment_reply, like_picture, salbum_own_picture
    DECLARE result INTEGER DEFAULT 1;  
	declare x integer default 0;
    declare original_cover varchar(200);
    declare test_cover varchar(200);
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET result=0;  

    
	START TRANSACTION;
    select count(*) into x from picture where user_id=uid and album_name = an and filename=ofn; -- no matching item of ofn

    if x = 0 then
		set result = 0;
	else
		insert into picture select `user_id`, `album_name`, nfn, `format`, `description`, `upload_timestamp` from picture where user_id=uid and album_name=an and filename=ofn;
		insert into `comment` select `user_id`, `album_name`, nfn, `comment_id_in_pic`, `comment_user_id`, `comment`, `is_valid`, `create_timestamp` from `comment` where user_id=uid and album_name=an and filename=ofn;

        update comment_reply set filename = nfn where owner_user_id=uid and album_name=an and filename=ofn;
		update salbum_own_picture set filename = nfn where user_id=uid and album_name=an and filename = ofn;
		update like_picture set filename = nfn where user_id=uid and album_name=an and filename = ofn;
		
        delete from comment where user_id=uid and album_name=an and filename=ofn;
		delete from picture where user_id=uid and album_name=an and filename=ofn;
        
        set test_cover = concat_ws('\\\\', "", uid, an, ofn);
        select album_cover into original_cover from album where user_id=uid and album_name = an;
        if strcmp(test_cover, original_cover) = 0 then 
			update album set album_cover=concat_ws('\\\\', "", uid, an, nfn) where user_id = uid and album_name = an;
        end if;
        
	end if;
    
    IF result = 0 THEN  
		ROLLBACK;  
	ELSE  
		COMMIT;  
	END IF; 
select result; 
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

-- Dump completed on 2017-02-20  0:22:04
