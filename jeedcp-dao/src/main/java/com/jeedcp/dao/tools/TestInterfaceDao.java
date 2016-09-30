/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeedcp.dao.tools;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.entity.tools.TestInterface;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 接口DAO接口
 * @author lgf
 * @version 2016-01-07
 */
@MyBatisDao
public interface TestInterfaceDao extends CrudDao<TestInterface> {
	
}