/**
 * Copyright &copy; 2015-2015  Metinform All rights reserved.
 */
package com.jeedcp.modules.sys.service;

import com.jeedcp.common.service.TreeService;
import com.jeedcp.modules.sys.dao.AreaDao;
import com.jeedcp.modules.sys.entity.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 区域Service
 * @author Zach Xu
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class AreaService extends TreeService<AreaDao, Area> {

    @Autowired
    private AreaDao areaDao;

	public List<Area> findAll(){
        List<Area> areaList = areaDao.findAllList(new Area());
        return areaList;
	}

	@Transactional(readOnly = false)
	public void save(Area area) {
		super.save(area);
//		UserUtils.removeCache(UserUtils.CACHE_AREA_LIST);
	}
	
	@Transactional(readOnly = false)
	public void delete(Area area) {
		super.delete(area);
//		UserUtils.removeCache(UserUtils.CACHE_AREA_LIST);
	}
	
}
