/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeedcp.dao.sys;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.entity.iim.MailCompose;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 发件箱DAO接口
 * @author jeeplus
 * @version 2015-11-15
 */
@MyBatisDao
public interface MailComposeDao extends CrudDao<MailCompose> {
	public int getCount(MailCompose entity);
}