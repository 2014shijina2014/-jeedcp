/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeedcp.org/">Jeedcp</a> All rights reserved.
 */
package com.jeedcp.dao.monitor;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.entity.monitor.Monitor;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 系统监控DAO接口
 * @author liugf
 * @version 2016-02-07
 */
@MyBatisDao
public interface MonitorDao extends CrudDao<Monitor> {
	
}