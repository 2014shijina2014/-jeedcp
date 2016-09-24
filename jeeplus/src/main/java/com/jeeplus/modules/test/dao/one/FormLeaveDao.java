/**
 * Copyright &copy; 2015-2020 <a href="http://taoyuanwangluo.com/">taoyuanwangluo</a> All rights reserved.
 */
package com.jeeplus.modules.test.dao.one;

import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.test.entity.one.FormLeave;

/**
 * 员工请假DAO接口
 * @author admin
 * @version 2016-09-14
 */
@MyBatisDao
public interface FormLeaveDao extends CrudDao<FormLeave> {

	
}