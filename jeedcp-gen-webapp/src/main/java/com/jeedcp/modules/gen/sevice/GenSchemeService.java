/**
 * Copyright &copy; 2015-2015  Jeedcp All rights reserved.
 */
package com.jeedcp.modules.gen.sevice;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageHelper;


import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.common.service.BaseService;
import com.jeedcp.common.utils.StringUtils;
import com.jeedcp.modules.gen.dao.GenSchemeDao;
import com.jeedcp.modules.gen.dao.GenTableColumnDao;
import com.jeedcp.modules.gen.dao.GenTableDao;
import com.jeedcp.modules.gen.entity.*;
import com.jeedcp.modules.gen.util.GenUtils;
import com.jeedcp.modules.sys.utils.CurrentUserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 生成方案Service
 * @author jeedcp
 * @version 2013-10-15
 */
@Service
@Transactional(readOnly = true)
public class GenSchemeService extends BaseService {

	@Autowired
	private GenSchemeDao genSchemeDao;
//	@Autowired
//	private GenTemplateDao genTemplateDao;
	@Autowired
	private GenTableDao genTableDao;
	@Autowired
	private GenTableColumnDao genTableColumnDao;
	
	public GenScheme get(String id) {
		return genSchemeDao.get(id);
	}
	
	public Pagination<GenScheme> find(Pagination<GenScheme> page, GenScheme genScheme) {
		GenUtils.getTemplatePath();
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<GenScheme> list = genSchemeDao.findList(genScheme);
        //用PageInfo对结果进行包装
        Pagination pageInfo = new Pagination(list);
        return pageInfo;
	}
	
	@Transactional(readOnly = false)
	public String save(GenScheme genScheme) {
		if (StringUtils.isBlank(genScheme.getId())){
            CurrentUserUtils.preInsert(genScheme);
			genSchemeDao.insert(genScheme);
		}else{
            CurrentUserUtils.preUpdate(genScheme);
			genSchemeDao.update(genScheme);
		}
		// 生成代码
		if ("1".equals(genScheme.getFlag())){
			return generateCode(genScheme);
		}
		return "";
	}
	
	@Transactional(readOnly = false)
	public void delete(GenScheme genScheme) {
		genSchemeDao.delete(genScheme);
	}
	
	private String generateCode(GenScheme genScheme){

		StringBuilder result = new StringBuilder();
		
		// 查询主表及字段列
		GenTable genTable = genTableDao.get(genScheme.getGenTable().getId());
		genTable.setColumnList(genTableColumnDao.findList(new GenTableColumn(new GenTable(genTable.getId()))));
		
		// 获取所有代码模板
		GenConfig config = GenUtils.getConfig();
		
		// 获取模板列表
		List<GenTemplate> templateList = GenUtils.getTemplateList(config, genScheme.getCategory(), false);
		List<GenTemplate> childTableTemplateList = GenUtils.getTemplateList(config, genScheme.getCategory(), true);
		
		// 如果有子表模板，则需要获取子表列表
		if (childTableTemplateList.size() > 0){
			GenTable parentTable = new GenTable();
			parentTable.setParentTable(genTable.getName());
			genTable.setChildList(genTableDao.findList(parentTable));
		}
		
		// 生成子表模板代码
		for (GenTable childTable : genTable.getChildList()){
			childTable.setParent(genTable);
			childTable.setColumnList(genTableColumnDao.findList(new GenTableColumn(new GenTable(childTable.getId()))));
			genScheme.setGenTable(childTable);
			Map<String, Object> childTableModel = GenUtils.getDataModel(genScheme);
			for (GenTemplate tpl : childTableTemplateList){
				result.append(GenUtils.generateToFile(tpl, childTableModel, genScheme.getReplaceFile()));
			}
		}
		
		// 生成主表模板代码
		genScheme.setGenTable(genTable);
		Map<String, Object> model = GenUtils.getDataModel(genScheme);
		for (GenTemplate tpl : templateList){
			result.append(GenUtils.generateToFile(tpl, model, genScheme.getReplaceFile()));
		}
		return result.toString();
	}
}
