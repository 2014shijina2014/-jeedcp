/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeedcp.org/">jeedcp</a> All rights reserved.
 */
package com.jeedcp.dao.base;

import com.jeedcp.entity.base.TreeEntity;

import java.util.List;

/**
 * DAO支持类实现
 * @author jeedcp
 * @version 2014-05-16
 * @param <T>
 */
public interface TreeDao<T extends TreeEntity<T>> extends CrudDao<T> {

	/**
	 * 找到所有子节点
	 * @param entity
	 * @return
	 */
	public List<T> findByParentIdsLike(T entity);

	/**
	 * 更新所有父节点字段
	 * @param entity
	 * @return
	 */
	public int updateParentIds(T entity);
	
}