<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
package ${basepackage}.${appName}.${moduleName}.dao.impl;

import ${basepackage}.${appName}.${moduleName}.dao.I${className}Dao;
import ${basepackage}.${appName}.${moduleName}.entity.${className};

import org.springframework.stereotype.Repository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.jfpal.mongo.base.MongoBaseDaoImpl;
import com.jfpal.core.base.Page;
import org.springframework.data.mongodb.core.query.Query;
import java.util.List;

@Repository("${classNameLower}Dao")
public class ${className}DaoImpl extends MongoBaseDaoImpl<${className},${className}> implements I${className}Dao  {
	
	final static Logger logger = LoggerFactory.getLogger(${className}DaoImpl.class);
	
	@Override
	public Page pageBy(${className} ${classNameLower},int pageIndex, int pageSize){
		Query query=new Query();
		query.skip(pageIndex*pageSize-pageSize);
        query.limit(pageSize);
       
        long totalRecord = mongoTemplate.count(query, entityClass);
       
        List<${className}> list= mongoTemplate.find(query, entityClass);
		
		return new Page((int)totalRecord, pageIndex, pageSize, list);
	}
	
}
