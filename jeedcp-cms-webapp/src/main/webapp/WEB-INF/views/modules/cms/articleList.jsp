<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>文章管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/adminlte.jsp" %>
    <script type="text/javascript">
        function viewComment(href) {
            top.$.jBox.open('iframe:' + href, '查看评论', $(top.document).width() - 220, $(top.document).height() - 120, {
                buttons: {"关闭": true},
                loaded: function (h) {
                    $(".jbox-content", top.document).css("overflow-y", "hidden");
                    $(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
                    $("body", h.find("iframe").contents()).css("margin", "10px");
                }
            });
            return false;
        }
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
    <li class="active"><a href="${ctx}/cms/article/?category.id=${article.category.id}">文章列表</a></li>
    <shiro:hasPermission name="cms:article:edit">
        <li>
            <a href="<c:url value='${fns:getAdminPath()}/cms/article/form?id=${article.id}&category.id=${article.category.id}'><c:param name='category.name' value='${article.category.name}'/></c:url>">文章添加</a>
        </li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="article" action="${ctx}/cms/article/" method="post"
           class="row form-horizontal well" role="form">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <div class="row">
        <div class="form-group col-sm-6">
            <label class="col-sm-4 control-label">栏目：</label>
            <div class="col-sm-8">
                <sys:treeselect id="category" name="category.id" value="${article.category.id}"
                                labelName="category.name" labelValue="${article.category.name}"
                                title="栏目" url="/cms/category/treeData" module="article" cssClass="form-control"
                                notAllowSelectRoot="false" />
            </div>
        </div>

        <div class="form-group col-sm-6">
            <label class="col-sm-4 control-label">标题：</label>
            <div class="col-sm-8">
                <form:input path="title" htmlEscape="false" maxlength="50" class="form-control"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-sm-6">
            <label class="col-sm-4 control-label">状态：</label>
            <div class="col-sm-8">
                <form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag"
                                   items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value"
                                   htmlEscape="false"/>
            </div>
        </div>
        <div class="col-sm-offset-10">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
        </div>
    </div>


</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-hover">
    <thead>
    <tr>
        <td>栏目</td>
        <td>标题</td>
        <td>权重</td>
        <td>点击数</td>
        <td>发布者</td>
        <td>更新时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="article">
        <tr>
            <td><a href="javascript:"
                   onclick="$('#categoryId').val('${article.category.id}');$('#categoryName').val('${article.category.name}');$('#searchForm').submit();return false;">${article.category.name}</a>
            </td>
            <td><a href="${ctx}/cms/article/form?id=${article.id}"
                   title="${article.title}">${fns:abbr(article.title,40)}</a></td>
            <td>${article.weight}</td>
            <td>${article.hits}</td>
            <td>${article.user.name}</td>
            <td><fmt:formatDate value="${article.updateDate}" type="both"/></td>
            <td>
                <a href="${pageContext.request.contextPath}${fns:getFrontPath()}/view-${article.category.id}-${article.id}${fns:getUrlSuffix()}"
                   target="_blank">访问</a>
                <shiro:hasPermission name="cms:article:edit">
                    <c:if test="${article.category.allowComment eq '1'}"><shiro:hasPermission name="cms:comment:view">
                        <a href="${ctx}/cms/comment/?module=article&contentId=${article.id}&delFlag=2"
                           onclick="return viewComment(this.href);">评论</a>
                    </shiro:hasPermission></c:if>
                    <a href="${ctx}/cms/article/form?id=${article.id}">修改</a>
                    <shiro:hasPermission name="cms:article:audit">
                        <a href="${ctx}/cms/article/delete?id=${article.id}${article.delFlag ne 0?'&isRe=true':''}&categoryId=${article.category.id}"
                           onclick="return confirmx('确认要${article.delFlag ne 0?'发布':'删除'}该文章吗？', this.href)">${article.delFlag ne 0?'发布':'删除'}</a>
                    </shiro:hasPermission>
                </shiro:hasPermission>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
</body>
</html>