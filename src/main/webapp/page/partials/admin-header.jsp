<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="admin/dashboard" role="button"><i
                    class="fas fa-bars"></i></a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown user-menu">
            <a href="admin/dashboard" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
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
            </ul>
        </li>
    </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="admin/dashboard" target="_blank" class="brand-link">
        <img src="image/blog/logo-short.svg" alt="example"
             class="brand-image mr-3">
        <span class="brand-text font-weight-light">${user.getName()}</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <li class="nav-item">
                    <a href="admin/dashboard" class="nav-link <%=
                            request.getAttribute("jakarta.servlet.forward.request_uri").toString().contains("dashboard")?"active":""
                        %>">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Dashboard</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="admin/users" class="nav-link <%=
                    request.getAttribute("jakarta.servlet.forward.request_uri").toString().contains("users")?"active":""
                    %>">
                        <i class="nav-icon fas fa-users"></i>
                        <p>Users</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="admin/posts" class="nav-link <%=
                            request.getAttribute("jakarta.servlet.forward.request_uri").toString().contains("posts")?"active":""
                        %>">
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
