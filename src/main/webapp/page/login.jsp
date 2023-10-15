<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/8/26
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <base href="http://localhost:8080/zszdmzmm_blog_war/">
    <title>登录</title>
    <link rel="stylesheet" href="build/assets/app.css">
</head>
<body>
    <div class="vh-100 px-2 mb-5 d-flex flex-column justify-content-between">
        <header class="mb-5">
            <!--            导航栏-->
            <nav class="navbar navbar-expand-sm bg-body-tertiary mb-5 shadow">
                <div class="container-fluid">
                    <div class="navbar-brand">
                        <img src="image/blog/img.png" alt="头像" height="40">
                        <a href="#"
                           class="link-body-emphasis text-body-secondary text-decoration-none">我的主页</a>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav ms-auto">
                            <div class="d-flex">
                                <i class="bi bi-box py-2 nav-item me-1"></i>
                                <a class="me-3 py-2 link-body-emphasis text-decoration-none nav-link"
                                   href="resume/resume.html">简历</a>
                            </div>
                            <div class="d-flex">
                                <i class="bi bi-journal-text py-2 nav-item me-1"></i>
                                <a class="me-3 py-2 link-body-emphasis text-decoration-none nav-link"
                                   href="./page/article.html">博客</a>
                            </div>
                            <div class="d-flex">
                                <i class="bi bi-github py-2 nav-item me-1"></i>
                                <div class="nav-item dropdown">
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
                    </div>
                </div>
            </nav>
        </header>
        <main class="container w-50 p-4 mx-auto mb-5">
            <form method="post" class="card" id="form-login">
                <div class="card-header">登录</div>
                <div class="card-body">
                    <div class="d-flex justify-content-center mb-2 flex-column text-center flex-md-row">
                        <span class="text-danger">&#10003; (推荐方案) </span>
                        <span>使用第三方账号登录</span>
                    </div>
                    <div class="mb-5">
                        <button class="btn btn-outline-danger d-flex mx-auto" type="button">
                            <i class="bi bi-github me-2"></i>
                            <span>GitHub</span>
                        </button>
                    </div>
                    <p class="text-center text-body-secondary fs-6">(备选方案) 邮箱、密码登录</p>
                    <div class="row mb-2 w-75 mx-auto">
                        <label class="col-form-label col-lg-3 col-xl-2" for="email">邮箱</label>
                        <div class="col-lg-9 col-xl-10">
                            <input class="form-control" type="email" id="email" name="email" required value=${cookie.email.value}>
                        </div>
                    </div>
                    <div class="row mb-2 w-75 mx-auto">
                        <label class="col-form-label col-lg-3 col-xl-2" for="password">密码</label>
                        <div class="col-lg-9 col-xl-10 position-relative">
                            <input class="form-control " type="password" id="password" name="password" value="${cookie.password.value}">
                            <div class="invalid-tooltip">请输入长度4到16的密码！</div>
                        </div>
                    </div>
                    <div class="row w-75 mx-auto mb-2">
                        <span class="col-lg-3 col-xl-2"></span>
                        <div class="col-lg-9 col-xl-10">
                            <input id="password-log" type="checkbox" ${cookie.isChecked.value}>
                            <label for="password-log">记住密码</label>
                        </div>
                    </div>
                    <div class="row w-75 mx-auto">
                        <span class="col-lg-3 col-xl-2"></span>
                        <div class="col-lg-9 col-xl-10 position-relative">
                            <button id="login" type="button" class="btn btn-danger me-4 mb-1 d-block d-xl-inline">
                                登录
                            </button>
                            <div class="invalid-tooltip"></div>
                            <a href=""
                               class="text-decoration-none text-body-secondary fs-6 me-4 d-block d-xl-inline mb-1">忘记密码</a>
                            <a href="register"
                               class="text-decoration-none text-body-secondary fs-6 d-block d-xl-inline mb-1">注册新账号</a>
                        </div>
                    </div>
                </div>
            </form>
        </main>
        <%@ include file="./partials/footer.jsp" %>
    </div>

    <script src="build/assets/app.js"></script>
    <script>
        let passwordElement = $("#password");

        //判断密码
        function passwordCheck(passwordValue) {
            let len = passwordValue.val().trim().length;
            if (len <= 6 || len >= 16) {
                if (!passwordValue.hasClass("is-invalid")) {
                    passwordValue.toggleClass("is-invalid")
                }
                return false;
            } else {
                if (passwordValue.hasClass("is-invalid")) {
                    passwordValue.toggleClass("is-invalid")
                }
                return true;
            }
        }


        passwordElement.on("blur", function () {
            passwordCheck($(this));
        })


        $("#login").on("click", function () {
            let email = $("#email").val();
            let password = $("#password").val();
            let isRemember = $("#password-log").is(':checked');
            $.ajax({
                method: "Post",
                url: "login",
                dataType: "json",
                data: {email: email, password: password, isRemember: isRemember}
            })
                .done(function (result) {
                    let code = result.code;
                    let id = result.data.uid;
                    let formElement = $("#form-login");
                    if (code === 200) {
                        formElement.prop("action", "users/" + id);
                        formElement.submit();
                    } else {
                        $(".invalid-tooltip").text(message);
                        if (!$("#login").hasClass("is-invalid")) {
                            $("#login").toggleClass("is-invalid");
                        }
                    }
                })
        })
    </script>
</body>
</html>
