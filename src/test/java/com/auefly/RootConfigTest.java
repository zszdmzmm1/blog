package com.auefly;

import com.auefly.config.RootConfig;
import com.auefly.dao.BlogMapper;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

@SpringJUnitConfig(RootConfig.class)
public class RootConfigTest {
    @Autowired
    ApplicationContext ac;

    @Autowired
    BlogMapper blogMapper;

    @Test
    @DisplayName("初始化测试，判断postService组件是否被注入")
    public void initialTest(){
        Assertions.assertTrue(ac.containsBean("blogService"));
    }

    @Test
    @DisplayName("blogMapper是否被注入进容器")
    public void mybatisConnectionTest(){
        Assertions.assertNotNull(blogMapper);
    }
}