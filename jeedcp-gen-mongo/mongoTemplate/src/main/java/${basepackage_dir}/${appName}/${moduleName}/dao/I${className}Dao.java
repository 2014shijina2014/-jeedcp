<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#assign actionExtension = "do">
package ${basepackage}.${appName}.${moduleName}.dao;


import com.jfpal.mongo.base.IMongoBaseDao;
import com.jfpal.core.base.Page;
import ${basepackage}.${appName}.${moduleName}.entity.${className};


public interface I${className}Dao extends IMongoBaseDao<${className},${className}>{
	public Page pageBy(${className} ${classNameLower},int pageIndex, int pageSize);
}

