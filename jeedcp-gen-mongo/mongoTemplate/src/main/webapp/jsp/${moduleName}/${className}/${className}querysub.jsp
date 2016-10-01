<#include "/macro.include"/>
<#include "/custom.include"/>  
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#assign actionExtension = "do"> 
<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  ${className}Querysub
  Detail   :  该页用于 ${table.tableAlias}管理-${table.tableAlias}查询
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${businessName}" class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			<input type="hidden" name="pageNum" value="1" /> 
			<input type="hidden" name="numPerPage" value="${'${'}page.pageSize${'}'}" />
			
			<#assign def_index =0>   
			 <#list table.columns as column>
			 
			   	 <#assign def_index =def_index+1>
			 	<#if !column.isDateTimeColumn>
					<div class="unit">
						<label>${column.columnAlias}：</label> 
						<input type="text" name="${column.columnNameLower}" value="${'${'}${classNameLower}.${column.columnNameLower}${'}'}" />
					</div>
				<#else>	
				
					<div class="unit">
						<label>${column.columnAlias}：</label> 
						<input type="text" name="${column.columnNameLower}" value="${'${'}${classNameLower}.${column.columnNameLower}${'}'}" />
					</div>
				</#if>
			
			</#list>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">开始检索</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset">清空重输</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
