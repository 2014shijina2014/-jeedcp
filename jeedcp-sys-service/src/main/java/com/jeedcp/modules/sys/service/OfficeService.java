/**
 * Copyright &copy; 2015-2015  Jeedcp All rights reserved.
 */
package com.jeedcp.modules.sys.service;

import com.jeedcp.common.service.TreeService;
import com.jeedcp.modules.sys.dao.OfficeDao;
import com.jeedcp.modules.sys.entity.Office;
import com.jeedcp.modules.sys.entity.User;

import com.jeedcp.modules.sys.utils.CurrentUserUtils;
import com.jeedcp.modules.sys.utils.DataFilterUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 机构Service
 * @author jeedcp
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class OfficeService extends TreeService<OfficeDao, Office> {

    @Autowired
    OfficeDao officeDao;

	public List<Office> findAll(){
        List<Office> officeList = null;
        if (officeList == null){
            User user = CurrentUserUtils.getUser();
            if (user.isAdmin()){
                officeList = officeDao.findAllList(new Office());
            }else{
                Office office = new Office();
                office.getSqlMap().put("dsf", DataFilterUtils.dataScopeFilter(user, "o", "u"));
                officeList = officeDao.findList(office);
            }
        }
        return officeList;
	}

//	public List<Office> findList(Boolean isAll){
//		if (isAll != null && isAll){
//			return UserUtils.getOfficeAllList();
//		}else{
//			return UserUtils.getOfficeList();
//		}
//	}
	
	@Transactional(readOnly = true)
	public List<Office> findList(Office office){
		office.setParentIds(office.getParentIds()+"%");
		return dao.findByParentIdsLike(office);
	}
	
	@Transactional(readOnly = false)
	public void save(Office office) {
		super.save(office);
//		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}
	
	@Transactional(readOnly = false)
	public void delete(Office office) {
		super.delete(office);
//		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}
	
}
