package com.jeeplus.modules.gen.dao;


import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.gen.entity.GenScheme;

@MyBatisDao
public abstract interface GenSchemeDao extends CrudDao<GenScheme> {
}