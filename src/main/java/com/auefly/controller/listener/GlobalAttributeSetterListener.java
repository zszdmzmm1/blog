package com.auefly.controller.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.springframework.stereotype.Controller;

@WebListener
@Controller
public class GlobalAttributeSetterListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().setAttribute("totalNumberOfOnlineVisitor", 0);
    }
}
