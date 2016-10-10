/**
 * Copyright &copy; 2015-2015  Jeedcp All rights reserved.
 */
package com.jeedcp.modules.gen.dao;

import com.jeedcp.common.persistence.CrudDao;
import com.jeedcp.common.persistence.annotation.MyBatisDao;
import com.jeedcp.modules.gen.entity.GenScheme;
import com.jeedcp.modules.gen.entity.GenScheme;

/**
 * 生成方案DAO接口
 * @author jeedcp
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenSchemeDao extends CrudDao<GenScheme> {
	
}
