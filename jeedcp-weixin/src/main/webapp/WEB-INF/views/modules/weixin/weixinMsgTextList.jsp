<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信文本消息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/weixin/weixinMsgText/">微信文本消息列表</a></li>
		<shiro:hasPermission name="weixin:weixinMsgText:edit"><li><a href="${ctx}/weixin/weixinMsgText/form">微信文本消息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="weixinMsgText" action="${ctx}/weixin/weixinMsgText/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>base_id：</label>
				<form:input path="baseId" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>内容：</label>
				<form:input path="content" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>关键词</th>
				<th>内容</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="weixin:weixinMsgText:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="weixinMsgText">
			<tr>
				<td><a href="${ctx}/weixin/weixinMsgText/form?id=${weixinMsgText.id}">
					${weixinMsgText.baseName}
				</a></td>
				<td>
					${weixinMsgText.content}
				</td>
				<td>
					<fmt:formatDate value="${weixinMsgText.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${weixinMsgText.remarks}
				</td>
				<shiro:hasPermission name="weixin:weixinMsgText:edit"><td>
    				<a href="${ctx}/weixin/weixinMsgText/form?id=${weixinMsgText.id}">修改</a>
					<a href="${ctx}/weixin/weixinMsgText/delete?id=${weixinMsgText.id}" onclick="return confirmx('确认要删除该微信文本消息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>