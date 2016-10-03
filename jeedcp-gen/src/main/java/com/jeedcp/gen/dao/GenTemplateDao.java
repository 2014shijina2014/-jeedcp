package com.jeedcp.gen.dao;

import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.gen.entity.GenTemplate;
import com.jeedcp.persistence.annotation.MyBatisDao;

@MyBatisDao
public abstract interface GenTemplateDao extends CrudDao<GenTemplate> {
}