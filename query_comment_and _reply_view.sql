CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `query_comment_and _reply` AS
    SELECT 
        `a`.`user_id` AS `user_id`,
        `a`.`album_name` AS `album_name`,
        `a`.`filename` AS `picture_name`,
        `a`.`comment_user_id` AS `comment_user_id`,
        `a`.`comment` AS `comment_content`,
        `a`.`create_timestamp` AS `time`,
        `c`.`comment_user_id` AS `reply_user_id`,
        `c`.`comment` AS `reply_content`
    FROM
        ((`comment` `a`
        LEFT JOIN `comment_reply` `b` ON (((`a`.`user_id` = `b`.`owner_user_id`)
            AND (`a`.`album_name` = `b`.`album_name`)
            AND (`a`.`filename` = `b`.`filename`)
            AND (`a`.`comment_id_in_pic` = `b`.`reply_id_in_pic`)
            AND (`a`.`is_valid` = 1))))
        LEFT JOIN `comment` `c` ON (((`b`.`owner_user_id` = `c`.`user_id`)
            AND (`b`.`album_name` = `c`.`album_name`)
            AND (`b`.`filename` = `c`.`filename`)
            AND (`b`.`comment_id_in_pic` = `c`.`comment_id_in_pic`))))