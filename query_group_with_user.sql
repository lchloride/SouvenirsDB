CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `query_group_with_user` AS
    SELECT 
        `group`.`group_id` AS `group_id`,
        `group`.`group_name` AS `group_name`,
        `group`.`album_cover` AS `album_cover`,
        `group`.`intro` AS `intro`,
        `group`.`shared_album_name` AS `shared_album_name`,
        `group`.`create_timestamp` AS `create_timestamp`,
        `user_belong_group`.`user_id` AS `user_id`
    FROM
        (`user_belong_group`
        JOIN `group`)
    WHERE
        (`user_belong_group`.`group_id` = `group`.`group_id`)