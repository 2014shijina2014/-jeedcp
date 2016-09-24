package com.jeeplus.modules.gen.service;

import java.util.List;
import java.util.Map;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.service.BaseService;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.gen.dao.GenDataBaseDictDao;
import com.jeeplus.modules.gen.dao.GenTableColumnDao;
import com.jeeplus.modules.gen.dao.GenTableDao;
import com.jeeplus.modules.gen.entity.GenConfig;
import com.jeeplus.modules.gen.entity.GenScheme;
import com.jeeplus.modules.gen.entity.GenTable;
import com.jeeplus.modules.gen.entity.GenTableColumn;
import com.jeeplus.modules.gen.utils.FreemarkerHelper;
import com.jeeplus.modules.gen.utils.GenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional(readOnly = true)
public class CgAutoListService extends BaseService {

	@Autowired
	private GenTableDao genTableDao;

	@Autowired
	private GenTableColumnDao genTableColumnDao;

	@Autowired
	private GenDataBaseDictDao genDataBaseDictDao;

	public GenTable get(String id) {
		GenTable genTable = this.genTableDao.get(id);
		GenTableColumn genTableColumn = new GenTableColumn();
		genTableColumn.setGenTable(new GenTable(genTable.getId()));
		genTable.setColumnList(this.genTableColumnDao.findList(genTableColumn));
		return genTable;
	}

	public Page<GenTable> find(Page<GenTable> page, GenTable genTable) {
		genTable.setPage(page);
		page.setList(this.genTableDao.findList(genTable));
		return page;
	}

	public List<GenTable> findAll() {
		return this.genTableDao.findAllList(new GenTable());
	}

	public List<GenTable> findTableListFormDb(GenTable genTable) {
		return this.genDataBaseDictDao.findTableList(genTable);
	}

	public boolean checkTableName(String tableName) {
		if (StringUtils.isBlank(tableName)) {
			return true;
		}
		GenTable genTable = new GenTable();
		genTable.setName(tableName);
		List list = this.genTableDao.findList(genTable);
		return list.size() == 0;
	}

	public boolean checkTableNameFromDB(String tableName) {
		if (StringUtils.isBlank(tableName)) {
			return true;
		}
		GenTable genTable = new GenTable();
		genTable.setName(tableName);
		List list = this.genDataBaseDictDao.findTableList(genTable);
		return list.size() == 0;
	}

	public String generateCode(GenScheme genScheme) {
		StringBuilder result = new StringBuilder();

		GenTable genTable = this.genTableDao.get(genScheme.getGenTable().getId());
		genTable.setColumnList(this.genTableColumnDao.findList(new GenTableColumn(new GenTable(genTable.getId()))));

		GenConfig config = GenUtils.getConfig();

		genScheme.setGenTable(genTable);
		Map model = GenUtils.getDataModel(genScheme);

		FreemarkerHelper viewEngine = new FreemarkerHelper();
		String html = viewEngine.parseTemplate("/com/jeeplus/modules/gen/template/viewList.ftl", model);
		return html;
	}

	public String generateListCode(GenScheme genScheme) {
		StringBuilder result = new StringBuilder();

		GenTable genTable = this.genTableDao.get(genScheme.getGenTable().getId());
		genTable.setColumnList(this.genTableColumnDao.findList(new GenTableColumn(new GenTable(genTable.getId()))));

		GenConfig config = GenUtils.getConfig();

		genScheme.setGenTable(genTable);
		Map model = GenUtils.getDataModel(genScheme);

		FreemarkerHelper viewEngine = new FreemarkerHelper();
		String html = viewEngine.parseTemplate("/com/jeeplus/modules/gen/template/findList.ftl", model);
		return html;
	}
}