/**
 * Copyright &copy; 2015-2020 <a href="http://taoyuanwangluo.com/">taoyuanwangluo</a> All rights reserved.
 */
package com.jeedcp.dao.test;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.entity.test.one.FormLeave;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 员工请假DAO接口
 * @author admin
 * @version 2016-09-14
 */
@MyBatisDao
public interface FormLeaveDao extends CrudDao<FormLeave> {

	
}