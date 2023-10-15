package com.auefly.interceptor;

import com.auefly.pojo.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        String url = request.getServletContext().getContextPath();
        if (user == null) {
            response.sendRedirect(url + "/login");
            return false;
        }
        return true;
    }
}
