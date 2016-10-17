/**
 * Copyright &copy; 2015-2015  Jeedcp All rights reserved.
 */
package com.jeedcp.modules.gen.sevice;

import com.jeedcp.common.persistence.Page;
import com.jeedcp.common.service.BaseService;
import com.jeedcp.common.utils.StringUtils;
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
 * @author jeedcp
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
	
	public Page<GenTemplate> find(Page<GenTemplate> page, GenTemplate genTemplate) {
        List<GenTemplate> list = genTemplateDao.findList(genTemplate);
		page.setList(list);
		return page;
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
