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
END