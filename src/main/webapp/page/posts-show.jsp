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
        <jsp:include page="partials/header.jsp"/>
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
