/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeedcp.org/">Jeedcp</a> All rights reserved.
 */
package com.jeedcp.modules.sys.dao;


import com.jeedcp.common.persistence.TreeDao;
import com.jeedcp.common.persistence.annotation.MyBatisDao;
import com.jeedcp.modules.sys.entity.Office;


/**
 * 机构DAO接口
 * @author jeedcp
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
	public Office getByCode(String code);
}
