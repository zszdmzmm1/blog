package com.auefly.config.mybatis;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;
@PropertySource("classpath:db.properties")
public class DataSourceConfig {
    @Value("${spring_driverClassName}")
    private String driverClassName;
    @Value("${spring_url}")
    private String url;
    @Value("${spring_username}")
    private String userName;
    @Value("${spring_password}")
    private String password;

    @Bean
    public DataSource dataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUrl(url);
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUsername(userName);
        dataSource.setPassword(password);
        return dataSource;
    }
}
