<#include "/macro.include"/>
<#include "/custom.include"/>  
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#assign actionExtension = "do"> 
<%----------------------------------------------------------------------
  Copyright(c) 2011 ALLINPAY. All Right Reserver.

  File Name:  ${className}sQuery
  Detail   :  该页用于 ${table.tableAlias}管理-${table.tableAlias}查询
----------------------------------------------------------------------%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function resetAll(){
	$("input[type=text],select",navTab.getCurrentPanel()).each(function(){
		$(this).val('');
	});
}
</script>
<form id="pagerForm" method="post" action="${businessName}" onsubmit="return navTabSearch(this)">
	<input type="hidden" name="pageNum" value="1" /> 
	<input type="hidden" name="numPerPage" value="${'${'}page.pageSize${'}'}" />

	<div class="pageHeader">
		<div class="searchBar">
			<#assign def_index =0>   
			   	 	<ul class="searchContent">
			 <#list table.columns as column>
			
			   	 <#assign def_index =def_index+1>
			   	 <#if def_index==7>
			   	 	<#break>
			   	 </#if>
			   	 
			 	<#if !column.isDateTimeColumn>
				<li>
					<label>${column.columnAlias}：</label> 
					<input type="text" name="${column.columnNameLower}" value="${'${'}${classNameLower}.${column.columnNameLower}${'}'}" />
				</li>
			  	<#else>	
			  	<li>
			  		<label>${column.columnAlias}：</label>
	      			<input type="text" name="${column.columnNameLower}" value="${'${'}${classNameLower}.${column.columnNameLower}${'}'}"  class="date" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" />
				</li>
			   	</#if>
			   	<#if def_index %3 ==0>
			   	 	</ul>
			   	 	<ul class="searchContent">
			   	 </#if>
			   
			</#list>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">搜索</button>
							</div>
						</div></li>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="button" onclick="resetAll();">清空</button>
							</div>
						</div>
					</li>
					<li><a class="button" href="${businessName}/showinfo/advancedSearche" target="dialog" mask="false" title="查询框"><span>高级检索</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</form>
<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" target="navTab" rel="${businessName}Nav"
				href="${businessName}/add${className}ToPage" title="添加"><span>添加</span></a></li>
			<li><a class="delete" target="selectedTodo" rel="orderIndexs"
					postType="string" href="${businessName}/deleteAll" title="确实要删除这些记录吗?"><span>批量删除</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>


	<table class="table" width="100%" layoutH="188">
		<thead>
			<tr>
				<th width="50"><input type="checkbox" group="orderIndexs" class="checkboxCtrl"></th>
				  <#list table.columns as column>
				  	
				  		<th width="130" align="center">${column.columnAlias}</th>
				  
				  </#list>
				  <th width="130" align="center">操作</th>
			</tr>
		</thead>
		<tbody>
		<#assign def_pkColumnNameLower ="">
		<#list table.pkColumns as pkcolumn>
			<#assign def_pkColumnNameLower ="${pkcolumn.columnNameLower}">
			
		</#list> 
		<c:forEach var="item" items="${'${'}page.result${'}'}" varStatus="s">
			<tr target="slt_objId" rel="${'${'}item.${def_pkColumnNameLower}${'}'}">
				<td width="50"><input name="orderIndexs" value="${'${'}item.${def_pkColumnNameLower} ${'}'}" type="checkbox"></td>
				  <#list table.columns as column>
				  
				   <#if !column.isDateTimeColumn>
				   
				  	<td width="130" align="center">${'${'}${'item.'}${column.columnNameLower}${'}'}</td>
				    <#else>	
				    
					<td width="150"><fmt:formatDate value="${'${'}${'item.'}${column.columnNameLower}${'}'}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</#if>
					
				  </#list>
				  
				  	<td width="130">
				  		<a class="btnInfo" href="${businessName}/showinfo/${'${'}item.${def_pkColumnNameLower} ${'}'}" target="navTab" title="查看详情">查看</a>
						<a class="btnDel" href="${businessName}/delete/${'${'}item.${def_pkColumnNameLower} ${'}'}" target="ajaxTodo" title="你确定要删除吗?">删除</a>
						<a class="btnEdit" href="${businessName}/modify/${'${'}item.${def_pkColumnNameLower} ${'}'}" target="navTab" rel="${businessName}Nav" title="编辑">编辑</a>
				   </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<c:import url="/jsp/system/panelBar.jsp"></c:import>
</div>

<#macro generatePkExp><#list table.pkColumns as column>'${r"${datagrid."}${column.columnNameLower}${r"}"}'<#if column_has_next>,</#if></#list></#macro>
<#macro generatePkFunParam><#list table.pkColumns as column>${column.columnNameLower}<#if column_has_next>,</#if></#list></#macro>
<#macro generatePkUrlParam><#list table.pkColumns as column>${column.columnNameLower}="+${column.columnNameLower}<#if column_has_next>+"&</#if></#list></#macro>