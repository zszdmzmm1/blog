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
1. Spring 与 SpringMVC 的整合:
   1. 我们先引入一些必要的依赖：
       
      ![img_3.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_3.png) 
   2. 写一个启动类，其继承了AbstractAnnotationConfigDispatcherServletInitializer.class, 并最终实现了WebApplicationInitializer接口，其实现类会被jakarta.servlet入口文件识并运行。
   
      ![img_5.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_5.png)
      
      我们可以找到路口文件的路径:
      
      ![img_6.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_6.png)
   3. 最终通过启动类扫入两个config，服务器启动时两个config内的Bean都被注入Spring容器里，与此同时，启动类还指定了与默认Servlet匹配的URL，所有这样的URL都被交给默认Servlet处理：
      
      ![img_7.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_7.png)
2. Spring 与 Mybatis 整合：