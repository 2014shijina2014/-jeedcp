/**
 * Copyright &copy; 2015-2015  Jeedcp All rights reserved.
 */
package com.jeedcp.common.service;

import com.github.pagehelper.PageHelper;

import com.jeedcp.common.persistence.CrudDao;
import com.jeedcp.common.persistence.DataEntity;
import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.common.utils.IdUtils;
import com.jeedcp.common.utils.PrincipalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Service基类
 * @author jeedcp
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudDao<T>, T extends DataEntity<T>> extends BaseService {
	
	/**
	 * 持久层对象
	 */
	@Autowired
	protected D dao;
	
	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(String id) {
		return dao.get(id);
	}
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity) {
		return dao.get(entity);
	}
	
	/**
	 * 查询列表数据
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return dao.findList(entity);
	}
	
	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public Pagination<T> findPage(Pagination<T> page, T entity) {
//		entity.setPage(page);
        PageHelper.startPage(page.getPageNum(),page.getPageSize());
        List<T> list = dao.findList(entity);
        //用PageInfo对结果进行包装
        Pagination pageInfo = new Pagination(list);
        return pageInfo;
	}

	/**
	 * 保存数据（插入或更新）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void save(T entity) {
        String userId = PrincipalUtil.getPrincipalId();
		if (entity.getIsNewRecord()){
            entity.setId(IdUtils.uuid());
            entity.setUpdateBy(userId);
            entity.setCreateBy(userId);
            entity.setUpdateDate(new Date());
            entity.setCreateDate(entity.getUpdateDate());

			dao.insert(entity);
		}else{
            entity.setUpdateBy(userId);
            entity.setUpdateDate(new Date());
			dao.update(entity);
        }
	}
	
	/**
	 * 删除数据
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void delete(T entity) {
		dao.delete(entity);
	}

}
