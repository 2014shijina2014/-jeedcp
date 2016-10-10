<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信接收信息管理</title>
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
		<li class="active"><a href="${ctx}/weixin/weixinReceiveText/">微信接收信息列表</a></li>
		<%--<shiro:hasPermission name="weixin:weixinReceiveText:edit"><li><a href="${ctx}/weixin/weixinReceiveText/form">微信接收信息添加</a></li></shiro:hasPermission>--%>
	</ul>
	<form:form id="searchForm" modelAttribute="weixinReceiveText" action="${ctx}/weixin/weixinReceiveText/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>内容：</label>
				<form:input path="content" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>fromusername：</label>
				<form:input path="fromusername" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>msgid：</label>
				<form:input path="msgid" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>msgtype：</label>
				<form:input path="msgtype" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>回复内容：</label>
				<form:input path="rescontent" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>response：</label>
				<form:input path="response" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>tousername：</label>
				<form:input path="tousername" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>公众账号：</label>
				<form:input path="accountId" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>公众账号</th>
				<th>内容</th>
				<th>fromusername</th>
				<th>msgid</th>
				<th>msgtype</th>
				<th>tousername</th>


				<shiro:hasPermission name="weixin:weixinReceiveText:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="weixinReceiveText">
			<tr>
				<td>
						${weixinReceiveText.accountName}
				</td>
				<td><a href="${ctx}/weixin/weixinReceiveText/form?id=${weixinReceiveText.id}">
					${weixinReceiveText.content}
				</a></td>
				<td>
					${weixinReceiveText.fromusername}
				</td>
				<td>
					${weixinReceiveText.msgid}
				</td>
				<td>
					${weixinReceiveText.msgtype}
				</td>

				<td>
					${weixinReceiveText.tousername}
				</td>


				<shiro:hasPermission name="weixin:weixinReceiveText:edit"><td>
					<a href="${ctx}/weixin/weixinReceiveText/form?id=${weixinReceiveText.id}">查看</a>
					<a href="${ctx}/weixin/weixinReceiveText/delete?id=${weixinReceiveText.id}" onclick="return confirmx('确认要删除该微信接收信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>