/**
 * Copyright &copy; 2015-2015  Metinform All rights reserved.
 */
package com.jeedcp.modules.sys.service;


import com.jeedcp.common.cache.EhCacheServiceBean;
import com.jeedcp.common.service.CrudService;
import com.jeedcp.modules.sys.dao.DictDao;
import com.jeedcp.modules.sys.entity.Dict;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 字典Service
 * @author Zach Xu
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class DictService extends CrudService<DictDao, Dict> {


	@Autowired
	private EhCacheServiceBean ehCacheServiceBean;

    public EhCacheServiceBean getEhCacheServiceBean() {
        return ehCacheServiceBean;
    }


    /**
	 * 查询字段类型列表
	 * @return
	 */
	public List<String> findTypeList(){
		return dao.findTypeList(new Dict());
	}

	@Transactional(readOnly = false)
	public void save(Dict dict) {
		super.save(dict);
//		ehCacheServiceBean.remove(DictUtils.CACHE_DICT_MAP);
	}

	@Transactional(readOnly = false)
	public void delete(Dict dict) {
		super.delete(dict);
//		ehCacheServiceBean.remove(DictUtils.CACHE_DICT_MAP);
	}

}
