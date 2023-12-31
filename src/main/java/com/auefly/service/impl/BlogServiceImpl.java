package com.auefly.service.impl;

import com.auefly.dao.BlogMapper;
import com.auefly.pojo.Page;
import com.auefly.pojo.Post;
import com.auefly.pojo.User;
import com.auefly.service.BlogService;
import com.auefly.util.MarkdownFraser;
import com.auefly.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper mapper;

    @Override
    public Page<Post> index(int curPage, int perPage) {
        Page<Post> page = new Page<>();
        page.setT(mapper.selectPostsForIndexPage((curPage - 1) * perPage, perPage));
        page.setPage(curPage);
        int counts = mapper.selectCountsOfPosts();
        page.setCount(counts);
        page.setTotalPage((counts % perPage == 0) ? (counts / perPage) : (counts / perPage + 1));
        return page;
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
        return search(post, 1, 8);
    }

    @Override
    public R login(String email, String password) {
        User user = mapper.selectUsersByEmail(email);
        if (user == null) {
            return R.fail("邮箱不存在");
        } else if (user.getPassword().equals(password)) {
            return R.ok(user);
        } else {
            return R.fail("密码错误");
        }
    }

    @Override
    public List<Post> showByUser(int id) {
        return mapper.selectPostsByUserId(id);
    }

    @Override
    public int postsCount() {
        return mapper.selectCountsOfPosts();
    }

    public List<User> getAPageUser(int page, int perPage) {
        return mapper.getAPageUser((page - 1) * 10, perPage);
    }

    @Override
    public int usersCount() {
        return mapper.selectCountsOfUsers();
    }

    @Override
    public int deletePosts(int... ids) {
        return mapper.deletePosts(ids);
    }

    @Override
    public int deletePosts(List<Integer> ids) {
        return mapper.deletePosts(ids);
    }

    @Override
    public Post selectPostById(int id) {
        return mapper.selectPostById(id);
    }

    public List<Post> search(Post post, int page, int perPage) {
        return mapper.selectPostsByConditions(post, (page - 1) * perPage, perPage);
    }

}