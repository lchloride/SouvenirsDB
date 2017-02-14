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
END