<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/9/13
  Time: 3:29
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
    <title>${msg.getData().getTitle()}</title>
    <style>
        .toc-link{
            text-decoration: none;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
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
                            <a class="me-3 py-2 link-body-emphasis text-decoration-none nav-link"
                               href="page/test-navigator.html">测试导航页</a>
                        </div>
                        <div class="d-flex">
                            <i class="bi bi-box py-2 nav-item me-1"></i>
                            <a class="me-3 py-2 link-body-emphasis text-decoration-none nav-link"
                               href="page/resume/resume.html">简历</a>
                        </div>
                        <div class="d-flex">
                            <i class="bi bi-journal-text py-2 nav-item me-1"></i>
                            <a class="me-3 py-2 link-body-emphasis text-decoration-none nav-link"
                               href="page/article-list.html">博客</a>
                        </div>
                        <div class="d-flex">
                            <i class="bi bi-github py-2 nav-item me-1"></i>
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
    </header>

    <section class="single-post container" id="main_content">
        <div class="row">
            <div class="col-lg-8">
                <h2 class="title text-center animate__animated animate__fadeInTopLeft">${msg.getData().getTitle()}</h2>
                <p class="meta text-muted mb-5 text-center animate__animated animate__fadeInLeft ">
                    <a href="#" class="text-body-secondary">${msg.getData().getUser().getName()}</a>
                    <span> -- </span>
                    <span class="text-body-secondary">发布于:${msg.getData().getPublishTime()} </span>
                    <span class="text-body-secondary">上次更新:${msg.getData().getLastUpdateTime()}</span>
                </p>
                <div id="vditor-preview-element" class="markdown-body js-toc-content animate__animated animate__fadeInLeft vditor-reset">
                    ${msg.getData().getContent()}
                </div>
            </div>
            <div class="col-lg-3 offset-lg-1">
                <div id="outline" class="js-toc toc sticky-top d-none d-lg-block animate__animated animate__fadeInRight animate__delay-1s"></div>
            </div>
        </div>
    </section>
    <%@ include file="./partials/footer.jsp" %>
    <script src="build/assets/app.js"></script>
    <script>
        $(function () {
            tocbot.init({
                // Where to render the table of contents.
                tocSelector: '.js-toc',
                // Where to grab the headings to build the table of contents.
                contentSelector: '.js-toc-content',
                // Which headings to grab inside of the contentSelector element.
                headingSelector: 'h1, h2, h3, h4, h5, h6',
                // For headings inside relative or absolute positioned containers within content.
                hasInnerContainers: false,
                collapseDepth: 6,
            });
            $(".js-toc a.toc-link").mouseover(function () {
                $(this).attr('title', $(this).text());
            });
            $('.js-toc a.toc-link').on('click', function (e) {
                //store hash
                const href = $(this).attr("href");
                const hash = href.substr(href.indexOf("#"));
                // animate
                $(hash).animateCss('slow');
                $(hash).animateCss('flash');
            });
        });
    </script>
</body>
</html>
