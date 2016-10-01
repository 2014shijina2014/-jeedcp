package com.jeedcp.generator;

import java.util.LinkedHashSet;

import cn.org.rapid_framework.generator.Generator.GeneratorModel;
import cn.org.rapid_framework.generator.GeneratorFacade;
import cn.org.rapid_framework.generator.GeneratorFacade.GeneratorModelUtils;
import cn.org.rapid_framework.generator.provider.db.table.model.Column;
import cn.org.rapid_framework.generator.provider.db.table.model.Table;
import com.jeedcp.util.MongoDBUtil;


public class MongoDBGeneratorMain {
	
	public static void main(String[] args) throws Exception {
		String sqlName="appToken";
		String className="AppToken";
		String dbStr="pm-core";
		
		Table table=new Table();
		table.setSqlName(sqlName);
		table.setClassName(className);
		
		LinkedHashSet<Column> columns= MongoDBUtil.client(dbStr, sqlName);
		table.setColumns(columns);
		
		
		GeneratorFacade g = new GeneratorFacade();
		g.getGenerator().setTemplateRootDirs("mongoTemplate");
		
		GeneratorModel m = GeneratorModelUtils.newGeneratorModel("table",table);
		g.getGenerator().generateBy(m.templateModel,m.filePathModel);
		
	}
	
	
}
