package com.auefly.config;

import com.auefly.config.mybatis.DataSourceConfig;
import com.auefly.config.mybatis.MybatisConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan("com.auefly.service")
@Import({DataSourceConfig.class, MybatisConfig.class})
public class RootConfig {
}
