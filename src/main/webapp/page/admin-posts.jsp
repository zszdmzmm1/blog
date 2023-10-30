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
</head>
<body class="hold-transition sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">
        <!-- Navbar -->
        <jsp:include page="partials/admin-header.jsp"/>
        <div class="content-wrapper mt-2">
            <section class="content">
                <div class="card">
                    <div class="card-header">
                        <h1 class="card-title text-bold text-secondary display-5">文章列表</h1>
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover table-striped text-nowrap">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>标题</th>
                                    <th>最近更新时间</th>
                                    <th class="text-end" id="add-and-delete">
                                        <i class="fas fa-plus me-1" id="add"></i>
                                        <i class="fas fa-trash-alt" id="mul-delete"></i>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${postList.getT()}" var="post" varStatus="status">
                                    <tr id="${post.getPid()}" class="post-id">
                                        <td>${status.count + (postList.getPage() - 1) * 10}</td>
                                        <td>${post.getTitle()}</td>
                                        <td>${post.getLastUpdateTime()}</td>
                                        <td class="text-end">
                                            <i class="fas fa-edit update me-1"></i>
                                            <i class="fas fa-trash-alt delete me-1"></i>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <span class="text-secondary">当前第${postList.getPage()}页，总计${postList.getTotalPage()}页，共${postList.getCount()}条记录</span>
                    </div>
                </div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:if test="${postList.getPage() != 1}">
                            <li class="page-item">
                                <a class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li class="page-item"><span class="page-link" id="current-page">${postList.getPage()}</span></li>
                        <c:if test="${postList.getPage() != postList.getTotalPage() && postList.getTotalPage() != 0}">
                            <li class="page-item">
                                <a class="page-link" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </section>
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
                let id = $(this).parent().parent().parent().attr("id");
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
            let id = $(".post-id").attr("id");
            window.location.href = "admin/posts/" + id + "/edit";
        });

        $("#add").click(function () {
            let id = $(".post-id").attr("id");
            window.location.href = "admin/add-post";
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
        });


        $("#mul-delete").click(function () {
            if ($("#confirm-mul-delete").length === 0) {
                $("#add-and-delete").append(`<i class="fas fa-check" id="confirm-mul-delete"></i>`);
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
        });
    </script>
</body>
</html>
