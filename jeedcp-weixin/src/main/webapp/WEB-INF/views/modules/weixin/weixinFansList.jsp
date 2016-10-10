<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信粉丝管理</title>
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
		<li class="active"><a href="${ctx}/weixin/weixinFans/">微信粉丝列表</a></li>
		<shiro:hasPermission name="weixin:weixinFans:edit"><li><a href="${ctx}/weixin/weixinFans/form">微信粉丝添加</a></li></shiro:hasPermission>
		<shiro:hasPermission name="weixin:weixinFans:edit"><li><a href="${ctx}/weixin/weixinFans/toSync">微信粉丝同步</a></li></shiro:hasPermission>
		<%--<li class="btns"><input id="syncButton" class="btn btn-primary" type="button" value="同步"/></li>--%>
	</ul>
	<form:form id="searchForm" modelAttribute="weixinFans" action="${ctx}/weixin/weixinFans/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>所属公众号：</label>
				<form:input path="accountId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>openid：</label>
				<form:input path="openid" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>关注状态：</label>
				<form:input path="subscribestatus" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>昵称：</label>
				<form:input path="nickname" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>性别：</label>
				<form:input path="gender" htmlEscape="false" maxlength="4" class="input-medium"/>
			</li>
			<li><label>国家：</label>
				<form:input path="country" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>省：</label>
				<form:input path="province" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>市：</label>
				<form:input path="city" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>微信ID：</label>
				<form:input path="wxid" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>

			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>头像</th>
				<th>昵称</th>
				<th>所属公众号</th>
				<th>openid</th>
				<th>关注状态</th>
				<th>性别</th>
				<th>国家</th>
				<th>省</th>
				<th>市</th>

				<shiro:hasPermission name="weixin:weixinFans:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="weixinFans">
			<tr>
				<td><a href="${ctx}/weixin/weixinFans/form?id=${weixinFans.id}">
					<img  width="30px" height="30px" src="${weixinFans.headimgurl}"/>
				</a></td>
				<td><a href="${ctx}/weixin/weixinFans/form?id=${weixinFans.id}">
						${weixinFans.nicknameStr}
				</a></td>
				<td>
					${weixinFans.accountName}
				</td>
				<td>
					${weixinFans.openid}
				</td>
				<td>
					${weixinFans.subscribestatus}
				</td>

				<td>
					${weixinFans.gender}
				</td>
				<td>
					${weixinFans.country}
				</td>
				<td>
					${weixinFans.province}
				</td>
				<td>
					${weixinFans.city}
				</td>

				<shiro:hasPermission name="weixin:weixinFans:edit"><td>
    				<a href="${ctx}/weixin/weixinFans/form?id=${weixinFans.id}">修改</a>
					<a href="${ctx}/weixin/weixinFans/delete?id=${weixinFans.id}" onclick="return confirmx('确认要删除该微信粉丝吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	<script type="text/javascript">
		jQuery.ajaxSetup({cache:false});
		var weixinfans = (function($){
			'use strict';
			var _eventBind = function(){
				$('#syncButton').on('click',function () {
					window.location.href = "${ctx}/weixin/weixinFans/sync";
				});
			};
			var init=function(){
				_eventBind();
			};
			var module = {};
			module.init = init;
			return module;

		})(jQuery);

		weixinfans.init();

	</script>
</body>
</html>