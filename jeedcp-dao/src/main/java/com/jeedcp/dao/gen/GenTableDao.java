package com.jeedcp.dao.gen;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.entity.gen.GenTable;
import com.jeedcp.persistence.annotation.MyBatisDao;
import org.apache.ibatis.annotations.Param;

@MyBatisDao
public abstract interface GenTableDao extends CrudDao<GenTable> {
	public abstract int buildTable(@Param("sql") String paramString);
}