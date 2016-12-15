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
END