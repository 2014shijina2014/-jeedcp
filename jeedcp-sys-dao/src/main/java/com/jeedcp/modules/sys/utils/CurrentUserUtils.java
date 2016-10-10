/**
 * Copyright &copy; 2015-2015  Metinform All rights reserved.
 */
package com.jeedcp.modules.sys.utils;


import com.jeedcp.common.persistence.DataEntity;
import com.jeedcp.common.security.Principal;
import com.jeedcp.common.utils.CacheUtils;
import com.jeedcp.common.utils.IdUtils;
import com.jeedcp.common.utils.PrincipalUtil;
import com.jeedcp.common.utils.SpringContextHolder;
import com.jeedcp.modules.sys.dao.RoleDao;
import com.jeedcp.modules.sys.dao.UserDao;
import com.jeedcp.modules.sys.entity.Role;
import com.jeedcp.modules.sys.entity.User;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.util.Date;

/**
 * 用户工具类
 * @author jeedcp
 * @version 2013-12-05
 */
public class CurrentUserUtils extends PrincipalUtil {
	private static RoleDao roleDao = SpringContextHolder.getBean(RoleDao.class);
    private static UserDao userDao = (UserDao) SpringContextHolder.getBean(UserDao.class);
	public static final String USER_CACHE = "userCache";
	public static final String USER_CACHE_ID_ = "id_";
	public static final String USER_CACHE_LOGIN_NAME_ = "ln";
	public static final String USER_CACHE_LIST_BY_OFFICE_ID_ = "oid_";

	public static final String CACHE_ROLE_LIST = "roleList";
	public static final String CACHE_MENU_LIST = "menuList";
	public static final String CACHE_AREA_LIST = "areaList";
	public static final String CACHE_OFFICE_LIST = "officeList";
	public static final String CACHE_OFFICE_ALL_LIST = "officeAllList";
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
	/**
	 * 根据ID获取用户
	 * @param id
	 * @return 取不到返回null
	 */
	public static User get(String id){
		User user = (User)CacheUtils.get(USER_CACHE, USER_CACHE_ID_ + id);
		if (user ==  null){
			user = userDao.get(id);
			if (user == null){
				return null;
			}
			user.setRoleList(roleDao.findList(new Role(user)));
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}
	/**
	 * 根据登录名获取用户
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static User getByLoginName(String loginName){
		User user = (User) CacheUtils.get(USER_CACHE, USER_CACHE_LOGIN_NAME_ + loginName);
		if (user == null){
			user = userDao.getByLoginName(new User(null, loginName));
			if (user == null){
				return null;
			}
			user.setRoleList(roleDao.findList(new Role(user)));
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}

	/**
	 * 清除指定用户缓存
	 * @param user
	 */
	public static void clearCache(User user){
		CacheUtils.remove(USER_CACHE, USER_CACHE_ID_ + user.getId());
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName());
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getOldLoginName());
		if (user.getOffice() != null && user.getOffice().getId() != null){
			CacheUtils.remove(USER_CACHE, USER_CACHE_LIST_BY_OFFICE_ID_ + user.getOffice().getId());
		}
	}

}
