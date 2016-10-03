/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeedcp.sys.dao;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.entity.sys.SystemConfig;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 系统配置DAO接口
 * @author liugf
 * @version 2016-02-07
 */
@MyBatisDao
public interface SystemConfigDao extends CrudDao<SystemConfig> {
	
}