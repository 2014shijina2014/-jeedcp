package com.jeedcp.modules.sys.listener;

import javax.servlet.ServletContext;

import com.jeedcp.common.config.Global;
import org.springframework.web.context.WebApplicationContext;

public class WebContextListener extends org.springframework.web.context.ContextLoaderListener {
	
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
        StringBuilder sb = new StringBuilder();
        sb.append("\r\n======================================================================\r\n");
        sb.append("\r\n    欢迎使用 "+ Global.getConfig("productName")+"  - Powered By http://www.jeedcp.cn\r\n");
        sb.append("\r\n======================================================================\r\n");
        System.out.println(sb.toString());

		return super.initWebApplicationContext(servletContext);
	}
}
