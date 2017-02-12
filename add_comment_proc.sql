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
END