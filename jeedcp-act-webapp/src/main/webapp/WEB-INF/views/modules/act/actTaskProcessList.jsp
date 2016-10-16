<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>发起任务</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            top.$.jBox.tip.mess = null;
        });
        function page(n, s) {
            location = '${ctx}/act/task/process/?pageNo=' + n + '&pageSize=' + s;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/act/task/todo/">待办任务</a></li>
    <li><a href="${ctx}/act/task/historic/">已办任务</a></li>
    <li class="active"><a href="${ctx}/act/task/process/">新建任务</a></li>
</ul>
<form id="searchForm" action="${ctx}/act/task/process/" method="post" class="row form-horizontal well" role="form">
    <div class="form-group col-sm-3">
        <select id="category" name="category" class="form-control">
            <option value="">全部分类</option>
            <c:forEach items="${fns:getDictList('act_category')}" var="dict">
                <option value="${dict.value}" ${dict.value==category?'selected':''}>${dict.label}</option>
            </c:forEach>
        </select>
    </div>
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
</form>
<sys:message content="${message}"/>
<table class="table table-hover">
    <thead>
    <tr>
        <td>流程分类</td>
        <td>流程标识</td>
        <td>流程名称</td>
        <td>流程图</td>
        <td>流程版本</td>
        <td>更新时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="object">
        <c:set var="process" value="${object[0]}"/>
        <c:set var="deployment" value="${object[1]}"/>
        <tr>
            <td>${fns:getDictLabel(process.category,'act_category','无分类')}</td>
            <td><a href="${ctx}/act/task/form?procDefId=${process.id}">${process.key}</a></td>
            <td>${process.name}</td>
            <td><a target="_blank"
                   href="${pageContext.request.contextPath}/act/rest/diagram-viewer?processDefinitionId=${process.id}">${process.diagramResourceName}</a><%--
						<a target="_blank" href="${ctx}/act/process/resource/read?procDefId=${process.id}&resType=image">${process.diagramResourceName}</a>--%>
            </td>
            <td><b title='流程版本号'>V: ${process.version}</b></td>
            <td><fmt:formatDate value="${deployment.deploymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <a href="${ctx}/act/task/form?procDefId=${process.id}">启动流程</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
</body>
</html>