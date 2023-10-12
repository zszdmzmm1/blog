package com.auefly;

import com.auefly.config.RootConfig;
import com.auefly.dao.BlogMapper;
import com.auefly.pojo.Post;
import com.auefly.pojo.User;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import java.util.ArrayList;
import java.util.List;

@SpringJUnitConfig(RootConfig.class)
@DisplayName("如果报错，可以启动sql包里的文件再尝试")
public class SqlTest {
    @Autowired
    BlogMapper blogMapper;

    @Test
    @DisplayName("初始化测试")
    public void selectAllUsersTest() {
        Assertions.assertTrue(blogMapper.selectAllUsers().size() >= 1);
    }

    @Test
    @DisplayName("Post列表显示测试")
    public void selectPostsForIndexPageTest() {
        Assertions.assertEquals("博客示例2", blogMapper.selectPostsForIndexPage(1, 2).get(0).getTitle());
        Assertions.assertEquals("博客示例3", blogMapper.selectPostsForIndexPage(1, 2).get(1).getTitle());
    }

    @Test
    @DisplayName("条件搜索Post列表展示测试")
    public void selectPostsByConditionsTest() {
        Post post = new Post();
        User user = new User();
        post.setTitle("博客");
        user.setName("admin");
        post.setUser(user);
        Assertions.assertEquals(2, blogMapper.selectPostsByConditions(post, 0, 2).size());
        Assertions.assertEquals("博客示例", blogMapper.selectPostsByConditions(post, 0, 2).get(0).getTitle());
    }

    @Test
    @DisplayName("添加Post测试")
    public void addPostTest() {
        Post post = addPost();

        blogMapper.addPost(post);
        Assertions.assertEquals("博客", blogMapper.selectPostById(post.getPid()).getTitle());
    }

    @Test
    @DisplayName("Post更新测试")
    public void updateTest() {
        Post post = addPost();

        int pid = post.getPid();
        post.setTitle("博客__update");
        post.setContent("这是一段正文__update");
        blogMapper.updatePost(post);
        Assertions.assertEquals("博客__update", blogMapper.selectPostById(pid).getTitle());
        Assertions.assertEquals("这是一段正文__update", blogMapper.selectPostById(pid).getContent());
    }

    @Test
    @DisplayName("删除Post测试")
    public void deleteTest() {
        Post post1 = addPost();
        Post post2 = addPost();

        List<Integer> ids = new ArrayList<>();
        ids.add(post2.getPid());
        ids.add(post1.getPid());
        blogMapper.deletePosts(ids);
        Assertions.assertNull(blogMapper.selectPostById(post1.getPid()));
        Assertions.assertNull(blogMapper.selectPostById(post2.getPid()));
    }

    @Test
    @DisplayName("删除Post测试")
    public void deleteTest2() {
        Post post1 = addPost();
        Post post2 = addPost();

        blogMapper.deletePosts(post1.getPid(), post2.getPid());
/*        int[] postList = new int[]{post2.getPid(), post1.getPid()};
        blogMapper.deletePost(postList);*/
        Assertions.assertNull(blogMapper.selectPostById(post1.getPid()));
        Assertions.assertNull(blogMapper.selectPostById(post2.getPid()));
    }

    @Test
    @DisplayName("通过用户信息搜索测试")
    public void selectPostsByUserIdTest(){
        Assertions.assertTrue(blogMapper.selectPostsByUserId(2).size() >= 2);
    }


    public Post addPost() {
        Post post = new Post();
        post.setTitle("博客");
        post.setContent("这是一段正文");
        post.setUserId(1);
        post.setStatus(1);
        blogMapper.addPost(post);
        return post;
    }
}