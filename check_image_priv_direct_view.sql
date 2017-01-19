CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `check_image_priv_direct` AS
    SELECT 
        `user`.`user_id` AS `allowed_user_id`,
        `group`.`shared_album_name` AS `shared_album_name`,
        `salbum_own_picture`.`user_id` AS `owner_id`,
        `salbum_own_picture`.`album_name` AS `album_name`,
        `salbum_own_picture`.`filename` AS `filename`
    FROM
        (((`user`
        JOIN `user_belong_group`)
        JOIN `group`)
        JOIN `salbum_own_picture`)
    WHERE
        ((`user`.`user_id` = `user_belong_group`.`user_id`)
            AND (`user_belong_group`.`group_id` = `group`.`group_id`)
            AND (`group`.`group_id` = `salbum_own_picture`.`group_id`))