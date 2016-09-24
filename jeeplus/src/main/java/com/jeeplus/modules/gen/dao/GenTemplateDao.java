package com.jeeplus.modules.gen.dao;

import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.gen.entity.GenTemplate;

@MyBatisDao
public abstract interface GenTemplateDao extends CrudDao<GenTemplate> {
}