<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>通知管理</title>
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
    <li class="active"><a href="${ctx}/oa/oaNotify/${oaNotify.self?'self':''}">通知列表</a></li>
    <c:if test="${!oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit">
        <li><a href="${ctx}/oa/oaNotify/form">通知添加</a></li>
    </shiro:hasPermission></c:if>
</ul>
<form:form id="searchForm" modelAttribute="oaNotify"
           action="${ctx}/oa/oaNotify/${oaNotify.self?'self':''}" method="post"
           class="row form-horizontal well" role="form">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <div class="form-group col-sm-4">
        <label class="col-sm-4 control-label">标题：</label>
        <div class="col-sm-8">
            <form:input path="title" htmlEscape="false" maxlength="200" class="form-control"/>
        </div>
    </div>

    <div class="form-group col-sm-4">
        <label class="col-sm-4 control-label">类型：</label>
        <div class="col-sm-8">

            <form:select path="type" class="form-control">
                <form:option value="" label=""/>
                <form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <c:if test="${!requestScope.oaNotify.self}">
        <div class="form-group col-sm-4">
            <label class="col-sm-4 control-label">状态：</label>
            <div class="col-sm-8">
                <form:radiobuttons path="status" items="${fns:getDictList('oa_notify_status')}" itemLabel="label"
                                   itemValue="value" htmlEscape="false"/>
            </div>
        </div>
    </c:if>
    <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>

</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-hover">
    <thead>
    <tr>
        <th>标题</th>
        <th>类型</th>
        <th>状态</th>
        <th>查阅状态</th>
        <th>更新时间</th>
        <c:if test="${!oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit">
            <th>操作</th>
        </shiro:hasPermission></c:if>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="oaNotify">
        <tr>
            <td><a href="${ctx}/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id}">
                    ${fns:abbr(oaNotify.title,50)}
            </a></td>
            <td>
                    ${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}
            </td>
            <td>
                    ${fns:getDictLabel(oaNotify.status, 'oa_notify_status', '')}
            </td>
            <td>
                <c:if test="${requestScope.oaNotify.self}">
                    ${fns:getDictLabel(oaNotify.readFlag, 'oa_notify_read', '')}
                </c:if>
                <c:if test="${!requestScope.oaNotify.self}">
                    ${oaNotify.readNum} / ${oaNotify.readNum + oaNotify.unReadNum}
                </c:if>
            </td>
            <td>
                <fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <c:if test="${!requestScope.oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit">
                <td>
                    <a href="${ctx}/oa/oaNotify/form?id=${oaNotify.id}" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>修改</a>
                    <a href="${ctx}/oa/oaNotify/delete?id=${oaNotify.id}"
                       onclick="return confirmx('确认要删除该通知吗？', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除删除</a>
                </td>
            </shiro:hasPermission></c:if>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
</body>
</html>