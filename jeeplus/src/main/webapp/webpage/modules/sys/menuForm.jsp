<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>菜单管理</title>
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
			$("#name").focus();
			validateForm = $("#inputForm").validate({
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
	<form:form id="inputForm" modelAttribute="menu" action="${ctx}/sys/menu/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">上级菜单:</label></td>
		         <td class="width-35" ><sys:treeselect id="menu" name="parent.id" value="${menu.parent.id}" labelName="parent.name" labelValue="${menu.parent.name}"
					title="菜单" url="/sys/menu/treeData" extId="${menu.id}" cssClass="form-control required"/></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font> 名称:</label></td>
		         <td  class="width-35" ><form:input path="name" htmlEscape="false" maxlength="50" class="required form-control "/></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">链接:</label></td>
		         <td class="width-35" ><form:input path="href" htmlEscape="false" maxlength="2000" class="form-control "/>
					<span class="help-inline">点击菜单跳转的页面</span></td>
		         <td  class="width-15 active"><label class="pull-right">目标:</label></td>
		         <td  class="width-35" ><form:input path="target" htmlEscape="false" maxlength="10" class="form-control "/>
					<span class="help-inline">链接打开的目标窗口，默认：mainFrame</span></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">图标:</label></td>
		         <td class="width-35" ><sys:iconselect id="icon" name="icon" value="${menu.icon}"/></td>
		         <td  class="width-15 active"><label class="pull-right">排序:</label></td>
		         <td  class="width-35" ><form:input path="sort" htmlEscape="false" maxlength="50" class="required digits form-control "/>
					<span class="help-inline">排列顺序，升序。</span></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">可见:</label></td>
		         <td class="width-35" ><form:radiobuttons path="isShow" items="${fns:getDictList('show_hide')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required i-checks "/>
					<span class="help-inline">该菜单或操作是否显示到系统菜单中</span></td>
		         <td  class="width-15 active"><label class="pull-right">权限标识:</label></td>
		         <td  class="width-35" ><form:input path="permission" htmlEscape="false" maxlength="100" class="form-control "/>
					<span class="help-inline">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</span></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">备注:</label></td>
		         <td class="width-35" ><form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control "/></td>
		         <td  class="width-15 active"><label class="pull-right"></label></td>
		         <td  class="width-35" ></td>
		      </tr>
		    </tbody>
		  </table>
	</form:form>
</body>
</html>