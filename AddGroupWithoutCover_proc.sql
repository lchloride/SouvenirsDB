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
END