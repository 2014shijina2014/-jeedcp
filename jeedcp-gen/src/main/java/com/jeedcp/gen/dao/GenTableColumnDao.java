package com.jeedcp.gen.dao;


import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.gen.entity.GenTable;
import com.jeedcp.gen.entity.GenTableColumn;
import com.jeedcp.persistence.annotation.MyBatisDao;


@MyBatisDao
public abstract interface GenTableColumnDao extends CrudDao<GenTableColumn> {
	public abstract void deleteByGenTable(GenTable paramGenTable);
}