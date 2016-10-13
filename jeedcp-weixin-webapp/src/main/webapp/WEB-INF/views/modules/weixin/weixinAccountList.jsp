<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公众账号管理管理</title>
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
		<li class="active"><a href="${ctx}/weixin/weixinAccount/">公众账号管理列表</a></li>
		<shiro:hasPermission name="weixin:weixinAccount:edit"><li><a href="${ctx}/weixin/weixinAccount/form">公众账号管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="weixinAccount" action="${ctx}/weixin/weixinAccount/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>公众帐号名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>公众帐号：</label>
				<form:input path="account" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>appid：</label>
				<form:input path="appid" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>Token：</label>
				<form:input path="token" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>公众帐号名称</th>
				<th>公众帐号</th>
				<th>appid</th>
				<th>Token</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="weixin:weixinAccount:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="weixinAccount">
			<tr>
				<td><a href="${ctx}/weixin/weixinAccount/form?id=${weixinAccount.id}">
					${weixinAccount.name}
				</a></td>
				<td>
					${weixinAccount.account}
				</td>
				<td>
					${weixinAccount.appid}
				</td>
				<td>
					${weixinAccount.token}
				</td>
				<td>
					<fmt:formatDate value="${weixinAccount.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${weixinAccount.remarks}
				</td>
				<shiro:hasPermission name="weixin:weixinAccount:edit"><td>
    				<a href="${ctx}/weixin/weixinAccount/form?id=${weixinAccount.id}">修改</a>
					<a href="${ctx}/weixin/weixinAccount/delete?id=${weixinAccount.id}" onclick="return confirmx('确认要删除该公众账号管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>