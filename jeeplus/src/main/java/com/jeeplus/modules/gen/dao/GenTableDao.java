package com.jeeplus.modules.gen.dao;

import com.jeeplus.modules.gen.entity.GenTable;
import org.apache.ibatis.annotations.Param;

import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;

@MyBatisDao
public abstract interface GenTableDao extends CrudDao<GenTable> {
	public abstract int buildTable(@Param("sql") String paramString);
}