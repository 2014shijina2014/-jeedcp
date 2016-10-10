<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>生成方案管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/gen/genScheme/">生成方案列表</a></li>
    <shiro:hasPermission name="gen:genScheme:edit">
        <li><a href="${ctx}/gen/genScheme/form">生成方案添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="genScheme" action="${ctx}/gen/genScheme/" method="post"
           class="row form-horizontal well" role="form">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <div class="form-group col-sm-4">
        <label class="col-sm-4 control-label">方案名称：</label>
        <div class="col-sm-8">
            <form:input path="name" htmlEscape="false" maxlength="50" class="form-control"/>
        </div>
    </div>
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-hover">
    <thead>
    <tr>
        <td>方案名称</td>
        <td>生成模块</td>
        <td>模块名</td>
        <td>功能名</td>
        <td>功能作者</td>
        <shiro:hasPermission name="gen:genScheme:edit">
            <td>操作</td>
        </shiro:hasPermission></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="genScheme">
        <tr>
            <td><a href="${ctx}/gen/genScheme/form?id=${genScheme.id}">${genScheme.name}</a></td>
            <td>${genScheme.packageName}</td>
            <td>${genScheme.moduleName}${not empty genScheme.subModuleName?'.':''}${genScheme.subModuleName}</td>
            <td>${genScheme.functionName}</td>
            <td>${genScheme.functionAuthor}</td>
            <shiro:hasPermission name="gen:genScheme:edit">
                <td>
                    <a href="${ctx}/gen/genScheme/form?id=${genScheme.id}">修改</a>
                    <a href="${ctx}/gen/genScheme/delete?id=${genScheme.id}"
                       onclick="return confirmx('确认要删除该生成方案吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
</body>
</html>
