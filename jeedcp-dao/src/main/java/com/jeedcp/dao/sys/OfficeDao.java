/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeedcp.org/">Jeedcp</a> All rights reserved.
 */
package com.jeedcp.dao.sys;


import com.jeedcp.dao.base.TreeDao;
import com.jeedcp.entity.sys.Office;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 机构DAO接口
 * @author jeedcp
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
	public Office getByCode(String code);
}
