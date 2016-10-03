/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeedcp.sys.dao;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.entity.sys.Dict;
import com.jeedcp.persistence.annotation.MyBatisDao;

import java.util.List;

/**
 * 字典DAO接口
 * @author jeeplus
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
}
