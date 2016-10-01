<#include "/macro.include"/>
<#include "/custom.include"/>  
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#assign actionExtension = "do"> 
<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  ${className}Detail
  Detail   :  该页用于 ${table.tableAlias}管理-${table.tableAlias}明细信息
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="pageContent">
<form method="post" action="" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
		 <#list table.columns as column>
		 <#if !column.pk>
	 	<dl>
			<label>${column.columnAlias}</label>
			<#if !column.nullable>
			<label>${'${'}infos.${column.columnNameLower}${'}'}</label>
			<#else>
			  	<#if column.isDateTimeColumn>
			  	<label><fmt:formatDate value="${'${'}infos.${column.columnNameLower}${'}'}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></label>
			 	 <#else>
			 	 <label>${'${'}infos.${column.columnNameLower}${'}'}</label>
				</#if>
			</#if>
		</dl>
		</#if>
	 </#list>
	</div>

	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>
