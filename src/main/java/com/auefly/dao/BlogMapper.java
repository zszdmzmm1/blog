package com.auefly.dao;

import com.auefly.pojo.Post;
import com.auefly.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlogMapper {
    List<User> selectAllUsers();

    List<Post> selectPostsForIndexPage(@Param("offset") int offset, @Param("rowCount") int rowCount);

    Post selectPostById(int id);

    List<Post> selectPostsByConditions(@Param("post") Post post, @Param("offset") int offset, @Param("rowCount") int rowCount);

    int addPost(Post post);

    int updatePost(Post post);

    int deletePosts(int... ids);

    int deletePosts(List<Integer> ids);

    List<Post> selectPostsByUserId(int id);

    User selectUsersByEmail(String email);

    User selectUsersById();

    int selectCountsOfPosts();
}