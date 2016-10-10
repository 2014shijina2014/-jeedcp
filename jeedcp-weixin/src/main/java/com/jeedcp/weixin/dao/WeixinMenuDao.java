/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.dao;

import com.jeedcp.common.persistence.TreeDao;
import com.jeedcp.common.persistence.annotation.MyBatisDao;
import com.jeedcp.weixin.entity.WeixinMenu;

/**
 * 微信菜单DAO接口
 * @author jeedcp
 * @version 2016-09-20
 */
@MyBatisDao
public interface WeixinMenuDao extends TreeDao<WeixinMenu> {
	
}