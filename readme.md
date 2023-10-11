### 简单博客的搭建过程
#### 项目的初始化
1. 新建一个项目，本人使用ideal工具，新建的部分选项如下： 

    ![img.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg.png)
2. 在pom.xml文件添加一些字段，规避一些与代码无关的潜在问题
   1. 在property标签内，指定编译时的JDK版本信息：
   
      ![img_1.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_1.png)
   2. 在build标签内，写入两个plugin：第一个解决运行 `mvn test` 命令时出现预期外的报错；第二个解决打包时出现一些预期外的错误，如运行 `mvn package`时。
   
      ![img_2.png](src%2Fmain%2Fwebapp%2Fimage%2Fmd%2Fimg_2.png)