package com.auefly.service.impl;

import com.auefly.dao.BlogMapper;
import com.auefly.pojo.Post;
import com.auefly.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper mapper;

    @Override
    public List<Post> index(int page, int perPage) {
        return mapper.selectPostsForIndexPage((page - 1) * perPage, perPage);
    }

    @Override
    public int store(Post post) {
        return mapper.addPost(post);
    }

    @Override
    public Post show(int id) {
        return mapper.selectPostById(id);
    }

    @Override
    public int update(int id, Post post) {
        post.setPid(id);
        return mapper.updatePost(post);
    }

    @Override
    public int delete(int id) {
        return mapper.deletePosts(id);
    }

    @Override
    public List<Post> search(Post post) {
        return search(post, 1, 4);
    }

    public List<Post> search(Post post, int page, int perPage) {
        return mapper.selectPostsByConditions(post, (page - 1) * perPage, perPage);
    }

}