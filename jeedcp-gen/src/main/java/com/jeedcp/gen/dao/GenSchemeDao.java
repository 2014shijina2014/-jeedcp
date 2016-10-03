package com.jeedcp.gen.dao;


import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.gen.entity.GenScheme;
import com.jeedcp.persistence.annotation.MyBatisDao;

@MyBatisDao
public abstract interface GenSchemeDao extends CrudDao<GenScheme> {
}