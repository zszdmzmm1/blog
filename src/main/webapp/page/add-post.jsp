<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/10/16
  Time: 4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <base href="http://localhost:8080/zszdmzmm_blog_war/">
    <link rel="stylesheet" href="build/assets/app.css">
    <title>发布</title>
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
                    </div>

                    <div class="col-lg-9 mt-3 mt-lg-0">
                        <div class="card shadow-sm">
                            <div class="card-header">
                                文章发布
                            </div>
                            <div class="card-body">
                                <form method="post" enctype="multipart/form-data" action="posts">
                                    <div class="mb-3">
                                        <label for="article-title" class="form-label">标题</label>
                                        <input type="email" class="form-control" id="article-title" name="title"
                                               aria-describedby="emailHelp" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="article-description" class="form-label">描述</label>
                                        <input type="password" class="form-control" id="article-description" name="description">
                                    </div>
                                    <div class="mb-3">
                                        <label for="formCover" class="form-label">选择你的封面</label>
                                        <input class="form-control" type="file" id="formCover" accept="image/*" name="cover">
                                    </div>
                                    <div class="mb-3">
                                        <label for="formFile" class="form-label">选择你的markdown文件</label>
                                        <input class="form-control" type="file" id="formFile" accept=".md" name="content">
                                    </div>

                                    <button id="submit" type="button" class="btn btn-primary">提交</button>
                                </form>
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

        $("#submit").click(function () {

        })
    </script>
</body>
</html>
