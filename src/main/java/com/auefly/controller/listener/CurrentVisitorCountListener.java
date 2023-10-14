package com.auefly.controller.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import org.springframework.stereotype.Controller;

@WebListener
@Controller
public class CurrentVisitorCountListener implements HttpSessionListener {
    public void sessionCreated(HttpSessionEvent se) {
        ServletContext servletContext = se.getSession().getServletContext();
        int currentVisitorCount = (int) servletContext.getAttribute("totalNumberOfOnlineVisitor");
        servletContext.setAttribute("totalNumberOfOnlineVisitor", currentVisitorCount + 1);
    }


    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        ServletContext servletContext = se.getSession().getServletContext();
        int currentVisitorCount = (int) servletContext.getAttribute("totalNumberOfOnlineVisitor");
        servletContext.setAttribute("totalNumberOfOnlineVisitor", currentVisitorCount - 1);
    }
}
