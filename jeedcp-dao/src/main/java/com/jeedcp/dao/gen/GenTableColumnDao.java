package com.jeedcp.dao.gen;


import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.entity.gen.GenTable;
import com.jeedcp.entity.gen.GenTableColumn;
import com.jeedcp.persistence.annotation.MyBatisDao;


@MyBatisDao
public abstract interface GenTableColumnDao extends CrudDao<GenTableColumn> {
	public abstract void deleteByGenTable(GenTable paramGenTable);
}