CREATE PROCEDURE `AddGroupWithoutCover` (IN gn varchar(50), IN intro varchar(200))
BEGIN
declare x int;
declare id varchar(9);
select int_val into x from info where key_id = "groupid";
set id = LPAD(x+1, 9, '0');
insert into user(group_id, group_name, intro) values (id, gn, intro);
update info set int_val = (x+1) where key_id = "groupid";
END
