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
END