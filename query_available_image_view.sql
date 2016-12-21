CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `query_available_image` AS
    SELECT 
        `user`.`user_id` AS `user_id`,
        `group`.`shared_album_name` AS `album_name`,
        `salbum_own_picture`.`user_id` AS `owner_id`,
        `salbum_own_picture`.`album_name` AS `owner_album_name`,
        `salbum_own_picture`.`filename` AS `owner_filename`
    FROM
        (((`user`
        JOIN `user_belong_group`)
        JOIN `group`)
        JOIN `salbum_own_picture`)
    WHERE
        ((`user`.`user_id` = `user_belong_group`.`user_id`)
            AND (`user_belong_group`.`group_id` = `group`.`group_id`)
            AND (`group`.`group_id` = `salbum_own_picture`.`group_id`)) 
    UNION SELECT 
        `picture`.`user_id` AS `user_id`,
        `picture`.`album_name` AS `album_name`,
        `picture`.`user_id` AS `owner_id`,
        `picture`.`album_name` AS `owner_album_name`,
        `picture`.`filename` AS `owner_filename`
    FROM
        `picture`