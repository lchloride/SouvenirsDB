-- 1
INSERT INTO `souvenirs`.`album`
(`user_id`,
`album_name`,
`intro`,
`album_cover`)
VALUES
('#00000001',
'del_test',
'album for delete test',
'\\res\\default_cover.png');
-- 2
INSERT INTO `souvenirs`.`picture`
(`user_id`,
`album_name`,
`filename`,
`format`,
`description`)
VALUES
('#00000001',
'del_test',
'1.jpg',
'jpg',
'example1');
-- 3
INSERT INTO `souvenirs`.`picture`
(`user_id`,
`album_name`,
`filename`,
`format`,
`description`)
VALUES
('#00000001',
'del_test',
'2.jpg',
'jpg',
'example2');
-- 4
INSERT INTO `souvenirs`.`comment`
(`user_id`,
`album_name`,
`filename`,
`comment_id_in_pic`,
`comment_user_id`,
`comment`,
`is_valid`)
VALUES
('#00000001',
'del_test',
'1.jpg',
1,
'#00000002',
'wonderful',
1);
-- 5
INSERT INTO `souvenirs`.`comment`
(`user_id`,
`album_name`,
`filename`,
`comment_id_in_pic`,
`comment_user_id`,
`comment`,
`is_valid`)
VALUES
('#00000001',
'del_test',
'1.jpg',
2,
'#00000001',
'right',
1);
-- 6
INSERT INTO `souvenirs`.`comment_reply`
(`owner_user_id`,
`album_name`,
`filename`,
`comment_id_in_pic`,
`reply_id_in_pic`)
VALUES
('#00000001',
'del_test',
'1.jpg',
1,
2);
-- 7
INSERT INTO `souvenirs`.`like_picture`
(`user_id`,
`album_name`,
`filename`,
`like_user_id`)
VALUES
('#00000001',
'del_test',
'1.jpg',
'#00000001');
-- 8
INSERT INTO `souvenirs`.`like_picture`
(`user_id`,
`album_name`,
`filename`,
`like_user_id`)
VALUES
('#00000001',
'del_test',
'1.jpg',
'#00000002');
-- 9
INSERT INTO `souvenirs`.`like_picture`
(`user_id`,
`album_name`,
`filename`,
`like_user_id`)
VALUES
('#00000001',
'del_test',
'2.jpg',
'#00000003');
-- 10
INSERT INTO `souvenirs`.`salbum_own_picture`
(`group_id`,
`user_id`,
`album_name`,
`filename`)
VALUES
('000000001',
'#00000001',
'del_test',
'1.jpg');
-- 11
INSERT INTO `souvenirs`.`salbum_own_picture`
(`group_id`,
`user_id`,
`album_name`,
`filename`)
VALUES
('000000003',
'#00000001',
'del_test',
'1.jpg');
-- 12
INSERT INTO `souvenirs`.`salbum_own_picture`
(`group_id`,
`user_id`,
`album_name`,
`filename`)
VALUES
('000000003',
'#00000001',
'del_test',
'2.jpg');