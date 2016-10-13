<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信粉丝同步</title>
	<meta name="decorator" content="default"/>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/weixin/weixinFans/">微信粉丝列表</a></li>
		<shiro:hasPermission name="weixin:weixinFans:edit"><li><a href="${ctx}/weixin/weixinFans/form">微信粉丝添加</a></li></shiro:hasPermission>
		<shiro:hasPermission name="weixin:weixinFans:edit"><li  class="active"><a href="${ctx}/weixin/weixinFans/toSync">微信粉丝同步</a></li></shiro:hasPermission>

	</ul>
	<div class="controls clearfix" style="padding-left: 15px;padding-top: 15px;">
		<form:form modelAttribute="weixinFans" action="${ctx}/weixin/weixinFans/sync">
			<sys:message content="${message}"/>
			<form:select path="accountId" class="input-xlarge required">
				<form:option value="" label=""/>
				<form:options items="${weixinAccountList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
			</form:select>
			<span class="help-inline"><font color="red">*</font> </span>
			<input id="syncButton" class="btn btn-primary" type="submit" value="同步"/>
		</form:form>
	</div>
</body>
</html>