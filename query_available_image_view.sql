CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `query_available_image` AS
    SELECT 
        `user`.`user_id` AS `user_id`,
        `group`.`group_id` AS `album_identifier`,
        `salbum_own_picture`.`user_id` AS `owner_id`,
        `salbum_own_picture`.`album_name` AS `owner_album_name`,
        `salbum_own_picture`.`filename` AS `owner_filename`,
        `picture`.`format` AS `owner_format`,
        `picture`.`description` AS `owner_description`,
        `picture`.`upload_timestamp` AS `owner_upload_timestamp`
    FROM
        ((((`user`
        JOIN `user_belong_group`)
        JOIN `group`)
        JOIN `salbum_own_picture`)
        JOIN `picture`)
    WHERE
        ((`user`.`user_id` = `user_belong_group`.`user_id`)
            AND (`user_belong_group`.`group_id` = `group`.`group_id`)
            AND (`group`.`group_id` = `salbum_own_picture`.`group_id`)
            AND (`salbum_own_picture`.`user_id` = `picture`.`user_id`)
            AND (`salbum_own_picture`.`album_name` = `picture`.`album_name`)
            AND (`salbum_own_picture`.`filename` = `picture`.`filename`)) 
    UNION SELECT 
        `picture`.`user_id` AS `user_id`,
        `picture`.`album_name` AS `album_identifier`,
        `picture`.`user_id` AS `owner_id`,
        `picture`.`album_name` AS `owner_album_name`,
        `picture`.`filename` AS `owner_filename`,
        `picture`.`format` AS `owner_format`,
        `picture`.`description` AS `owner_description`,
        `picture`.`upload_timestamp` AS `owner_upload_timestamp`
    FROM
        `picture`