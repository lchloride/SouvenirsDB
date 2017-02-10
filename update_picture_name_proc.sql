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
END