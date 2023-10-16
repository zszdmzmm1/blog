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
    <base href="http://localhost:8080/zszdmzmm_blog_war/">
    <link rel="stylesheet" href="build/assets/app.css">
    <link rel="stylesheet" href="vendor/adminlte/fonts/fonts.css">
    <link rel="stylesheet" href="vendor/adminlte/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="vendor/adminlte/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>

            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown user-menu">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <a href="admin/add-post" class="me-2 d-none d-md-inline">新建文章</a>
                        <img src="image/blog/default-avatar.png" class="user-image img-circle elevation-2"
                             alt="User Image">
                        <span class="d-none d-md-inline">${user.getName()}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="left: inherit; right: 0px;">
                        <!-- User image -->
                        <li class="user-header bg-gray-light">
                            <img src="image/blog/default-avatar.png" class="img-circle elevation-2" alt="User Image">
                            <p>${user.getName()}</p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                            <a href="#" class="btn btn-default btn-flat float-right">
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="#" target="_blank" class="brand-link">
                <img src="../img/logo-short.svg" alt="example"
                     class="brand-image mr-3">
                <span class="brand-text font-weight-light">Demo</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">
                        <li class="nav-item">
                            <a href="dashboard.jsp" class="nav-link">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="admin/users" class="nav-link ">
                                <i class="nav-icon fas fa-users"></i>
                                <p>Users</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="admin/posts" class="nav-link active">
                                <i class="nav-icon fas fa-users"></i>
                                <p>Posts</p>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>
        <div class="content-wrapper" style="min-height: 1604.44px;">
            <div class="card">
                <div class="card-header">
                    <h1 class="card-title text-bold text-secondary display-5">用户列表</h1>
                </div>
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover table-striped text-nowrap">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>标题</th>
                                <th>最近更新时间</th>
                                <th class="text-end">
                                    <button class="btn btn-default" type="button" data-bs-toggle="offcanvas"
                                            data-bs-target="#staticBackdrop" aria-controls="staticBackdrop">
                                        添加
                                    </button>
                                    <button class="btn btn-default" id="mul-delete">多选</button>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${postList}" var="post" varStatus="status">
                                <tr id="${post.getPid()}">
                                    <td>${status.count + (page - 1) * 10}</td>
                                    <td>${post.getTitle()}</td>
                                    <td>${post.getLastUpdateTime()}</td>
                                    <td class="text-end">
                                        <button class="btn btn-default" type="button" data-bs-toggle="offcanvas"
                                                data-bs-target="#staticBackdrop1" aria-controls="staticBackdrop">
                                            更新
                                        </button>
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
        <%@ include file="./partials/footer.jsp" %>
    </div>


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
            window.location.href = "admin/posts?page=" + page;
        })


        $(".delete").click(function () {
            let isConfirm = confirm("是否确定删除？");
            if (isConfirm) {
                let id = $(this).parent().parent().attr("id");
                $.ajax({
                    method: "DELETE",
                    url: "posts/" + id,
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


        $("#mul-delete").click(function () {
            if ($("#confirm-mul-delete").length === 0) {
                $(this).after(`<button class="btn btn-default" id="confirm-mul-delete">删除</button>`);
                $(".delete").after(`<input type="checkbox" class="checkbox delete-check"/>`);
                $("#confirm-mul-delete").click(function () {
                    let isConfirm = confirm("是否确定删除？");
                    if (isConfirm) {
                        let ids = [];
                        $(".delete-check:checked").each(function () {
                            ids.push($(this).parent().parent().attr("id"));
                        });
                        let sId = String(ids);
                        $.ajax({
                            method: "POST",
                            url: "delete-posts",
                            data: {sId: sId}
                        })
                            .done(function () {
                                window.location.reload();
                                alert("删除成功");
                            })
                    }
                })
            } else {
                $("#confirm-mul-delete").remove();
                $(".delete-check").remove();
            }
        })
    </script>
</body>
</html>
