<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(document).ready(function() {
			$("#no").focus();
			validateForm = $("#inputForm").validate({
				rules: {
					loginName: {remote: "${ctx}/sys/user/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')}//设置了远程验证，在初始化时必须预先调用一次。
				},
				messages: {
					loginName: {remote: "用户登录名已存在"},
					confirmNewPassword: {equalTo: "输入与上面相同的密码"}
				},
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

			//在ready函数中预先调用一次远程校验函数，是一个无奈的回避案。(刘高峰）
			//否则打开修改对话框，不做任何更改直接submit,这时再触发远程校验，耗时较长，
			//submit函数在等待远程校验结果然后再提交，而layer对话框不会阻塞会直接关闭同时会销毁表单，因此submit没有提交就被销毁了导致提交表单失败。
			$("#inputForm").validate().element($("#loginName"));
		});

	
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td class="width-15 active">	<label class="pull-right"><font color="red">*</font>头像：</label></td>
		         <td class="width-35"><form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
						<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/></td>
		         <td  class="width-15"  class="active">	<label class="pull-right"><font color="red">*</font>归属公司:</label></td>
		         <td class="width-35"><sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}"
						title="公司" url="/sys/office/treeData?type=1" cssClass="form-control required"/></td>
		      </tr>
		      
		      <tr>
		         <td class="active"><label class="pull-right"><font color="red">*</font>归属部门:</label></td>
		         <td><sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="form-control required" notAllowSelectParent="true"/></td>
		         <td class="active"><label class="pull-right"><font color="red">*</font>工号:</label></td>
		         <td><form:input path="no" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		      </tr>
		      
		      <tr>
		         <td class="active"><label class="pull-right"><font color="red">*</font>姓名:</label></td>
		         <td><form:input path="name" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		         <td class="active"><label class="pull-right"><font color="red">*</font>登录名:</label></td>
		         <td><input id="oldLoginName" name="oldLoginName" type="hidden" value="${user.loginName}">
					 <form:input path="loginName" htmlEscape="false" maxlength="50" class="form-control required userName"/></td>
		      </tr>
		      
		      
		      <tr>
		         <td class="active"><label class="pull-right"><c:if test="${empty user.id}"><font color="red">*</font></c:if>密码:</label></td>
		         <td><input id="newPassword" name="newPassword" type="password" value="" maxlength="50" minlength="3" class="form-control ${empty user.id?'required':''}"/>
					<c:if test="${not empty user.id}"><span class="help-inline">若不修改密码，请留空。</span></c:if></td>
		         <td class="active"><label class="pull-right"><c:if test="${empty user.id}"><font color="red">*</font></c:if>确认密码:</label></td>
		         <td><input id="confirmNewPassword" name="confirmNewPassword" type="password"  class="form-control ${empty user.id?'required':''}" value="" maxlength="50" minlength="3" equalTo="#newPassword"/></td>
		      </tr>
		      
		       <tr>
		         <td class="active"><label class="pull-right">邮箱:</label></td>
		         <td><form:input path="email" htmlEscape="false" maxlength="100" class="form-control email"/></td>
		         <td class="active"><label class="pull-right">电话:</label></td>
		         <td><form:input path="phone" htmlEscape="false" maxlength="100" class="form-control"/></td>
		      </tr>
		      
		      <tr>
		         <td class="active"><label class="pull-right">手机:</label></td>
		         <td><form:input path="mobile" htmlEscape="false" maxlength="100" class="form-control"/></td>
		         <td class="active"><label class="pull-right">是否允许登录:</label></td>
		         <td><form:select path="loginFlag"  class="form-control">
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select></td>
		      </tr>
		      
		      <tr>
		         <td class="active"><label class="pull-right">用户类型:</label></td>
		         <td><form:select path="userType"  class="form-control">
					<form:option value="" label="请选择"/>
						<form:options items="${fns:getDictList('sys_user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select></td>
		         <td class="active"><label class="pull-right"><font color="red">*</font>用户角色:</label></td>
		         <td>
		         	<form:checkboxes path="roleIdList" items="${allRoles}" itemLabel="name" itemValue="id" htmlEscape="false" cssClass="i-checks required"/>
		         	<label id="roleIdList-error" class="error" for="roleIdList"></label>
		         </td>
		      </tr>
		      
		       <tr>
		         <td class="active"><label class="pull-right">备注:</label></td>
		         <td><form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control"/></td>
		         <td class="active"><label class="pull-right"></label></td>
		         <td></td>
		      </tr>
		      
		      <c:if test="${not empty user.id}">
		       <tr>
		         <td class=""><label class="pull-right">创建时间:</label></td>
		         <td><span class="lbl"><fmt:formatDate value="${user.createDate}" type="both" dateStyle="full"/></span></td>
		         <td class=""><label class="pull-right">最后登陆:</label></td>
		         <td><span class="lbl">IP: ${user.loginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${user.loginDate}" type="both" dateStyle="full"/></span></td>
		      </tr>
		     </c:if>
		      
	</form:form>
</body>
</html>