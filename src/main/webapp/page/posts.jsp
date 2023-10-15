<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/9/13
  Time: 3:06
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
    <title>文章列表</title>
    <base href="http://localhost:8080/zszdmzmm_blog_war/">
    <link rel="stylesheet" href="build/assets/app.css">
</head>
<body class="d-flex flex-column h-100">
    <header class="mb-5">
        <!--            导航栏-->
        <jsp:include page="partials/header.jsp"/>
    </header>

    <div class="container" id="main_content">
        <div class="mx-lg-auto">
            <div class="row">
                <c:forEach items="${msg.getData()}" var="post" varStatus="status">
                    <div class="col-md-6 mb-5">
                        <article class="border-bottom h-100 pb-5  pt-md-0">
                            <div class="row justify-content-between">
                                <div class="col-7">
                                    <h2 class="mb-2 h5"><a class="text-inherit text-decoration-none link-body-emphasis"
                                                           href="posts/${post.getPid()}">${post.getTitle()}</a></h2>
                                    <div class="small text-muted">
                                        <a href="posts/${post.getPid()}">${post.getUser().getName()}</a>
                                        <span> - </span>
                                        <span>${post.getPublishTime()} ${post.getLastUpdateTime()}</span>
                                    </div>
                                </div>
                                <div class="col-5">
                                    <div class="d-flex">
                                        <a href="posts/${post.getPid()}" class="w-100">
                                            <img class="img-fluid shadow-sm rounded ratio-16x9"
                                                 src="${post.getCover()}">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </c:forEach>
            </div>
            <div class="text-end">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:if test="${page != 1}">
                            <li class="page-item">
                                <a class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li class="page-item"><span class="page-link" id="current-page">${page}</span></li>
                        <c:if test="${page != pageCount && pageCount != 0}">
                            <li class="page-item">
                                <a class="page-link" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <button class="position-absolute top-50 end-0 rounded-circle btn btn-danger" id="add-post">
        <span class="display-5">+</span>
    </button>
    <%@ include file="./partials/footer.jsp" %>
    <script src="build/assets/app.js"></script>
    <script>
        $(".page-link").click(function () {
            let page = parseInt($("#current-page").text());
            if ($(this).attr("aria-label") === "Next") {
                page = page + 1;
            } else if ($(this).attr("aria-label") === "Previous") {
                page = page - 1;
            } else {
                page = parseInt($(this).text());
            }
            window.location.href = "posts?page=" + page;
        })

        $("#add-post").click(function () {
            if ($("#avatar").length > 0) {
                let id = $("#avatar").attr("class");
                window.location.href = "users/" + id + "/post";
            } else {
                let isLogin = confirm("需要登录，是否跳转到登录页面？");
                if (isLogin) {
                    window.location.href = "login";
                }
            }
        })
    </script>
</body>
</html>
