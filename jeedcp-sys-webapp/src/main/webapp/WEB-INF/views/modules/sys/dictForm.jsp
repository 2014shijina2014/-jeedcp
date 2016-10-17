<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>字典管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/adminlte.jsp" %>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/sys/dict/">字典列表</a></li>
    <li class="active"><a href="${ctx}/sys/dict/form?id=${dict.id}">字典
        <shiro:hasPermission name="sys:dict:edit">${not empty dict.id?'修改':'添加'}</shiro:hasPermission>
        <shiro:lacksPermission name="sys:dict:edit">查看</shiro:lacksPermission></a>
    </li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="dict"
           action="${ctx}/sys/dict/save" method="post" role="form"
           class="col-md-6">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="form-group">
        <label class="control-label">键值:</label>
        <form:input path="value" htmlEscape="false" class="form-control required"/>
    </div>
    <div class="form-group">
        <label class="control-label">标签:</label>
        <form:input path="label" htmlEscape="false" class="form-control required"/>
    </div>
    <div class="form-group">
        <label class="control-label">类型:</label>
        <div class="controls">
            <form:input path="type" htmlEscape="false" class="required abc form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label">描述:</label>
        <div class="controls">
            <form:input path="description" htmlEscape="false" class="required form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label">排序:</label>
        <div class="controls">
            <form:input path="sort" htmlEscape="false" class="required digits form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="3" class="input-xlarge form-control"/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="sys:dict:edit">
            <input id="btnSubmit" class="btn btn-primary"
                   type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>

<script type="text/javascript">
    $(document).ready(function () {
        $("#value").focus();
        $("#inputForm").validate({
            submitHandler: function (form) {
                loading('正在提交，请稍等...');
                form.submit();
            },
            errorContainer: "#messageBox",
            errorPlacement: function (error, element) {
                $("#messageBox").text("输入有误，请先更正。");
                if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                    error.appendTo(element.parent().parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });
    });
</script>
</body>
</html>