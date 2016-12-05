CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUserWithoutAvatar`(IN un varchar(50), IN pwd varchar(50))
BEGIN
declare x int;
select int_val into x from info where key_id = "userid";
insert into user(user_id, username, password) values (CONCAT('#', LPAD(x+1, 8, '0')), un, pwd);
update info set int_val = (x+1) where key_id = "userid";
END