create table post
(
    pid              int auto_increment comment '文章编号'
        primary key,
    user_id          int                                not null comment '文章作者用户id',
    title            varchar(256)                       not null comment '文章标题',
    cover            varchar(128)                       null comment '文章封面',
    description      varchar(512)                       null comment '描述',
    publish_time     datetime default CURRENT_TIMESTAMP not null comment '文章发表时间',
    last_update_time datetime default CURRENT_TIMESTAMP not null comment '上次更新时间',
    content          text                               not null comment '文章内容',
    status           int      default 0                 not null comment '文章状态: 1.发表；0：草稿；',
    view             int      default 0                 not null comment '浏览量'
);