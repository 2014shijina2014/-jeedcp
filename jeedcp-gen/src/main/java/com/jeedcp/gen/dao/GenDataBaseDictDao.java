package com.jeedcp.gen.dao;

import com.jeedcp.dao.base.CrudDao;

import com.jeedcp.gen.entity.GenTable;
import com.jeedcp.gen.entity.GenTableColumn;
import com.jeedcp.persistence.annotation.MyBatisDao;

import java.util.List;


@MyBatisDao
public abstract interface GenDataBaseDictDao extends CrudDao<GenTableColumn> {
	public abstract List<GenTable> findTableList(GenTable paramGenTable);

	public abstract List<GenTableColumn> findTableColumnList(GenTable paramGenTable);

	public abstract List<String> findTablePK(GenTable paramGenTable);
}