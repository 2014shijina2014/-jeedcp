<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
    <title>生成代码</title>
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
<form:form id="inputForm" modelAttribute="genScheme" action="${ctx}/gen/genTable/genCode" method="post" class="form-horizontal">
    <form:hidden path="id" value="${genScheme.id}"/>
    <sys:message content="${message}"/>
    <div class="control-group">
    </div>
    <div class="control-group">
        <label class="control-label"><font color="red">*</font>代码风格:</label>
        <div class="controls">
            <form:select path="category" class="required form-control">
                <form:options items="${config.categoryList}" itemLabel="label" itemValue="value" htmlEscape="false"/>
            </form:select>
				<span class="help-inline">
					生成结构：{包名}/{模块名}/{分层(dao,entity,service,web)}/{子模块名}/{java类}
				</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label"><font color="red">*</font>生成包路径:</label>
        <div class="controls">
            <form:input path="packageName" htmlEscape="false" maxlength="500" class="required form-control"/>
            <span class="help-inline">建议模块包：com.jeedcp.modules</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label"><font color="red">*</font>生成模块名:</label>
        <div class="controls">
            <form:input path="moduleName" htmlEscape="false" maxlength="500" class="required form-control"/>
            <span class="help-inline">可理解为子系统名，例如 sys</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">生成子模块名:</label>
        <div class="controls">
            <form:input path="subModuleName" htmlEscape="false" maxlength="500" class="form-control"/>
            <span class="help-inline">可选，分层下的文件夹，例如 </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label"><font color="red">*</font>生成功能描述:</label>
        <div class="controls">
            <form:input path="functionName" htmlEscape="false" maxlength="500" class="required form-control"/>
            <span class="help-inline">将设置到类描述</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label"><font color="red">*</font>生成功能名:</label>
        <div class="controls">
            <form:input path="functionNameSimple" htmlEscape="false" maxlength="500" class="required form-control"/>
            <span class="help-inline">用作功能提示，如：保存“某某”成功</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label"><font color="red">*</font>生成功能作者:</label>
        <div class="controls">
            <form:input path="functionAuthor" htmlEscape="false" maxlength="500" class="required form-control"/>
            <span class="help-inline">功能开发者</span>
        </div>
    </div>

    <input type="hidden" name="genTable.id" value="${genScheme.genTable.id}"/>
    <!--
    <div class="control-group">
    <label class="control-label"><font color="red">*</font>业务表名:</label>
    <div class="controls">
    <form:select path="genTable.id" class="required form-control">
        <form:options items="${tableList}" itemLabel="nameAndComments" itemValue="id" htmlEscape="false"/>
    </form:select>
    <span class="help-inline">生成的数据表，一对多情况下请选择主表。</span>
    </div>
    </div>
    -->
</form:form>
</body>
</html>