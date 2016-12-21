CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `query_available_album` AS
    SELECT 
        `album`.`album_name` AS `album_name`,
        `album`.`user_id` AS `user_id`
    FROM
        `album` 
    UNION SELECT 
        `group`.`shared_album_name` AS `album_name`,
        `user_belong_group`.`user_id` AS `user_id`
    FROM
        (`user_belong_group`
        JOIN `group`)
    WHERE
        (`group`.`group_id` = `user_belong_group`.`group_id`)