package com.jeedcp.gen.sevice;

import com.jeedcp.common.model.Page;
import com.jeedcp.gen.dao.GenDataBaseDictDao;
import com.jeedcp.gen.dao.GenTableColumnDao;
import com.jeedcp.gen.dao.GenTableDao;
import com.jeedcp.gen.entity.GenTable;
import com.jeedcp.gen.entity.GenTableColumn;
import com.jeedcp.gen.util.GenUtils;
import com.jeedcp.service.base.BaseService;
import com.jeedcp.util.StringTools;
import com.jeedcp.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;


@Service
@Transactional(readOnly = true)
public class GenTableService extends BaseService {

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

	public GenTable getTableFormDb(GenTable genTable) {
		if (StringUtils.isNotBlank(genTable.getName())) {
			List list = this.genDataBaseDictDao.findTableList(genTable);
			if (list.size() > 0) {
				if (StringUtils.isBlank(genTable.getId())) {
					genTable = (GenTable) list.get(0);

					if (StringUtils.isBlank(genTable.getComments())) {
						genTable.setComments(genTable.getName());
					}
					genTable.setClassName(StringTools.toCapitalizeCamelCase(genTable.getName()));
				}

				List<GenTableColumn> columnList = this.genDataBaseDictDao.findTableColumnList(genTable);
				for (GenTableColumn column : columnList) {
					boolean b = false;
					for (GenTableColumn e : genTable.getColumnList()) {
						if ((e.getName() != null) && (e.getName().equals(column.getName()))) {
							b = true;
						}
					}
					if (!b) {
						genTable.getColumnList().add(column);
					}

				}

				for (GenTableColumn e : genTable.getColumnList()) {
					boolean b = false;
					for (GenTableColumn column : columnList) {
						if (column.getName().equals(e.getName())) {
							b = true;
						}
					}
					if (!b) {
						e.setDelFlag("1");
					}

				}

				genTable.setPkList(this.genDataBaseDictDao.findTablePK(genTable));

				GenUtils.initColumnField(genTable);
			}
		}

		return genTable;
	}

	@Transactional(readOnly = false)
	public void save(GenTable genTable) {
		boolean isSync = true;
		GenTableColumn column;
		if (StringUtils.isBlank(genTable.getId())) {
			isSync = false;
		} else {
			GenTable oldTable = get(genTable.getId());
			if ((oldTable.getColumnList().size() != genTable.getColumnList().size())
					|| (!oldTable.getName().equals(genTable.getName()))
					|| (!oldTable.getComments().equals(genTable.getComments())))
				isSync = false;
			else {
				for (Iterator localIterator = genTable.getColumnList().iterator(); localIterator.hasNext();) {
					column = (GenTableColumn) localIterator.next();
					if (StringUtils.isBlank(column.getId())) {
						isSync = false;
					} else {
						GenTableColumn oldColumn = this.genTableColumnDao.get(column.getId());
						if ((oldColumn.getName().equals(column.getName()))
								&& (oldColumn.getJdbcType().equals(column.getJdbcType()))
								&& (oldColumn.getIsPk().equals(column.getIsPk()))
								&& (oldColumn.getComments().equals(column.getComments())))
							continue;
						isSync = false;
					}

				}

			}

		}

		if (!isSync) {
			genTable.setIsSync("0");
		}

		if (StringUtils.isBlank(genTable.getId())) {
			genTable.preInsert();
			this.genTableDao.insert(genTable);
		} else {
			genTable.preUpdate();
			this.genTableDao.update(genTable);
		}

		this.genTableColumnDao.deleteByGenTable(genTable);
		List<GenTableColumn> cols = genTable.getColumnList();
		for (GenTableColumn col : cols) {
			col.setGenTable(genTable);

			col.setId(null);
			col.preInsert();
			this.genTableColumnDao.insert(col);
		}
	}

	@Transactional(readOnly = false)
	public void syncSave(GenTable genTable) {
		genTable.setIsSync("1");
		this.genTableDao.update(genTable);
	}

	@Transactional(readOnly = false)
	public void saveFromDB(GenTable genTable) {
		genTable.preInsert();
		this.genTableDao.insert(genTable);

		for (GenTableColumn column : genTable.getColumnList()) {
			column.setGenTable(genTable);
			column.setId(null);
			column.preInsert();
			this.genTableColumnDao.insert(column);
		}
	}

	@Transactional(readOnly = false)
	public void delete(GenTable genTable) {
		this.genTableDao.delete(genTable);
		this.genTableColumnDao.deleteByGenTable(genTable);
	}

	@Transactional(readOnly = false)
	public void buildTable(String sql) {
		this.genTableDao.buildTable(sql);
	}
}