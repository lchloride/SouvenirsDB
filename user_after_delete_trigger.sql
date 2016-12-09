CREATE DEFINER=`root`@`localhost` TRIGGER `souvenirs`.`user_AFTER_DELETE` AFTER DELETE ON `user` FOR EACH ROW
BEGIN
declare x int;
select int_val into x from info where key_id = "userid";
update info set int_val = (x-1) where key_id = "userid";
END