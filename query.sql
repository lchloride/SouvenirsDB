-- 添加user表
call AddUserWithoutAvatar('Alice', '123456');
call AddUser('Bob', '000000', 'avatar.jpg');
call AddUser('小明', '111111', 'logo.png');
-- 添加group表
call AddGroupWithoutCover("Alice's Group", "This is Alice's Group");
call AddGroup('Classmate', '2016 computer major', 'cover.jpg');
call AddGroupWithoutCover('Sample', 'Sample Group');

select substring_index('www.example.com', '.', -1);