package com.jeeplus.modules.gen.service;


import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.service.BaseService;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.gen.dao.GenTemplateDao;
import com.jeeplus.modules.gen.entity.GenTemplate;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional(readOnly = true)
public class GenTemplateService extends BaseService {

	@Autowired
	private GenTemplateDao genTemplateDao;

	public GenTemplate get(String id) {
		return this.genTemplateDao.get(id);
	}

	public Page<GenTemplate> find(Page<GenTemplate> page, GenTemplate genTemplate) {
		genTemplate.setPage(page);
		page.setList(this.genTemplateDao.findList(genTemplate));
		return page;
	}

	@Transactional(readOnly = false)
	public void save(GenTemplate genTemplate) {
		if (genTemplate.getContent() != null) {
			genTemplate.setContent(StringEscapeUtils.unescapeHtml3(genTemplate.getContent()));
		}
		if (StringUtils.isBlank(genTemplate.getId())) {
			genTemplate.preInsert();
			this.genTemplateDao.insert(genTemplate);
		} else {
			genTemplate.preUpdate();
			this.genTemplateDao.update(genTemplate);
		}
	}

	@Transactional(readOnly = false)
	public void delete(GenTemplate genTemplate) {
		this.genTemplateDao.delete(genTemplate);
	}
}