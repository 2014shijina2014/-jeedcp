<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信关键词生管理</title>
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
		<li class="active"><a href="${ctx}/weixin/weixinMsgBase/">微信关键词生列表</a></li>
		<shiro:hasPermission name="weixin:weixinMsgBase:edit"><li><a href="${ctx}/weixin/weixinMsgBase/form">微信关键词生添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="weixinMsgBase" action="${ctx}/weixin/weixinMsgBase/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>微信账号ID：</label>
				<form:input path="accountId" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>文本类型：</label>
				<form:select path="msgtype" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('weixin_text_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>关键字：</label>
				<form:input path="inputcode" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>规则：</label>
				<form:input path="rule" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>状态：</label>
				<form:input path="enable" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>发送数量：</label>
				<form:input path="readcount" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>关注数量：</label>
				<form:input path="favourcount" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>

				<th>名称</th>
				<th>微信账号</th>
				<th>文本类型</th>
				<th>关键字</th>
				<th>规则</th>
				<th>状态</th>
				<th>发送数量</th>
				<th>关注数量</th>

				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="weixin:weixinMsgBase:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="weixinMsgBase">
			<tr>
				<td><a href="${ctx}/weixin/weixinMsgBase/form?id=${weixinMsgBase.id}">
					${weixinMsgBase.name}
				</a></td>
				<td>
					${weixinMsgBase.accountName}
				</td>
				<td>
					${fns:getDictLabel(weixinMsgBase.msgtype, 'weixin_text_type', '')}
				</td>
				<td>
					${weixinMsgBase.inputcode}
				</td>
				<td>
					${weixinMsgBase.rule}
				</td>
				<td>
					${weixinMsgBase.enable}
				</td>
				<td>
					${weixinMsgBase.readcount}
				</td>
				<td>
					${weixinMsgBase.favourcount}
				</td>

				<td>
					<fmt:formatDate value="${weixinMsgBase.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${weixinMsgBase.remarks}
				</td>
				<shiro:hasPermission name="weixin:weixinMsgBase:edit"><td>
    				<a href="${ctx}/weixin/weixinMsgBase/form?id=${weixinMsgBase.id}">修改</a>
					<a href="${ctx}/weixin/weixinMsgBase/delete?id=${weixinMsgBase.id}" onclick="return confirmx('确认要删除该微信关键词生吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>