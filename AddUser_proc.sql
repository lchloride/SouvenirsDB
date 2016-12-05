CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUser`(IN un varchar(50), IN pwd varchar(50), IN ava_name varchar(260))
BEGIN
declare x int;
declare id varchar(9);
select int_val into x from info where key_id = "userid";
set id = CONCAT('#', LPAD(x+1, 8, '0'));
insert into user values (id, un, pwd, CONCAT('\\',id, '\\user\\', ava_name));
update info set int_val = (x+1) where key_id = "userid";
END