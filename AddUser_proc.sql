CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUser`(IN un varchar(50), IN pwd varchar(50), IN ava_name varchar(260))
BEGIN
DECLARE t_error INTEGER DEFAULT 0;  
declare x int;
declare id varchar(9);
declare filename varchar(260);
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  

	
START TRANSACTION;

SELECT 
    int_val
INTO x FROM
    info
WHERE
    key_id = 'userid';
	
    set id = CONCAT('#', LPAD(x+1, 8, '0'));
	set filename = CONCAT('\\',id, '\\user\\', ava_name);
	insert into user values (id, un, pwd, filename);
	UPDATE info 
SET 
    int_val = (x + 1)
WHERE
    key_id = 'userid';
	insert into album values(id, 'user', filename, 'This is the default album');
	insert into picture(user_id, album_name, filename, format, description)
		values(id, 'user', ava_name, substring_index(ava_name, '.', -1), 'This is your profile picture.');

    IF t_error = 1 THEN  
		ROLLBACK;  
	ELSE  
		COMMIT;  
	END IF; 
    select t_error; 
END