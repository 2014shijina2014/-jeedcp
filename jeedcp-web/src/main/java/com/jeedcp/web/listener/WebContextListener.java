package com.jeedcp.web.listener;

/**
 * Created by Administrator on 2016/10/4.
 */

import javax.servlet.ServletContext;

import org.springframework.web.context.WebApplicationContext;


public class WebContextListener extends org.springframework.web.context.ContextLoaderListener {

    @Override
    public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
        return super.initWebApplicationContext(servletContext);
    }
}
