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
END