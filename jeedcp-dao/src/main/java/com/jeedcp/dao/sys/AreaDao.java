/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeedcp.org/">Jeedcp</a> All rights reserved.
 */
package com.jeedcp.dao.sys;


import com.jeedcp.dao.base.TreeDao;
import com.jeedcp.entity.sys.Area;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 区域DAO接口
 * @author jeedcp
 * @version 2014-05-16
 */
@MyBatisDao
public interface AreaDao extends TreeDao<Area> {
	
}
