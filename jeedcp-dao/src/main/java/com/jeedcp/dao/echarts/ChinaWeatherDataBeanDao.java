/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeedcp.dao.echarts;

import com.jeedcp.entity.echarts.ChinaWeatherDataBean;
import com.jeedcp.persistence.annotation.MyBatisDao;
import com.jeedcp.dao.base.CrudDao;

/**
 * 城市气温DAO接口
 * @author lgf
 * @version 2016-06-02
 */
@MyBatisDao
public interface ChinaWeatherDataBeanDao extends CrudDao<ChinaWeatherDataBean> {

	
}