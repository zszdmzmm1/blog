<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>zszdmzmm的个人网站</title>
    <link rel="stylesheet" href="build/assets/app.css">
</head>
<body>
    <div class="pb-2 px-2">
        <header class="mb-5">
            <!--            导航栏-->
            <nav class="navbar navbar-expand-sm bg-body-tertiary mb-5 shadow">
                <div class="container-fluid">
                    <div class="navbar-brand">
                        <img src="image/blog/img.png" alt="头像" height="40">
                        <a href="#" class="link-body-emphasis text-body-secondary text-decoration-none">我的主页</a>
                    </div>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav ms-auto">
                            <div class="d-flex">
                                <%--                                <i class="bi bi-box py-2 nav-item me-1"></i>--%>
                                <a class="me-3 py-2 link-body-emphasis text-decoration-none nav-link"
                                   href="page/resume/resume.html">简历</a>
                            </div>
                            <div class="d-flex">
                                <%--                                <i class="bi bi-journal-text py-2 nav-item me-1"></i>--%>
                                <a class="me-3 py-2 link-body-emphasis text-decoration-none nav-link"
                                   href="posts">博客</a>
                            </div>
                            <div class="d-flex">
                                <%--                                <i class="bi bi-github py-2 nav-item me-1"></i>--%>
                                <div class="nav-item dropdown" onmouseleave="dropDownMenuHidden()"
                                     onmouseenter="dropDownMenuShow()">
                                    <a class="nav-link dropdown-toggle me-3 py-2 text-decoration-none link-body-emphasis"
                                       href="https://github.com/zszdmzmm1" role="button"
                                       data-bs-toggle="dropdown" aria-expanded="false">
                                        GitHub
                                    </a>

                                    <ul id="dropdown" class="dropdown-menu">
                                        <li>
                                            <a class="dropdown-item" href="https://github.com/zszdmzmm1">个人主页</a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item"
                                               href="https://github.com/zszdmzmm1/learnning">Java仓库</a>
                                        </li>
                                        <li><a class="dropdown-item"
                                               href="https://github.com/zszdmzmm1/zszdmzmm-web">Web仓库</a>
                                        </li>
                                        <li><a class="dropdown-item"
                                               href="https://zszdmzmm1.github.io/bilibili-plugin/">bilibili插件介绍页</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                        <button class="btn btn-outline-danger nav-item">
                            <a href="./login" class="nav-link">登录</a>
                        </button>
                    </div>
                </div>
            </nav>
            <h1 class="display-3 text-center fw-medium animate__animated animate__fadeIn animate__slower">
                zszdmzmm的个人网站</h1>
            <p class="text-body-secondary text-center">用简短的一句话描述你的网站</p>
        </header>
        <main class="w-75 p-lg-5 m-auto m-3">
            <div class="row mb-5">
                <div class="col-md-6 col-12 align-self-center">
                    <h1 class="text-md-start text-center">简历</h1>
                    <p class="text-body-secondary text-md-start text-center">用简短的一句话介绍简历</p>
                </div>
                <img src="image/Snipaste_2023-07-25_10-54-27.png" alt="简历"
                     class="col-12 col-md-6 border rounded-4 shadow">
            </div>
            <div class="row mb-5 d-md-flex flex-row-reverse">
                <div class="col-md-6 col-12 align-self-center">
                    <h1 class="text-md-end text-center">博客</h1>
                    <p class="text-body-secondary text-md-end text-center">用简短的一句话介绍博客</p>
                </div>
                <img src="image/Snipaste_2023-07-25_10-54-27.png" alt="博客"
                     class="col-12 col-md-6 border rounded-4 shadow">
            </div>
            <div class="row mb-5">
                <div class="col-md-6 col-12 align-self-center">
                    <h1 class="text-md-start text-center">模块X</h1>
                    <p class="text-body-secondary text-md-start text-center">用简短的一句话介绍模块X</p>
                </div>
                <img src="image/Snipaste_2023-07-25_10-54-27.png" alt="模块X"
                     class="col-12 col-md-6 border rounded-4 shadow">
            </div>
            <div class="row mb-5 d-md-flex flex-row-reverse">
                <div class="col-md-6 col-12 align-self-center">
                    <h1 class="text-md-end text-center">模块Y</h1>
                    <p class="text-body-secondary text-md-end text-center">用简短的一句话介绍模块Y</p>
                </div>
                <img src="image/Snipaste_2023-07-25_10-54-27.png" alt="模块Y"
                     class="col-12 col-md-6 border rounded-4 shadow">
            </div>
        </main>
        <%@ include file="page/partials/footer.jsp" %>
    </div>
    <script src="build/assets/app.js"></script>
    <script>
        function dropDownMenuShow() {
            document.getElementById("dropdown").setAttribute("class", "dropdown-menu show");
        }

        function dropDownMenuHidden() {
            document.getElementById("dropdown").setAttribute("class", "dropdown-menu");
        }
    </script>
</body>
</html>
