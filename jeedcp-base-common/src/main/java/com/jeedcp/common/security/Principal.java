package com.jeedcp.common.security;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.io.Serializable;

/**
 * Created by Zach on 15/8/5.
 */
public class Principal implements Serializable{


    private static final long serialVersionUID = 3134248571363025762L;
    private String id; // 编号
    private String loginName; // 登录名
    private String name; // 姓名
    private boolean mobileLogin; // 是否手机登录
//    private Object user;

//		private Map<String, Object> cacheMap;

    public Principal(String userId, String loginName, String name, boolean mobileLogin) {
        this.id = userId;
        this.loginName = loginName;
        this.name = name;
        this.mobileLogin = mobileLogin;
//        this.user = user;
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


    /**
     * 获取SESSIONID
     */
    public String getSessionid() {
        try{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null){
				session = subject.getSession();
			}
			if (session != null){
				return session.getId().toString();
			}
		}catch (InvalidSessionException e){

		}
		return null;
    }

    @Override
    public String toString() {
        return id;
    }
}
