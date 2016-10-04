/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeedcp.org/">Jeedcp</a> All rights reserved.
 */
package com.jeedcp.dao.oa;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.entity.oa.OaNotify;
import com.jeedcp.persistence.annotation.MyBatisDao;

/**
 * 通知通告DAO接口
 * @author jeedcp
 * @version 2014-05-16
 */
@MyBatisDao
public interface OaNotifyDao extends CrudDao<OaNotify> {
	
	/**
	 * 获取通知数目
	 * @param oaNotify
	 * @return
	 */
	public Long findCount(OaNotify oaNotify);
	
}