package com.jeedcp.gen.dao;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.gen.entity.GenTable;
import com.jeedcp.gen.entity.GenTableColumn;
import com.jeedcp.persistence.annotation.MyBatisDao;
import org.apache.ibatis.annotations.Param;

@MyBatisDao
public abstract interface GenTableDao extends CrudDao<GenTable> {
	public abstract int buildTable(@Param("sql") String paramString);
}