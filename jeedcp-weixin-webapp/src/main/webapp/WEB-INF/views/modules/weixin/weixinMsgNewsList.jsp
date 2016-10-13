<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信图文管理</title>
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
		<li class="active"><a href="${ctx}/weixin/weixinMsgNews/">微信图文列表</a></li>
		<shiro:hasPermission name="weixin:weixinMsgNews:edit"><li><a href="${ctx}/weixin/weixinMsgNews/form">微信图文添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="weixinMsgNews" action="${ctx}/weixin/weixinMsgNews/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>作者：</label>
				<form:input path="author" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>简介：</label>
				<form:input path="brief" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>关键词：</label>
				<form:input path="baseId" htmlEscape="false" maxlength="64" class="input-medium"/>
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
				<th>关键词</th>
				<th>作者</th>
				<th>简介</th>

				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="weixin:weixinMsgNews:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="weixinMsgNews">
			<tr>
				<td><a href="${ctx}/weixin/weixinMsgNews/form?id=${weixinMsgNews.id}">
					${weixinMsgNews.title}
				</a></td>
				<td>
						${weixinMsgNews.baseName}
				</td>
				<td>
					${weixinMsgNews.author}
				</td>
				<td>
					${weixinMsgNews.brief}
				</td>

				<td>
					<fmt:formatDate value="${weixinMsgNews.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${weixinMsgNews.remarks}
				</td>
				<shiro:hasPermission name="weixin:weixinMsgNews:edit"><td>
    				<a href="${ctx}/weixin/weixinMsgNews/form?id=${weixinMsgNews.id}">修改</a>
					<a href="${ctx}/weixin/weixinMsgNews/delete?id=${weixinMsgNews.id}" onclick="return confirmx('确认要删除该微信图文吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>