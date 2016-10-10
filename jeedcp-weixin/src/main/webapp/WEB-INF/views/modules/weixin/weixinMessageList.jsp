<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信推送信息管理</title>
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
		<li class="active"><a href="${ctx}/weixin/weixinMessage/">微信推送信息列表</a></li>
		<shiro:hasPermission name="weixin:weixinMessage:edit"><li><a href="${ctx}/weixin/weixinMessage/form">微信推送信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="weixinMessage" action="${ctx}/weixin/weixinMessage/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>作者：</label>
				<form:input path="author" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>公众账号：</label>
				<form:input path="accountId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>标题</th>
				<th>公众账号</th>
				<th>作者</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="weixin:weixinMessage:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="weixinMessage">
			<tr>
				<td><a href="${ctx}/weixin/weixinMessage/form?id=${weixinMessage.id}">
					${weixinMessage.title}
				</a></td>
				<td>
						${weixinMessage.accountName}
				</td>
				<td>
					${weixinMessage.author}
				</td>

				<td>
					<fmt:formatDate value="${weixinMessage.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${weixinMessage.remarks}
				</td>
				<shiro:hasPermission name="weixin:weixinMessage:edit"><td>
					<a href="${ctx}/weixin/weixinMessage/push?id=${weixinMessage.id}&accountId=${weixinMessage.accountId}">推送</a>
    				<a href="${ctx}/weixin/weixinMessage/form?id=${weixinMessage.id}">修改</a>
					<a href="${ctx}/weixin/weixinMessage/delete?id=${weixinMessage.id}" onclick="return confirmx('确认要删除该微信推送信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>