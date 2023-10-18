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
        <jsp:include page="partials/admin-header.jsp"/>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper" id="main_content">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>新建文章</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Dashboard Page</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Title</h3>

                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <form method="post" enctype="multipart/form-data" action="posts">
                            <div class="mb-3">
                                <label for="article-author" class="form-label">标题</label>
                                <input type="text" class="form-control" id="article-author" name="title"
                                       aria-describedby="emailHelp" required>
                            </div>
                            <div class="mb-3">
                                <label for="article-description" class="form-label">描述</label>
                                <textarea  class="form-control" id="article-description" name="description"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="formCover" class="form-label">选择你的封面</label>
                                <input class="form-control" type="file" id="formCover" accept="image/*" name="cover">
                            </div>
                            <div class="mb-3">
                                <label for="formFile" class="form-label">选择你的markdown文件</label>
                                <textarea class="form-control" id="formFile" name="content"></textarea>
                            </div>
                            <button id="submit" type="submit" class="btn btn-primary">提交</button>
                        </form>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        Footer
                    </div>
                    <!-- /.card-footer-->
                </div>
                <!-- /.card -->

            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <footer class="main-footer">
            <div class="float-right d-none d-sm-block">
                <b>Version</b> 3.1.0-rc
            </div>
            <strong>Copyright &copy; 2023 Demo</strong> All rights reserved.
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <script src="build/assets/app.js"></script>

</body>
</html>
