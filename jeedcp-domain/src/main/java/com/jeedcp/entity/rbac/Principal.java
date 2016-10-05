package com.jeedcp.entity.rbac;

/**
 * Created by Administrator on 2016/10/4.
 */

import com.jeedcp.entity.sys.User;

import java.io.Serializable;

/**
 * 授权用户信息
 */
public  class Principal implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id; // 编号
    private String loginName; // 登录名
    private String name; // 姓名
    private boolean mobileLogin; // 是否手机登录
    private String sessionid;

//		private Map<String, Object> cacheMap;

    public Principal(User user, boolean mobileLogin,String sessionid) {
        this.id = user.getId();
        this.loginName = user.getLoginName();
        this.name = user.getName();
        this.mobileLogin = mobileLogin;
        this.sessionid = sessionid;
    }

    public String getId() {
        return id;
    }

    public String getLoginName() {
        return loginName;
    }

    public String getName() {
        return name;
    }

    public boolean isMobileLogin() {
        return mobileLogin;
    }




    @Override
    public String toString() {
        return id;
    }

    public String getSessionid() {
        return sessionid;
    }

    public void setSessionid(String sessionid) {
        this.sessionid = sessionid;
    }
}
