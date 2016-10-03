/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeedcp.sys.dao;


import com.jeedcp.dao.base.TreeDao;
import com.jeedcp.entity.sys.Area;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 区域DAO接口
 * @author jeeplus
 * @version 2014-05-16
 */
@MyBatisDao
public interface AreaDao extends TreeDao<Area> {
	
}
