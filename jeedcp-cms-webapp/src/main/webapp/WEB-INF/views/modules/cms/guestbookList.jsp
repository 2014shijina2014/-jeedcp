<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>留言管理</title>
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
    <li class="active"><a href="${ctx}/cms/guestbook/">留言列表</a></li>
    <%--
            <shiro:hasPermission name="cms:guestbook:edit"><li><a href="${ctx}/cms/guestbook/form?id=${guestbook.id}">留言添加</a></li></shiro:hasPermission> --%>
</ul>
<form:form id="searchForm" modelAttribute="guestbook" action="${ctx}/cms/guestbook/" method="post"
           class="row form-horizontal well" role="form">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <div class="row">
        <div class="form-group col-sm-4">
            <label class="col-sm-4 control-label">分类：</label>
            <div class="col-sm-8">
                <form:select id="type" path="type" class="form-control"><form:option value=""
                                                                                    label=""/><form:options
                        items="${fns:getDictList('cms_guestbook')}" itemValue="value" itemLabel="label"
                        htmlEscape="false"/></form:select>
            </div>
        </div>
        <div class="form-group col-sm-4">
            <label class="col-sm-4 control-label">内容 ：</label>
            <div class="col-sm-8">
                <form:input path="content" htmlEscape="false" maxlength="50" class="form-control"/>
            </div>
        </div>
        <div class="form-group col-sm-4">
            <label class="col-sm-4 control-label">状态：</label>
            <div class="col-sm-8">
                <form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag"
                                   items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value"
                                   htmlEscape="false"/>
            </div>
        </div>
        <div class="row col-sm-offset-9">
            &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
        </div>
    </div>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-hover">
    <thead>
    <tr>
        <td>留言分类</td>
        <td>留言内容</td>
        <td>留言人</td>
        <td>留言时间</td>
        <td>回复人</td>
        <td>回复内容</td>
        <td>回复时间</td>
        <shiro:hasPermission name="cms:guestbook:edit">
            <td>操作</td>
        </shiro:hasPermission></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="guestbook">
        <tr>
            <td>${fns:getDictLabel(guestbook.type, 'cms_guestbook', '无分类')}</td>
            <td><a href="${ctx}/cms/guestbook/form?id=${guestbook.id}">${fns:abbr(guestbook.content,40)}</a></td>
            <td>${guestbook.name}</td>
            <td><fmt:formatDate value="${guestbook.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${guestbook.reUser.name}</td>
            <td>${fns:abbr(guestbook.reContent,40)}</td>
            <td><fmt:formatDate value="${guestbook.reDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <shiro:hasPermission name="cms:guestbook:edit">
                <td>
                    <c:if test="${guestbook.delFlag ne '2'}"><a
                            href="${ctx}/cms/guestbook/delete?id=${guestbook.id}${guestbook.delFlag ne 0?'&isRe=true':''}"
                            onclick="return confirmx('确认要${guestbook.delFlag ne 0?'恢复审核':'删除'}该留言吗？', this.href)">${guestbook.delFlag ne 0?'恢复审核':'删除'}</a></c:if>
                    <c:if test="${guestbook.delFlag eq '2'}"><a
                            href="${ctx}/cms/guestbook/form?id=${guestbook.id}">审核</a></c:if>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
</body>
</html>