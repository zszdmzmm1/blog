create table if not exists user
(
    uid      int auto_increment comment '用户编号'
        primary key,
    name     varchar(64)                not null comment '用户名',
    email    varchar(128)               not null comment '邮箱',
    password varchar(32)                not null comment '密码',
    role     varchar(16) default '用户' null comment '用户权限等级'
);

truncate table user;

INSERT INTO blog.user (name, email, password, role)
VALUES ('admin', 'admin@qq.com', 'secret', '管理员');

INSERT INTO blog.user (name, email, password, role)
VALUES ('user', 'user@qq.com', '123456', '用户');