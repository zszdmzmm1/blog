<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/8/23
  Time: 8:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>个人主页</title>
    <base href="http://localhost:8080/zszdmzmm_blog_war/">
    <link rel="stylesheet" href="build/assets/app.css">
</head>
<body>
    <div class="vh-100 px-2 mb-5 d-flex flex-column justify-content-between">
        <div>
            <header class="mb-5">
                <!--            导航栏-->
                <jsp:include page="partials/header.jsp"/>
            </header>
            <main class="container user-center" id="main_content">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="image/blog/default-avatar.png"
                                         class="img-fluid rounded-circle avatar shadow-sm">
                                    <p class="text-muted font-size-14 mt-2 mb-2rem">${user.getName()}</p>
                                </div>

                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="logout">
                                            <i class="bi bi-info-circle"></i>
                                            注销
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <c:if test="${user.getRole() == '管理员'}">
                            <button class="btn btn-primary" id="control">控制面板</button>
                        </c:if>
                    </div>

                    <div class="col-lg-9 mt-3 mt-lg-0">
                        <div class="card shadow-sm">
                            <div class="card-header">
                                个人资料
                            </div>
                            <div class="card-body">
                                <p class="item">
                                    用户名：<span>${user.getName()}</span>
                                </p>
                                <p class="item">
                                    邮&emsp;箱：<span>${user.getEmail()}</span>
                                </p>
                            </div>
                        </div>

                        <div class="mt-3 mt-lg-0">
                            <div class="card">
                                <div class="card-header">
                                    我的博客
                                </div>
                                <c:forEach items="${postList}" var="post" varStatus="status">
                                    <div class="mb-5">
                                        <article class="border-bottom h-100 pb-5  pt-md-0">
                                            <div class="row justify-content-between p-3">
                                                <div class="col-6">
                                                    <h2 class="mb-2 h5"><a
                                                            class="text-inherit text-decoration-none link-body-emphasis"
                                                            href="posts/${post.getPid()}">${post.getTitle()}</a></h2>
                                                    <div class="small text-muted">
                                                        <a href="posts/${post.getPid()}">${post.getUser().getName()}</a>
                                                        <span> - </span>
                                                        <span>${post.getPublishTime()} ${post.getLastUpdateTime()}</span>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="d-flex">
                                                        <a href="posts/${post.getPid()}" class="w-100">
                                                            <img class="img-fluid shadow-sm rounded ratio-16x9"
                                                                 src="${post.getCover()}">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <button class="btn btn-danger" id="delete">-</button>
                                                    <button class="btn btn-danger" id="update">u</button>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                    </div>
                </div>
            </main>
        </div>
        <%@ include file="./partials/footer.jsp" %>
    </div>
    <script src="build/assets/app.js"></script>
    <script>
        $("#logout").click(function () {
            $.ajax({
                method: "GET",
                url: "logout",
            })
                .done(function () {
                    window.location.reload();
                })
        })

        $("#control").click(function () {
            window.location.href = "admin/dashboard";
        })
    </script>
</body>
</html>
