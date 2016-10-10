<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>字典管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
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
    <li class="active"><a href="${ctx}/sys/dict/">字典列表</a></li>
    <shiro:hasPermission name="sys:dict:edit">
        <li><a href="${ctx}/sys/dict/form?sort=10">字典添加</a></li>
    </shiro:hasPermission>
</ul>
<sys:message content="${message}"/>
<form:form id="searchForm" modelAttribute="dict" action="${ctx}/sys/dict/"
           method="post" class="row well form-horizontal" role="form">
    <sys:postPageInput/>

    <div class="col-sm-4 form-group">
        <label class="col-sm-4 control-label">类型：</label>
        <div class="col-sm-8">
            <form:select id="type" path="type" class="form-control ">
                <form:option value="" label="全部字典"/>
                <form:options items="${typeList}" htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="col-sm-4 form-group">
        <label class="col-sm-4 control-label">描述 ：</label>
        <div class="col-sm-8">
            <form:input path="description" htmlEscape="false" class="form-control"/>
        </div>
    </div>
    <div class="col-sm-4 form-group">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
    </div>
</form:form>

<table id="contentTable" class="table table-hover">
    <thead>
    <tr>
        <td>键值</td>
        <td>标签</td>
        <td>类型</td>
        <td>描述</td>
        <td>排序</td>
        <shiro:hasPermission name="sys:dict:edit">
            <td>操作</td>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="dict">
        <tr>
            <td>${dict.value}</td>
            <td><a href="${ctx}/sys/dict/form?id=${dict.id}">${dict.label}</a></td>
            <td><a href="javascript:"
                   onclick="$('#type').val('${dict.type}');$('#searchForm').submit();return false;">${dict.type}</a>
            </td>
            <td>${dict.description}</td>
            <td>${dict.sort}</td>
            <shiro:hasPermission name="sys:dict:edit">
                <td>
                    <a href="${ctx}/sys/dict/form?id=${dict.id}">修改</a>
                    <a href="${ctx}/sys/dict/delete?id=${dict.id}&type=${dict.type}"
                       onclick="return confirmx('确认要删除该字典吗？', this.href)">删除</a>
                    <a href="<c:url value='${fns:getAdminPath()}/sys/dict/form?type=${dict.type}&sort=${dict.sort+10}'><c:param name='description' value='${dict.description}'/></c:url>">添加键值</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--<div class="box-tools">${page}</div>--%>
<sys:page httptype="post" formId="searchForm"/>
</body>
</html>