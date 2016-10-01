<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.${appName}.${moduleName}.service;


import com.jfpal.core.base.Page;
import ${basepackage}.${appName}.${moduleName}.entity.${className};

import java.util.List;

public interface I${className}Service {
	
	/**
	 * 新增
	 * @param  POJO对象
	 * @return String
	 */
	public String add(${className} ${classNameLower});
	
	
	/**
	 * 删除
	 * @param  POJO对象
	 * @return String
	 */
//	public String delete(String pk_id);
	
	/**
	 * 修改
	 * 
	 * @param  POJO对象
	 * @return String
	 */
//	public String update(${className} ${classNameLower});
	
	/**
	 * 分页查询
	 * @param  POJO对象
	 * @param  pageIndex          当前页页数
	 * @param  pageSize           每页记录数
	 * @return Page
	 */
	public Page find${className}s(${className} ${classNameLower},
			int pageIndex,
			int pageSize) ;
	
	/**
	 * 根据对象获取信息列表
	 * @param  POJO对象
	 * @return List<${className}>
	 */
//	public List<${className}> get${className}ListByObj(${className} ${classNameLower});
	
	/**
	 * 根据主键获取信息
	 * @param  POJO对象
	 * @return ${className}
	 */
//	public ${className} get${className}ByPk(String pk_Id);
	
	/**
	 * 查询所有
	 */
//	public List<${className}> findAll();
		
}
