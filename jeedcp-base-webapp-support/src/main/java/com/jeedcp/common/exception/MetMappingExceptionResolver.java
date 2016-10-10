package com.jeedcp.common.exception;

import com.jeedcp.common.mapper.JsonMapper;
import com.jeedcp.common.web.Servlets;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Jeedcp on 15/10/28.
 */
public class MetMappingExceptionResolver extends SimpleMappingExceptionResolver{



    @Override
    protected ModelAndView doResolveException(HttpServletRequest request,
                                              HttpServletResponse response, Object handler, Exception ex) {
        setDefaultStatusCode(404);
        // Expose ModelAndView for chosen error view.
        String viewName = determineViewName(ex, request);
        // Apply HTTP status code for error views, if specified.
        // Only apply it if we're processing a top-level request.
        Integer statusCode = determineStatusCode(request, viewName);
        if (viewName != null) {// JSP格式返回
            if (!Servlets.isAjaxRequest(request)) {
                // 如果不是异步请求
                if (statusCode != null) {
                    applyStatusCodeIfPossible(request, response, statusCode);
                }
                return getModelAndView(viewName, ex, request);
            } else {// JSON格式返回
                String json = JsonMapper.toJsonString(ex);
                ex.setStackTrace(new StackTraceElement[]{});
                response.setStatus(statusCode);
                PrintWriter writer = null;
                try {
                     writer = response.getWriter();
                    writer.write(json);
                    writer.flush();
                } catch (IOException e) {
                    e.printStackTrace();
                }finally {
                    if(writer!=null)
                        writer.close();
                    return null;
                }
//                return null;

            }
        } else {
            return null;
        }
    }
}
