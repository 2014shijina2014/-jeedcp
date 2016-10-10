<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信接收信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/weixin/weixinReceiveText/">微信接收信息列表</a></li>
		<li class="active"><a href="${ctx}/weixin/weixinReceiveText/form?id=${weixinReceiveText.id}">微信接收信息<shiro:hasPermission name="weixin:weixinReceiveText:edit">${not empty weixinReceiveText.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="weixin:weixinReceiveText:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="weixinReceiveText" action="${ctx}/weixin/weixinReceiveText/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="controls">
				<form:input path="content" htmlEscape="false"   class="input-xlarge  "/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">fromusername：</label>
			<div class="controls">
				<form:input path="fromusername" htmlEscape="false"  class="input-xlarge  "/>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">msgid：</label>
			<div class="controls">
				<form:input path="msgid" htmlEscape="false"   class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">msgtype：</label>
			<div class="controls">
				<form:input path="msgtype" htmlEscape="false"   class="input-xlarge "/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">response：</label>
			<div class="controls">
				<form:input path="response" htmlEscape="false"   class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">tousername：</label>
			<div class="controls">
				<form:input path="tousername" htmlEscape="false"   class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公众账号：</label>
			<div class="controls">
				<form:input path="accountName" htmlEscape="false"   class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">nickname：</label>
			<div class="controls">
				<form:input path="nickname" htmlEscape="false"   class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">回复内容：</label>
			<div class="controls">
				<form:textarea path="rescontent" htmlEscape="false" rows="8"   class="input-xxlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<%--<shiro:hasPermission name="weixin:weixinReceiveText:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>--%>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>