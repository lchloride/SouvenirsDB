CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `query_available_album` AS
    SELECT 
        `album`.`user_id` AS `user_id`,
        `album`.`user_id` AS `owner_id`,
        `album`.`album_name` AS `album_name`,
        `album`.`intro` AS `intro`,
        `album`.`album_cover` AS `album_cover`,
        `album`.`create_timestamp` AS `create_timestamp`,
        'true' AS `isPersonal`
    FROM
        `album` 
    UNION SELECT 
        `user_belong_group`.`user_id` AS `user_id`,
        `group`.`group_id` AS `owner_id`,
        `group`.`shared_album_name` AS `album_name`,
        `group`.`intro` AS `intro`,
        `group`.`album_cover` AS `album_cover`,
        `group`.`create_timestamp` AS `create_timestamp`,
        'false' AS `isPersonal`
    FROM
        (`user_belong_group`
        JOIN `group`)
    WHERE
        (`group`.`group_id` = `user_belong_group`.`group_id`)