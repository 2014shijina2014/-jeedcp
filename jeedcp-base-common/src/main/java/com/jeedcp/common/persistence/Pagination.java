package com.jeedcp.common.persistence;

import com.github.pagehelper.PageInfo;
import com.jeedcp.common.utils.PropertiesLoader;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jeedcp on 15/9/25.
 */
public class Pagination<T> extends PageInfo<T> {

    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    {
        Integer ps = Integer.valueOf(new PropertiesLoader("application.properties").getProperty("page.pageSize"));
        this.setPageSize(ps);
    }


    public Pagination() {
        super();
    }

    public Pagination(List<T> list) {
        super(list);
    }

    public Pagination(List<T> list, int navigatePages) {
        super(list, navigatePages);
    }

    /**
     * 构造方法
     * @param pageNum 当前页码
     * @param pageSize 分页大小
     */
    public Pagination(int pageNum, int pageSize) {
        this(pageNum, pageSize, 0);
    }

    /**
     * 构造方法
     * @param pageNum 当前页码
     * @param pageSize 分页大小
     * @param count 数据条数
     */
    public Pagination(int pageNum, int pageSize, long count) {
        this(pageNum, pageSize, count, new ArrayList<T>());

    }

    /**
     * 构造方法
     * @param pageNum 当前页码
     * @param pageSize 分页大小
     * @param count 数据条数
     * @param list 本页数据对象列表
     */
    public Pagination(int pageNum, int pageSize, long count, List<T> list) {
        super();
        this.setTotal(count);
        this.setPageNum(pageNum);
        this.setPageSize(pageSize);
        this.setList(list);
    }

    /**
     * 构造方法
     */
    public Pagination(HttpServletRequest request, HttpServletResponse response){
        this(request, response, -2);
    }

    /**
     * 构造方法
     * @param defaultPageSize 默认分页大小，如果传递 -1 则为不分页，返回所有数据
     */
    public Pagination(HttpServletRequest request, HttpServletResponse response, int defaultPageSize){
        super();
        // 设置页码参数（传递repage参数，来记住页码）
        // TODO repage还需判断要不要改
        String no = request.getParameter("pageNum");
        if (StringUtils.isNumeric(no) && Integer.valueOf(no) > 1){
//            CookieUtils.setCookie(response, "pageNum", no);
            this.setPageNum(Integer.parseInt(no));
//        }else if (request.getParameter("repage")!=null){
//            no = CookieUtils.getCookie(request, "pageNum");
//            if (StringUtils.isNumeric(no)){
//                this.setPageNum(Integer.parseInt(no));
//            }
        }else{
//            CookieUtils.setCookie(response, "pageNum", "1");
            this.setPageNum(1);
        }
        // 设置页面大小参数（传递repage参数，来记住页码大小）
        String size = request.getParameter("pageSize");
        if (StringUtils.isNumeric(size)){
//            CookieUtils.setCookie(response, "pageSize", size);
            this.setPageSize(Integer.parseInt(size));
//        }else if (request.getParameter("repage")!=null){
//            no = CookieUtils.getCookie(request, "pageSize");
//            if (StringUtils.isNumeric(size)){
//                this.setPageSize(Integer.parseInt(size));
//            }
        }else if (defaultPageSize != -2){
            this.setPageSize(defaultPageSize);
        }
        // 设置排序参数
//        String orderBy = request.getParameter("orderBy");
//        if (StringUtils.isNotBlank(orderBy)){
//            this.setOrderBy(orderBy);
//        }

    }
}
