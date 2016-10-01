<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.${appName}.${moduleName}.entity;
import java.io.Serializable;  
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import com.jfpal.core.base.BaseModel;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="${table.sqlName}")
public class ${className} extends BaseModel implements Serializable{
	private static final long serialVersionUID = 1L;
	<#list table.columns as column>
	<#if column.isDateTimeColumn>
	/** 变量 ${column.constantName} . */
	private String ${column.columnNameLower}Begin;
	private String ${column.columnNameLower}End;
	</#if>
	</#list>
	
	//columns START
	<#list table.columns as column>
	/** 变量 ${column.columnNameLower} . */
	<#if column.columnNameLower== 'id'>
	@Id
	private ${column.javaType} ${column.columnNameLower};
	</#if>
	<#if column.columnNameLower != 'id'>
	@Field("${column.sqlName}")
	private ${column.javaType} ${column.columnNameLower};
	</#if>
	</#list>
	//columns END

<@generateConstructor className/>
<@generateJavaColumns/>
<@generateJavaOneToMany/>
<@generateJavaManyToOne/>

}

<#macro generateJavaColumns>
	<#list table.columns as column>
	<#if column.isDateTimeColumn>
	public void set${column.columnName}Begin(String value) {
		this.${column.columnNameLower}Begin = value;
	}
	
	public String get${column.columnName}Begin() {
		return this.${column.columnNameLower}Begin;
	}
	public void set${column.columnName}End(String value) {
		this.${column.columnNameLower}End = value;
	}
	
	public String get${column.columnName}End() {
		return this.${column.columnNameLower}End;
	}
	</#if>	

	public void set${column.columnName}(${column.javaType} ${column.columnNameLower}) {
		this.${column.columnNameLower} = ${column.columnNameLower};
	}
	
	public ${column.javaType} get${column.columnName}() {
		return this.${column.columnNameLower};
	}
	
	<#if column.pk>
	public ${column.javaType} getPk() {
		return this.${column.columnNameLower};
	}
	</#if>
	</#list>
</#macro>

<#macro generateJavaOneToMany>
	<#list table.exportedKeys.associatedTables?values as foreignKey>
	<#assign fkSqlTable = foreignKey.sqlTable>
	<#assign fkTable    = fkSqlTable.className>
	<#assign fkPojoClass = fkSqlTable.className>
	<#assign fkPojoClassVar = fkPojoClass?uncap_first>
	
	private Set ${fkPojoClassVar}s = new HashSet(0);
	public void set${fkPojoClass}s(Set<${fkPojoClass}> ${fkPojoClassVar}){
		this.${fkPojoClassVar}s = ${fkPojoClassVar};
	}
	
	public Set<${fkPojoClass}> get${fkPojoClass}s() {
		return ${fkPojoClassVar}s;
	}
	</#list>
</#macro>

<#macro generateJavaManyToOne>
	<#list table.importedKeys.associatedTables?values as foreignKey>
	<#assign fkSqlTable = foreignKey.sqlTable>
	<#assign fkTable    = fkSqlTable.className>
	<#assign fkPojoClass = fkSqlTable.className>
	<#assign fkPojoClassVar = fkPojoClass?uncap_first>
	
	private ${fkPojoClass} ${fkPojoClassVar};
	
	public void set${fkPojoClass}(${fkPojoClass} ${fkPojoClassVar}){
		this.${fkPojoClassVar} = ${fkPojoClassVar};
	}
	
	public ${fkPojoClass} get${fkPojoClass}() {
		return ${fkPojoClassVar};
	}
	</#list>
</#macro>
