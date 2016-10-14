<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信菜单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")){
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
		<li><a href="${ctx}/weixin/weixinMenu/">微信菜单列表</a></li>
		<li class="active"><a href="${ctx}/weixin/weixinMenu/form?id=${weixinMenu.id}&parent.id=${weixinMenuparent.id}">微信菜单<shiro:hasPermission name="weixin:weixinMenu:edit">${not empty weixinMenu.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="weixin:weixinMenu:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="weixinMenu" action="${ctx}/weixin/weixinMenu/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">菜单类型：</label>
			<div class="controls">
				<form:input path="mtype" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				消息：点击菜单时回复消息(click)；链接：点击菜单打开链接(view)
			</div>
		</div>
		<%--<div class="control-group">
			<label class="control-label">事件类型：</label>
			<div class="controls">
				<form:input path="eventtype" htmlEscape="false" maxlength="255" class="input-xlarge "/>
				关键字(key),指定（fix）
			</div>
		</div>--%>
		<div class="control-group">
			<label class="control-label">关键字：</label>
			<div class="controls">
				<form:input path="inputcode" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">URL：</label>
			<div class="controls">
				<form:input path="url" htmlEscape="false" maxlength="255" class="input-xlarge "/>
				如果是view类型的，则一定要以http://开头，否则会创建不成功。
			</div>
		</div>
		<%--<div class="control-group">
			<label class="control-label">图片地址：</label>
			<div class="controls">
				<form:input path="picpath" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>--%>
		<div class="control-group">
			<label class="control-label">排序：</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="255" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上级父ID:</label>
			<div class="controls">
				<sys:treeselect id="parent" name="parent.id" value="${weixinMenu.parent.id}" labelName="parent.name" labelValue="${weixinMenu.parent.name}"
					title="父ID" url="/weixin/weixinMenu/treeData" extId="${weixinMenu.id}" cssClass="" allowClear="true"/>
			</div>
		</div>
		<%--<div class="control-group">
			<label class="control-label">msgId：</label>
			<div class="controls">
				<form:input path="msgId" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>--%>
		<div class="control-group">
			<label class="control-label">所属组：</label>
			<div class="controls">
				<%--<form:input path="groupId" htmlEscape="false" maxlength="255" class="input-xlarge "/>--%>
				<form:select path="groupId" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${weixinMenuGroupList}" itemLabel="name" itemValue="id" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="weixin:weixinMenu:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>