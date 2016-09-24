package com.jeeplus.modules.gen.dao;


import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.gen.entity.GenTable;
import com.jeeplus.modules.gen.entity.GenTableColumn;

@MyBatisDao
public abstract interface GenTableColumnDao extends CrudDao<GenTableColumn> {
	public abstract void deleteByGenTable(GenTable paramGenTable);
}