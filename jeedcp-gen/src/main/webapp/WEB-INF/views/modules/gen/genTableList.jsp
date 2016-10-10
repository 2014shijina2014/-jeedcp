<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>业务表管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            if (n) $("#pageNo").val(n);
            if (s) $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>


<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/gen/genTable/">业务表列表</a></li>
    <shiro:hasPermission name="gen:genTable:edit">
        <li><a href="${ctx}/gen/genTable/form">业务表添加</a></li>
    </shiro:hasPermission>
</ul>
<sys:message content="${message}"/>
<form:form id="searchForm" modelAttribute="genTable" action="${ctx}/gen/genTable/" method="post"
           class="row form-horizontal well" role="form">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>

    <div class="form-group col-sm-4">
        <label class="col-sm-4 control-label">表名：</label>
        <div class="col-sm-8">
            <form:input path="nameLike" htmlEscape="false" maxlength="50" class="form-control"/>
        </div>
    </div>
    <div class="form-group col-sm-4">
        <label class="col-sm-4 control-label">说明：</label>
        <div class="col-sm-8">
            <form:input path="comments" htmlEscape="false" maxlength="50" class="form-control"/>
        </div>
    </div>
    <div class="form-group col-sm-4">
        <label class="col-sm-4 control-label">父表表名：</label>
        <div class="col-sm-8">
            <form:input path="parentTable" htmlEscape="false" maxlength="50" class="form-control"/>
        </div>
    </div>
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
</form:form>

<table id="contentTable" class="table table-hover">
    <thead>
    <tr>
        <td class="sort-column name">表名</td>
        <td>说明</td>
        <td class="sort-column class_name">类名</td>
        <td class="sort-column parent_table">父表</td>
        <shiro:hasPermission name="gen:genTable:edit">
            <td>操作</td>
        </shiro:hasPermission></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="genTable">
        <tr>
            <td><a href="${ctx}/gen/genTable/form?id=${genTable.id}">${genTable.name}</a></td>
            <td>${genTable.comments}</td>
            <td>${genTable.className}</td>
            <td title="点击查询子表"><a href="javascript:"
                                  onclick="$('#parentTable').val('${genTable.parentTable}');$('#searchForm').submit();">${genTable.parentTable}</a>
            </td>
            <shiro:hasPermission name="gen:genTable:edit">
                <td>
                    <a href="${ctx}/gen/genTable/form?id=${genTable.id}">修改</a>
                    <a href="${ctx}/gen/genTable/delete?id=${genTable.id}"
                       onclick="return confirmx('确认要删除该业务表吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
</body>
</html>
