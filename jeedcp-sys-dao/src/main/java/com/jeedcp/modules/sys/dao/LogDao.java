/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/jeedcp">JeeSite</a> All rights reserved.
 */
package com.jeedcp.modules.sys.dao;

import com.jeedcp.common.persistence.CrudDao;
import com.jeedcp.common.persistence.annotation.MyBatisDao;
import com.jeedcp.modules.sys.entity.Log;

/**
 * 日志DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {

}
