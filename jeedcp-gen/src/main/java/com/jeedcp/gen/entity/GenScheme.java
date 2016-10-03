package com.jeedcp.gen.entity;

import com.jeedcp.entity.base.DataEntity;
import org.hibernate.validator.constraints.Length;

public class GenScheme extends DataEntity<GenScheme> {
	private static final long serialVersionUID = 1L;
	private String name;
	private String category;
	private String packageName;
	private String moduleName;
	private String subModuleName;
	private String functionName;
	private String functionNameSimple;
	private String functionAuthor;
	private GenTable genTable;
	private String flag;
	private Boolean replaceFile;

	public GenScheme() {
	}

	public GenScheme(String id) {
		super(id);
	}

	@Length(min = 1, max = 200)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPackageName() {
		return this.packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getModuleName() {
		return this.moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getSubModuleName() {
		return this.subModuleName;
	}

	public void setSubModuleName(String subModuleName) {
		this.subModuleName = subModuleName;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFunctionName() {
		return this.functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getFunctionNameSimple() {
		return this.functionNameSimple;
	}

	public void setFunctionNameSimple(String functionNameSimple) {
		this.functionNameSimple = functionNameSimple;
	}

	public String getFunctionAuthor() {
		return this.functionAuthor;
	}

	public void setFunctionAuthor(String functionAuthor) {
		this.functionAuthor = functionAuthor;
	}

	public GenTable getGenTable() {
		return this.genTable;
	}

	public void setGenTable(GenTable genTable) {
		this.genTable = genTable;
	}

	public String getFlag() {
		return this.flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Boolean getReplaceFile() {
		return this.replaceFile;
	}

	public void setReplaceFile(Boolean replaceFile) {
		this.replaceFile = replaceFile;
	}
}