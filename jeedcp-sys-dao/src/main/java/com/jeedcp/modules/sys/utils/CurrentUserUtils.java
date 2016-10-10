/**
 * Copyright &copy; 2015-2015  Metinform All rights reserved.
 */
package com.jeedcp.modules.sys.utils;


import com.jeedcp.common.persistence.DataEntity;
import com.jeedcp.common.security.Principal;
import com.jeedcp.common.utils.IdUtils;
import com.jeedcp.common.utils.PrincipalUtil;
import com.jeedcp.common.utils.SpringContextHolder;
import com.jeedcp.modules.sys.dao.UserDao;
import com.jeedcp.modules.sys.entity.User;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.util.Date;

/**
 * 用户工具类
 * @author Zach Xu
 * @version 2013-12-05
 */
public class CurrentUserUtils extends PrincipalUtil {

    private static UserDao userDao = (UserDao) SpringContextHolder.getBean(UserDao.class);

	/**
	 * 获取当前用户
	 * @return 取不到返回 new User()
	 */
	public static User getUser(){
		Principal principal = getPrincipal();
		if (principal!=null){
			User user = userDao.get(principal.getId());
			if (user != null){
				return user;
			}
			return new User();
		}
		// 如果没有登录，则返回实例化空的User对象。
		return new User();
	}


	
	public static Session getSession(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null){
				session = subject.getSession();
			}
			if (session != null){
				return session;
			}
//			subject.logout();
		}catch (InvalidSessionException e){
			
		}
		return null;
	}

    /**
     * 此处
     * 插入之前执行方法，需要手动调用
     */
	public static void preInsert(DataEntity dataEntity){
		// 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
		if (dataEntity.getIsNewRecord()){
            if(StringUtils.isBlank(dataEntity.getId()))
                dataEntity.setId(IdUtils.uuid());
		}
		String userId = getUser().getId();
		if (StringUtils.isNotBlank(userId)){
            dataEntity.setUpdateBy(userId);
            dataEntity.setCreateBy(userId);
		}
        dataEntity.setUpdateDate(new Date());
        dataEntity.setCreateDate(dataEntity.getUpdateDate());
	}

	/**
	 * 更新之前执行方法，需要手动调用
	 */
	public static void preUpdate(DataEntity dataEntity){
        String userId = getUser().getId();
		if (StringUtils.isNotBlank(userId)){
            dataEntity.setUpdateBy(userId);
		}
        dataEntity.setUpdateDate(new Date());
	}
	
	// ============== User Cache ==============
	
	public static Object getCache(String key) {
		return getCache(key, null);
	}
	
	public static Object getCache(String key, Object defaultValue) {
//		Object obj = getCacheMap().get(key);
		Object obj = getSession().getAttribute(key);
		return obj==null?defaultValue:obj;
	}

	public static void putCache(String key, Object value) {
//		getCacheMap().put(key, value);
		getSession().setAttribute(key, value);
	}

	public static void removeCache(String key) {
//		getCacheMap().remove(key);
		getSession().removeAttribute(key);
	}
	

}
