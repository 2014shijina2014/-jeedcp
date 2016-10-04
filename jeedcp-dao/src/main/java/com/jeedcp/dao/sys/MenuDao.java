/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeedcp.org/">Jeedcp</a> All rights reserved.
 */
package com.jeedcp.dao.sys;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.entity.sys.Menu;
import com.jeedcp.persistence.annotation.MyBatisDao;

import java.util.List;

/**
 * 菜单DAO接口
 * @author jeedcp
 * @version 2014-05-16
 */
@MyBatisDao
public interface MenuDao extends CrudDao<Menu> {

	public List<Menu> findByParentIdsLike(Menu menu);

	public List<Menu> findByUserId(Menu menu);
	
	public int updateParentIds(Menu menu);
	
	public int updateSort(Menu menu);
	
}
