<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>站点管理</title>
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
    <li class="active"><a href="${ctx}/cms/site/">站点列表</a></li>
    <shiro:hasPermission name="cms:site:edit">
        <li><a href="${ctx}/cms/site/form">站点添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="site" action="${ctx}/cms/site/" method="post"
           class="col-md-12 form-horizontal well">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <div class="row">
        <div class="form-group col-sm-4">
            <label class="col-sm-4 control-label">名称：</label>
            <div class="col-sm-8">
                <form:input path="name" htmlEscape="false" maxlength="50" class="form-control"/>
            </div>
        </div>
        <div class="form-group col-sm-4">
            <label class="col-sm-4 control-label">状态：</label>
            <div class="col-sm-8">
                <form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag"
                                   items="${fns:getDictList('del_flag')}" itemLabel="label"
                                   itemValue="value"
                                   htmlEscape="false"/>
            </div>
        </div>
        <div class="form-group col-sm-4">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
        </div>
    </div>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-hover">
    <thead>
    <tr>
        <td>名称</td>
        <td>标题</td>
        <td>描述</td>
        <td>关键字</td>
        <td>主题</td>
        <shiro:hasPermission name="cms:site:edit">
            <td>操作</td>
        </shiro:hasPermission></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="site">
        <tr>
            <td><a href="${ctx}/cms/site/form?id=${site.id}" title="${site.name}">${fns:abbr(site.name,40)}</a></td>
            <td>${fns:abbr(site.title,40)}</td>
            <td>${fns:abbr(site.description,40)}</td>
            <td>${fns:abbr(site.keywords,40)}</td>
            <td>${site.theme}</td>
            <shiro:hasPermission name="cms:site:edit">
                <td>
                    <a href="${ctx}/cms/site/form?id=${site.id}">修改</a>
                    <a href="${ctx}/cms/site/delete?id=${site.id}${site.delFlag ne 0?'&isRe=true':''}"
                       onclick="return confirmx('确认要${site.delFlag ne 0?'恢复':''}删除该站点吗？', this.href)">${site.delFlag ne 0?'恢复':''}删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
</body>
</html>