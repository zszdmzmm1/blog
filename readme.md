### 简单博客的搭建过程
#### 项目的初始化
1. 新建一个项目，本人使用ideal工具，新建的部分选项如下： 

    ![img.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg.png)
2. 在pom.xml文件添加一些字段，规避一些与代码无关的潜在问题
   1. 在property标签内，指定编译时的JDK版本信息：
   
      ![img_1.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_1.png)
   2. 在build标签内，写入两个plugin：第一个解决运行 `mvn test` 命令时出现预期外的报错；第二个解决打包时出现一些预期外的错误，如运行 `mvn package`时。
   
      ![img_2.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_2.png)
#### SSM整合
1. Spring 与 SpringMVC 的整合，目标是当Servlet Container打开时，可以生成一个我们所需的Spring容器。
   1. 我们先引入一些必要的依赖：
       
      ![img_3.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_3.png) 
   2. 写一个启动类，其继承了AbstractAnnotationConfigDispatcherServletInitializer.class, 并最终实现了WebApplicationInitializer接口，其实现类会被jakarta.servlet入口文件识并运行。
   
      ![img_5.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_5.png)
      
      我们可以找到路口文件的路径:
      
      ![img_6.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_6.png)
   3. 最终通过启动类扫入两个config，服务器启动时两个config内的Bean都被注入Spring容器里，与此同时，启动类还指定了与默认Servlet匹配的URL，所有这样的URL都被交给默认Servlet处理：
      
      ![img_7.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_7.png)
2. Spring 与 Mybatis 整合：在 spring 与 springMVC 顺利整合后，每当Servlet Container打开时，我们便有了一个Spring容器，所以当我们要把Mybatis也整合进来时，只需把需要的东西注入容器即可。 
   1. 同理，引入一些必要的依赖：
   
      ```xml
      <!--    本人的MySQL的版本为8.0.33，在与java连接时有概率会出现一些代码外的报错，第一个依赖的存在可以解决这个问题。    -->
        <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.28</version>
        </dependency>
      
      <!-- 以下三个依赖建立了 mybatis 与 spring 与 jdbc 的连接-->
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis</artifactId>
            <version>3.5.13</version>
        </dependency>
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis-spring</artifactId>
            <version>3.0.2</version>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-jdbc</artifactId>
            <version>5.1.6.RELEASE</version>
        </dependency>
      
      <!-- 这个依赖用于新建一个用于连接的DataSource实现类对象 -->
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid</artifactId>
            <version>1.2.15</version>
        </dependency>   ```
   2. 关于mybatis，我们需要的是最后的Dao层的Mapper, 所以我们最终只需将Mapper注入容器，其余的工作通过提供配置与材料让spring替我们完成，通过观察源码，要想获得Mapper， 我仍需要一个DataSource和SqlSessionFactoryBean，为此我写了两个配置类：
      1. 第一个用于往容器注入一个dataSource:
         
         ![img_8.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_8.png)
         
         另需一个配置文件配合，在此不再赘述，有几点值得注意：给写key:value时，需要规避直接使用username这样的key，在spring中，这个key已经有默认含义，不可被取用；url在满足连接需求的情况下，可以多带一些参数，避免一些不必要的报错,参数用'?'和'&'带与连接：
         `spring_url=jdbc:mysql://localhost:3306/blog?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&useSSL=false&allowPublicKeyRetrieval=true`
      2. 第二个用于往容器注入一个SqlSessionFactoryBean 与Mapper的映射器：
      
         ![img_9.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_9.png)
   3. 最后，我们在RootConfig中引入这两个配置类，指定包下的mapper就被成功注入容器：
      
      ![img_10.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_10.png)