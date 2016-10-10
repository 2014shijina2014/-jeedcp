/**
 * Copyright &copy; 2015-2015  Metinform All rights reserved.
 */
package com.jeedcp.modules.gen.sevice;

import com.github.pagehelper.PageHelper;

import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.common.service.BaseService;
import com.jeedcp.common.utils.StringUtils;
import com.jeedcp.modules.gen.dao.GenTemplateDao;
import com.jeedcp.modules.gen.entity.GenTemplate;
import com.jeedcp.modules.gen.dao.GenTemplateDao;
import com.jeedcp.modules.gen.entity.GenTemplate;
import com.jeedcp.modules.sys.utils.CurrentUserUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

/**
 * 代码模板Service
 * @author Zach Xu
 * @version 2013-10-15
 */
@Service
@Transactional(readOnly = true)
public class GenTemplateService extends BaseService {

	@Autowired
	private GenTemplateDao genTemplateDao;
	
	public GenTemplate get(String id) {
		return genTemplateDao.get(id);
	}
	
	public Pagination<GenTemplate> find(Pagination<GenTemplate> page, GenTemplate genTemplate) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<GenTemplate> list = genTemplateDao.findList(genTemplate);
        //用PageInfo对结果进行包装
        Pagination pageInfo = new Pagination(list);
        return pageInfo;
	}
	
	@Transactional(readOnly = false)
	public void save(GenTemplate genTemplate) {
		if (genTemplate.getContent()!=null){
			genTemplate.setContent(StringEscapeUtils.unescapeHtml4(genTemplate.getContent()));
		}
		if (StringUtils.isBlank(genTemplate.getId())){
            CurrentUserUtils.preInsert(genTemplate);
			genTemplateDao.insert(genTemplate);
		}else{
            CurrentUserUtils.preUpdate(genTemplate);
			genTemplateDao.update(genTemplate);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(GenTemplate genTemplate) {
		genTemplateDao.delete(genTemplate);
	}
	
}
