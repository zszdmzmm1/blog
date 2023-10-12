package com.auefly.pojo;

import lombok.Data;

import java.util.List;

@Data
public class User {
    private int uid;
    private String name;
    private String email;
    private String password;

    private List<Post> postList;
}