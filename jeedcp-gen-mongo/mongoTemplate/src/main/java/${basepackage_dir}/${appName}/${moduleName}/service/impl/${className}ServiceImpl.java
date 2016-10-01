<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.${appName}.${moduleName}.service.impl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfpal.core.base.Page;
import ${basepackage}.${appName}.${moduleName}.dao.I${className}Dao;
import ${basepackage}.${appName}.${moduleName}.entity.${className};
import ${basepackage}.${appName}.${moduleName}.service.I${className}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional//默认将类中的所有函数纳入事务管理.
public class ${className}ServiceImpl implements I${className}Service{
	@Autowired
	private I${className}Dao ${classNameLower}Dao;
	
	
	final static Logger logger = LoggerFactory.getLogger(${className}ServiceImpl.class);

	/**
	 * 新增
	 * 
	 * @param  POJO对象
	 * @return String
	 */
	public String add(${className} ${classNameLower}) {
		// 保存申请信息
		${classNameLower}Dao.save(${classNameLower});
		return null;
	}
	
	/**
	 * 删除
	 * 
	 * @param  POJO对象
	 * @return String
	 */
//	public String delete(String pk_id) {
//		${classNameLower}Dao.deleteById(pk_id);
//		return null;
//	}
//	
	/**
	 * 新增修改
	 * 
	 * @param  POJO对象
	 * @return String
	 */
//	public String update(${className} ${classNameLower}) {
//    	// 保存申请信息
//		${classNameLower}Dao.update(${classNameLower});
//		return null;
//	}
	
	/**
	 * 分页查询
	 * @param  POJO对象
	 * @param  pageIndex          当前页页数
	 * @param  pageSize           每页记录数
	 * @return Page
	 */
	public Page find${className}s(${className} ${classNameLower},
			int pageIndex,
			int pageSize) {
		return ${classNameLower}Dao.pageBy(${classNameLower}, pageIndex, pageSize);
	}
	
	/**
	 * 根据主键对象获取信息
	 * 
	 * @param  POJO对象
	 * @return ${className}
	 */
//	public List<${className}> get${className}ListByObj(${className} ${classNameLower}) {
//		return ${classNameLower}Dao.findListByObj(${classNameLower});
//	}
	
	/**
	 * 根据主键获取信息
	 * 
	 * @param  POJO对象
	 * @return ${className}
	 */
//	public ${className} get${className}ByPk(String pk_Id) {
//		return ${classNameLower}Dao.findByPKId(pk_Id);
//	}
	
	/**
	 * 查询所有
	 */
//	public List<${className}> findAll(){
//		return ${classNameLower}Dao.selectAll${className}();
//	}
//	
}
