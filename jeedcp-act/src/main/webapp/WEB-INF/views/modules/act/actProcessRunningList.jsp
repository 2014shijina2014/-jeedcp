<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>运行中的流程</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        function page(n, s) {
            location = '${ctx}/act/process/running/?pageNo=' + n + '&pageSize=' + s;
        }
        function updateCategory(id, category) {
            $.jBox($("#categoryBox").html(), {
                title: "设置分类", buttons: {"关闭": true}, submit: function () {
                }
            });
            $("#categoryBoxId").val(id);
            $("#categoryBoxCategory").val(category);
        }
    </script>
    <script type="text/template" id="categoryBox">
        <form id="categoryForm" action="${ctx}/act/process/updateCategory" method="post" enctype="multipart/form-data"
              style="text-align:center;" class="row form-horizontal well" role="form"><br/>
            <input id="categoryBoxId" type="hidden" name="procDefId" value=""/>
            <div class="col-sm-3">
                <select id="categoryBoxCategory" name="category" class="form-control">
                    <c:forEach items="${fns:getDictList('act_category')}" var="dict">
                        <option value="${dict.value}">${dict.label}</option>
                    </c:forEach>
                </select>
                <br/><br/>　　
                <input id="categorySubmit" class="btn btn-primary" type="submit" value="   保    存   "/>　　
            </div>
        </form>
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/act/process/">流程管理</a></li>
    <li><a href="${ctx}/act/process/deploy/">部署流程</a></li>
    <li class="active"><a href="${ctx}/act/process/running/">运行中的流程</a></li>
</ul>
<form id="searchForm" action="${ctx}/act/process/running/" method="post" class="row form-horizontal well" role="form">
    <div class="form-group col-sm-5">
        <label class="col-sm-4 control-label">流程实例ID：</label>
        <div class="col-sm-8">
            <input type="text" id="procInsId" name="procInsId" value="${procInsId}" class="form-control"/>
        </div>
    </div>
    <div class="form-group col-sm-5">
        <label class="col-sm-4 control-label"></label>
        <div class="col-sm-8">
            <input type="text" id="procDefKey" name="procDefKey" value="${procDefKey}"
                   class="form-control"/>
        </div>
    </div>
    <div class=" col-sm-offset-9">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
    </div>
</form>
<sys:message content="${message}"/>
<table class="table table-hover">
    <thead>
    <tr>
        <td>执行ID</td>
        <td>流程实例ID</td>
        <td>流程定义ID</td>
        <td>当前环节</td>
        <td>是否挂起</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="procIns">
        <tr>
            <td>${procIns.id}</td>
            <td>${procIns.processInstanceId}</td>
            <td>${procIns.processDefinitionId}</td>
            <td>${procIns.activityId}</td>
            <td>${procIns.suspended}</td>
            <td>
                <shiro:hasPermission name="act:process:edit">
                    <a href="${ctx}/act/process/deleteProcIns?procInsId=${procIns.processInstanceId}&reason="
                       onclick="return promptx('删除流程','删除原因',this.href);">删除流程</a>
                </shiro:hasPermission>&nbsp;
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
</body>
</html>
