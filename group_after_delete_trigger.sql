CREATE DEFINER=`root`@`localhost` TRIGGER `souvenirs`.`group_AFTER_DELETE` AFTER DELETE ON `group` FOR EACH ROW
BEGIN
declare x int;
select int_val into x from info where key_id = "groupid";
update info set int_val = (x-1) where key_id = "groupid";
END