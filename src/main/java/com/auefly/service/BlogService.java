package com.auefly.service;

import com.auefly.pojo.Post;
import com.auefly.util.R;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface BlogService {
    List<Post> index(int page, int perPage);

    @Transactional
    int store(Post post);

    Post show(int id);

    @Transactional
    int update(int id, Post post);

    @Transactional
    int delete(int id);

    List<Post> search(Post post);

    R login(String email, String password);

    List<Post> showByUser(int id);

    int postsCount();
}
