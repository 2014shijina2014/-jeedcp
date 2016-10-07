/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.core.act.dao;


import com.jeedcp.core.act.entity.Act;
import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 审批DAO接口
 * @author thinkgem
 * @version 2014-05-16
 */
@MyBatisDao
public interface ActDao extends CrudDao<Act> {

	public int updateProcInsIdByBusinessId(Act act);
	
}
