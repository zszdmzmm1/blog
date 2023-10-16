<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/8/29
  Time: 15:53
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
    <title>注册</title>
    <link rel="stylesheet" href="build/assets/app.css">
</head>
<body>
    <div class="vh-100 px-2 mb-5 d-flex flex-column justify-content-between">
        <jsp:include page="partials/header.jsp"/>
        <main class="container w-50 p-4 mx-auto mb-5">
            <form action="user/" method="post" class="card">
                <div class="card-header">注册</div>
                <div class="card-body">
                    <div class="row mb-2 w-75 mx-auto mb-4">
                        <label class="col-form-label col-lg-3 col-xxl-2 text-lg-end text-start" for="email">邮箱</label>
                        <div class="col-lg-9 col-xxl-10">
                            <input class="form-control" type="email" id="email" name="email" required
                                   onblur="emailVerify()">
                        </div>
                    </div>
                    <div class="row mb-2 w-75 mx-auto mb-4">
                        <label class="col-form-label col-lg-3 col-xxl-2 text-lg-end text-start"
                               for="user">用户名</label>
                        <div class="col-lg-9 col-xxl-10 position-relative">
                            <input class="form-control" type="text" id="user" required>
                            <div class="invalid-tooltip">请输入长度4到16的用户名！</div>
                        </div>

                    </div>
                    <div class="row mb-2 w-75 mx-auto mb-4">
                        <label class="col-form-label col-lg-3 col-xxl-2 text-lg-end text-start"
                               for="password">密码</label>
                        <div class="col-lg-9 col-xxl-10 position-relative">
                            <input class="form-control " type="password" id="password" name="password" required>
                            <div class="invalid-tooltip">请输入长度4到16的密码！</div>
                        </div>
                    </div>
                    <div class="row mb-2 w-75 mx-auto mb-4">
                        <label class="col-form-label col-lg-3 col-xxl-2 text-lg-end text-start"
                               for="verify-code">验证码</label>
                        <div class="col-lg-9 col-xxl-10">
                            <input class="form-control mb-3" type="text" id="verify-code" name="verify-code"
                                   required>
                            <%--<img src="setVerifyCodeServlet" alt="验证"
                                 onclick="this.src='setVerifyCodeServlet?'+ Math.random()">--%>
                            <button type="button" class="btn btn-danger" id="emailCode">获取验证码</button>
                        </div>
                    </div>
                    <div class="row w-75 mx-auto">
                        <span class="col-lg-3 col-xxl-2"></span>
                        <div class="col-lg-9 col-xxl-10 position-relative">
                            <button id="register" type="button" class="btn btn-danger me-4 mb-1 d-block d-xl-inline">
                                注册
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </main>

        <%@ include file="partials/footer.jsp" %>

        <script src="build/assets/app.js"></script>
        <script>

            function check(value) {
                let len = value.val().trim().length;
                if (len <= 4 || len >= 16) {
                    if (!value.hasClass("is-invalid")) {
                        value.toggleClass("is-invalid")
                    }
                    return false;
                } else {
                    if (value.hasClass("is-invalid")) {
                        value.toggleClass("is-invalid")
                    }
                    return true;
                }
            }

            $("#user").click(function () {
                $(this).val($(this).prop("placeholder"));
            })
                .keydown(function (e) {
                    if (e.key === "Tab" && $(this).val().trim() === "") {
                        $(this).val($(this).prop("placeholder"));
                    }
                })


            $("#email").keyup(function () {
                if ($("#user").val().trim() === "") {
                    let email = $(this).val().split("@");
                    $("#user").prop("placeholder", email[0]);
                }
            })

            function emailVerify() {
                let element = document.createElement("div");
                element.innerText = "该邮箱已被注册！";
                element.className = "text-danger";
                element.setAttribute("id", "email-check")
                let xhr = new XMLHttpRequest();
                xhr.open('POST', 'emailVerify', true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.send("email=" + document.getElementById("email").value);
                xhr.onreadystatechange = function () {
                    if (xhr.status === 200 && xhr.readyState === 4) {
                        if (xhr.getResponseHeader("isEmailTaken") === "true") {
                            if (!document.getElementById("email-check")) {
                                document.getElementById("email").after(element);
                            }
                        } else {
                            if (document.getElementById("email-check")) {
                                document.getElementById("email-check").remove();
                            }
                        }
                    }
                }
            }

            $("#user").on("blur", function () {
                check($(this));
            })

            $("#password").on("blur", function () {
                check($(this));
            })

            $("#register").on("click", function () {
                let email = $("#email").val();
                let password = $("#password").val();
                let verifyCode = $("#verify-code").val();
                $.ajax({
                    method: "GET",
                    url: "getVerifyCodeServlet",
                    data: {verifyCode: verifyCode},
                    dataType: "json"
                })
                    .done(function (data) {
                        if (data.message === "验证码错误") {
                            alert(data.message);
                        } else {
                            if (check($("#user")) && check($("#password"))) {
                                $.ajax({
                                    method: "POST",
                                    url: "registerProcessing",
                                    data: {email: email, password: password},
                                    dataType: "json"
                                })
                                    .done(function (data) {
                                        if (data.message !== "该用户已存在") {
                                            $("form").submit();
                                        } else {
                                            alert("注册失败！");
                                        }
                                    })
                            } else {
                                if (!$("#register").hasClass("is-invalid")) {
                                    $("#register").toggleClass("is-invalid");
                                }
                            }
                        }
                    })
            })

            $("#emailCode").click(function (){
                let email = $("#email").val();
                $.ajax({
                    method: "GET",
                    url: "GetEmailCode",
                    data: {email: email}
                })
                    .done(function (){
                        if($("#email").val().trim() !== ""){
                            alert("已发送验证码");
                            $("#emailCode").attr( "disabled", true);
                            setTimeout(function (){
                                $("#emailCode").attr("disabled", false);
                            }, 60000)
                        } else{
                            alert("请输入邮箱号");
                        }
                    })
                    .fail(function (){
                        alert("发送失败，邮箱已注册");
                    })
            })

        </script>
    </div>
</body>
</html>
