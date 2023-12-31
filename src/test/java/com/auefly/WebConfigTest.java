package com.auefly;

import com.auefly.config.WebConfig;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

@SpringJUnitConfig(WebConfig.class)
public class WebConfigTest {
    @Autowired
    ApplicationContext ac;

    @Test
    @DisplayName("初始化测试，判断postController组件是否被注入")
    public void initialTest(){
        Assertions.assertTrue(ac.containsBean("blogController"));
    }
}
