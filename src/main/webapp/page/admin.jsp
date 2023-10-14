<%--
  Created by IntelliJ IDEA.
  User: 86173
  Date: 2023/8/23
  Time: 15:58
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
    <title>管理员控制台</title>
    <base href="http://localhost:8080/zszdmzmm_web2_war/">
    <link rel="stylesheet" href="build/assets/app.css">
</head>
<body class="sidebar-mini" style="height: auto;">
    <div class="wrapper">

        <nav class="main-header navbar navbar-expand navbar-white navbar-light px-2">


            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="">收</i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <span href="login" class="nav-link" id="logout">退出登录</span>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <span class="nav-item text-body-secondary">登陆人数:${totalNumberOfLoginUser}</span>
                </li>
            </ul>
        </nav>


        <aside class="main-sidebar sidebar-dark-primary elevation-4">

            <div class="sidebar">

                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="./image/QQ图片20230720103937.jpg" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block">管理员</a>
                    </div>
                </div>

                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">

                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Dashboard
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Dashboard v1</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Dashboard v2</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Dashboard v3</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item menu-open">
                            <a href="#" class="nav-link active">
                                <i class="nav-icon far fa-plus-square"></i>
                                <p>
                                    管理员
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="../examples/blank.html" class="nav-link active">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>用户列表</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>

            </div>

        </aside>

        <div class="content-wrapper" style="min-height: 1604.44px;">
            <div class="card">
                <div class="card-header">
                    <h1 class="card-title text-bold text-secondary display-5">用户列表</h1>
                    <div class="card-tools">
                        <div class="input-group input-group-sm" style="width: 300px; height: 50px">
                            <input type="text" name="table_search" class="form-control"
                                   placeholder="Search" id="user-search">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-default" id="user-search-btn">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover table-striped text-nowrap">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>邮箱</th>
                                <th>密码</th>
                                <th class="text-end">
                                    <button class="btn btn-default" type="button" data-bs-toggle="offcanvas"
                                            data-bs-target="#staticBackdrop" aria-controls="staticBackdrop">
                                        添加
                                    </button>
                                    <div class="offcanvas offcanvas-end" data-bs-backdrop="static" tabindex="-1"
                                         id="staticBackdrop" aria-labelledby="staticBackdropLabel">
                                        <div class="offcanvas-header">
                                            <h5 class="offcanvas-title" id="staticBackdropLabel">添加用户</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="offcanvas-body">
                                            <form class="border border-1 rounded-2 p-4 my-3 bg-light update_form"
                                                  id="add">
                                                <div class="mb-3 text-start">
                                                    <label for="add-email" class="form-label d-inline">邮箱</label>
                                                    <input type="email" class="form-control" id="add-email"
                                                           aria-describedby="emailHelp">
                                                </div>
                                                <div class="mb-3 text-start">
                                                    <label for="add-password" class="form-label">密码</label>
                                                    <input type="password" class="form-control" id="add-password">
                                                </div>
                                                <div class="d-flex justify-content-start">
                                                    <button type="button" class="btn btn-primary" id="add-submit">添加
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <button class="btn btn-default" id="mul-delete">多选</button>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${userList}" var="user" varStatus="status">
                                <tr id="${user.getId()}">
                                    <td>${status.count + (page - 1) * 10}</td>
                                    <td>${user.getEmail()}</td>
                                    <td>${user.getPassword()}</td>
                                    <td class="text-end">
                                        <button class="btn btn-default" type="button" data-bs-toggle="offcanvas"
                                                data-bs-target="#staticBackdrop1" aria-controls="staticBackdrop">
                                            更新
                                        </button>
                                        <div class="offcanvas offcanvas-end" data-bs-backdrop="static" tabindex="-1"
                                             id="staticBackdrop1" aria-labelledby="staticBackdropLabel">
                                            <div class="offcanvas-header">
                                                <h5 class="offcanvas-title" id="staticBackdropLabel1">更新用户信息</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="offcanvas-body">
                                                <form class="border border-1 rounded-2 p-2 my-3 bg-light update_form"
                                                      id="${user.getId()}">
                                                    <div class="mb-3">
                                                        <label for="update-${user.getId()}"
                                                               class="form-label">邮箱</label>
                                                        <input type="email" class="form-control"
                                                               id="update-${user.getId()}"
                                                               placeholder="不填写可保持不变">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">密码</label>
                                                        <input type="text" class="form-control"
                                                               placeholder="不填写可保持不变">
                                                    </div>
                                                    <button type="button" class="btn btn-primary update"
                                                            id="${user.getId()}-submit">更新
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                        <button class="delete btn btn-default">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                    <span class="text-secondary">当前第${page}页，总计${pageCount}页，共${count}条记录</span>
                </div>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${page != 1}">
                        <li class="page-item">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li class="page-item"><span class="page-link">${page}</span></li>
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
        <%@ include file="./partials/footer.jsp" %>
    </div>


    <script src="build/assets/app.js"></script>
    <script>
        $(".page-link").click(function () {
            let page = ${page};
            let email = "${sEmail}";
            if ($(this).attr("aria-label") === "Next") {
                page += 1;
            } else if ($(this).attr("aria-label") === "Previous") {
                page -= 1;
            } else {
                page = parseInt($(this).text());
            }
            if(email === ""){
                window.location.href = "admin/user?page=" + page;
            }else{
                window.location.href = "admin/user?page=" + page + "&sEmail=" + email;
            }
        })


        $(".delete").click(function () {
            let isConfirm = confirm("是否确定删除？");
            if (isConfirm) {
                let id = $(this).parent().parent().attr("id");
                $.ajax({
                    method: "GET",
                    url: "delete",
                    data: {id: id}
                })
                    .done(function () {
                        window.location.reload();
                        alert("删除成功！");
                    })
                    .fail(function () {
                        alert("something wrong, please check again");
                    })
            }
        });

        $(".update").click(function () {
            let id = $(this).parent().attr("id");
            let email = $(this).prev().prev().find("input").val();
            let password = $(this).prev().find("input").val();
            $.ajax({
                method: "GET",
                url: "update",
                data: {id: id, email: email, password: password}
            })
                .done(function () {
                    window.location.reload();
                    alert("更新成功！");
                })
                .fail(function () {
                    alert("something wrong, please check again");
                })
        });

        $("#add-submit").click(function () {
            let email = $("#add-email").val();
            let password = $("#add-password").val();
            $.ajax({
                method: "GET",
                url: "add",
                data: {email: email, password: password}
            })
                .done(function () {
                    window.location.reload();
                    alert("增加成功！");
                })
                .fail(function () {
                    alert("账号或密码不能为空！");
                })
        });

        $("#logout").click(function () {
            $.ajax({
                method: "GET",
                url: "logout"
            })
                .done(function () {
                    window.location.reload();
                })
        });

        $("#user-search-btn").click(function () {
            let email = $("#user-search").val();
            window.location.href = "user-search?sEmail=" + email;
        })


        $("#mul-delete").click(function (){
            if($("#confirm-mul-delete").length === 0){
                $(this).after(`<button class="btn btn-default" id="confirm-mul-delete">删除</button>`);
                $(".delete").after(`<input type="checkbox" class="checkbox delete-check"/>`);
                $("#confirm-mul-delete").click(function (){
                    let isConfirm = confirm("是否确定删除？");
                    if(isConfirm){
                        let ids = [];
                        $(".delete-check:checked").each(function (){
                            ids.push($(this).parent().parent().attr("id"));
                        });
                        let sId = String(ids);
                        $.ajax({
                            method: "GET",
                            url: "deleteUsers",
                            data: {sId: sId}
                        })
                            .done(function (){
                                window.location.reload();
                                alert("删除成功");
                            })
                    }
                })
            } else{
                $("#confirm-mul-delete").remove();
                $(".delete-check").remove();
            }
        })
    </script>
</body>
</html>