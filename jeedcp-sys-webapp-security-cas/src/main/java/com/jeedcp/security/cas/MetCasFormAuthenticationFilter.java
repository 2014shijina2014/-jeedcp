package com.jeedcp.security.cas;


import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.cas.CasFilter;
import org.apache.shiro.cas.CasToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Jeedcp on 15/8/5.
 */
public class MetCasFormAuthenticationFilter extends CasFilter {

    private static final Logger log = LoggerFactory.getLogger(MetCasFormAuthenticationFilter.class);


    // the name of the parameter service ticket in url
    private static final String TICKET_PARAMETER = "ticket";

    /**
     * 创建自定义的令牌
     */
    @Override
    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String ticket = httpRequest.getParameter(TICKET_PARAMETER);
        return new CasToken(ticket);
    }



}