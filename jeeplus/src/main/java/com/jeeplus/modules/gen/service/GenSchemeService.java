package com.jeeplus.modules.gen.service;

import java.util.List;
import java.util.Map;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.service.BaseService;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.gen.dao.GenSchemeDao;
import com.jeeplus.modules.gen.dao.GenTableColumnDao;
import com.jeeplus.modules.gen.dao.GenTableDao;
import com.jeeplus.modules.gen.entity.*;
import com.jeeplus.modules.gen.utils.GenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional(readOnly = true)
public class GenSchemeService extends BaseService {

	@Autowired
	private GenSchemeDao genSchemeDao;

	@Autowired
	private GenTableDao genTableDao;

	@Autowired
	private GenTableColumnDao genTableColumnDao;

	public GenScheme get(String id) {
		return this.genSchemeDao.get(id);
	}

	public Page<GenScheme> find(Page<GenScheme> page, GenScheme genScheme) {
		GenUtils.getTemplatePath();
		genScheme.setPage(page);
		page.setList(this.genSchemeDao.findList(genScheme));
		return page;
	}

	@Transactional(readOnly = false)
	public String save(GenScheme genScheme) {
		if (StringUtils.isBlank(genScheme.getId())) {
			genScheme.preInsert();
			this.genSchemeDao.insert(genScheme);
		} else {
			genScheme.preUpdate();
			this.genSchemeDao.update(genScheme);
		}
		return generateCode(genScheme);
	}

	@Transactional(readOnly = false)
	public void delete(GenScheme genScheme) {
		this.genSchemeDao.delete(genScheme);
	}

	private String generateCode(GenScheme genScheme) {
		StringBuilder result = new StringBuilder();

		GenTable genTable = this.genTableDao.get(genScheme.getGenTable().getId());
		genTable.setColumnList(this.genTableColumnDao.findList(new GenTableColumn(new GenTable(genTable.getId()))));

		GenConfig config = GenUtils.getConfig();

		List<GenTemplate> templateList = GenUtils.getTemplateList(config, genScheme.getCategory(), false);
		List<GenTemplate> childTableTemplateList = GenUtils.getTemplateList(config, genScheme.getCategory(), true);

		if (childTableTemplateList.size() > 0) {
			GenTable parentTable = new GenTable();
			parentTable.setParentTable(genTable.getName());
			genTable.setChildList(this.genTableDao.findList(parentTable));
		}
		Map childTableModel;
		for (GenTable childTable : genTable.getChildList()) {
			childTable.setParent(genTable);
			childTable.setColumnList(
					this.genTableColumnDao.findList(new GenTableColumn(new GenTable(childTable.getId()))));
			genScheme.setGenTable(childTable);
			childTableModel = GenUtils.getDataModel(genScheme);
			for (GenTemplate tpl : childTableTemplateList) {
				result.append(GenUtils.generateToFile(tpl, childTableModel, true));
			}

		}

		genScheme.setGenTable(genTable);
		Map model = GenUtils.getDataModel(genScheme);
		GenTable genTable1 = (GenTable) model.get("table");
		for(GenTableColumn genTableColumn :genTable1.getColumnList()){
			System.out.println(genTableColumn.getShowType());
		}

		for (GenTemplate tpl : templateList) {
			result.append(GenUtils.generateToFile(tpl, model, true));
		}
		return result.toString();
	}

	public GenScheme findUniqueByProperty(String propertyName, String value) {
		return this.genSchemeDao.findUniqueByProperty(propertyName, value);
	}
}