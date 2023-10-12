package com.auefly.pojo;

import lombok.Data;

@Data
public class Post {
    private int pid;
    private int userId;
    private String title;
    private String cover;
    private String description;
    private String publishTime;
    private String lastUpdateTime;
    private String content;
    private int status;
    private int view;

    private User user;
}