<%@page pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<nav class="navbar navbar-expand-sm bg-body-tertiary mb-5 shadow">
  <div class="container-fluid">
    <div class="navbar-brand">
      <img src="image/blog/img.png" alt="头像" height="40">
      <a href="index.jsp"
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
          <%--                                <i class="bi bi-box py-2 nav-item me-1"></i>--%>
          <a class="me-3 py-2 link-body-emphasis text-decoration-none nav-link"
             href="page/resume/resume.html">简历</a>
        </div>
        <div class="d-flex">
          <%--                                <i class="bi bi-journal-text py-2 nav-item me-1"></i>--%>
          <a class="me-3 py-2 link-body-emphasis text-decoration-none nav-link"
             href="posts">博客</a>
        </div>
        <div class="d-flex">
          <%--                                <i class="bi bi-github py-2 nav-item me-1"></i>--%>
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
      <c:if test="${user == null}">
        <button class="btn btn-outline-danger nav-item">
          <a href="login" class="nav-link">登录</a>
        </button>
      </c:if>
      <c:if test="${user != null}">
        <img src="image/blog/10000007.48e72913..png" height="40">
      </c:if>
    </div>
  </div>
</nav>
