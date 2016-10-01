<#include "/macro.include"/>
<#include "/custom.include"/>  
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#assign actionExtension = "do"> 
<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  ${className}Add
  Detail   :  该页用于 ${table.tableAlias}管理-${table.tableAlias}新增
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="pageContent">
<form method="post" action="${businessName}/save${className}Action?navTabId=${businessName}&callbackType=closeCurrent" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone);">
	<div class="pageFormContent" layoutH="56">
	 <#list table.columns as column>
	 <#if !column.pk>
	 	<dl>
			<label>${column.columnAlias}</label>
			<#if !column.nullable>
			<input type="text" name="${column.columnNameLower}" class="required" maxlength="${column.size}"/>
			<#else>
			  	<#if column.isDateTimeColumn>
				<input type="text" name="${column.columnNameLower}" class="date" maxlength="${column.size}" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
			 	 <#else>
				<input type="text" name="${column.columnNameLower}" class="" maxlength="${column.size}"/>
				</#if>
			</#if>
		</dl>
		</#if>
	 </#list>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>

