/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">Jeedcp</a> All rights reserved.
 */
package com.jeedcp.dao.imm;

import com.jeedcp.entity.iim.MailBox;
import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 发件箱DAO接口
 * @author jeeplus
 * @version 2015-11-15
 */
@MyBatisDao
public interface MailBoxDao extends CrudDao<MailBox> {
	
	public int getCount(MailBox entity);
	
}