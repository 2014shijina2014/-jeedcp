<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>模型管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/adminlte.jsp" %>
    <script type="text/javascript">
        $(document).ready(function () {
            top.$.jBox.tip.mess = null;
        });
        function page(n, s) {
            location = '${ctx}/act/model/?pageNo=' + n + '&pageSize=' + s;
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
        <form id="categoryForm" action="${ctx}/act/model/updateCategory" method="post" enctype="multipart/form-data"
              style="text-align:center;" class="row form-horizontal well" role="form"><br/>
            <input id="categoryBoxId" type="hidden" name="id" value=""/>
            <select id="categoryBoxCategory" name="category" class="">
                <c:forEach items="${fns:getDictList('act_category')}" var="dict">
                    <option value="${dict.value}">${dict.label}</option>
                </c:forEach>
            </select>
            <br/><br/>　　
            <input id="categorySubmit" class="btn btn-primary" type="submit" value="   保    存   "/>　　
        </form>
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/act/model/">模型管理</a></li>
    <li><a href="${ctx}/act/model/create">新建模型</a></li>
</ul>
<form id="searchForm" action="${ctx}/act/model/" method="post" class="row form-horizontal well" role="form">
    <div class="col-sm-3">
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
        <td>模型ID</td>
        <td>模型标识</td>
        <td>模型名称</td>
        <td>版本号</td>
        <td>创建时间</td>
        <td>最后更新时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="model">
        <tr>
            <td><a href="javascript:updateCategory('${model.id}', '${model.category}')"
                   title="设置分类">${fns:getDictLabel(model.category,'act_category','无分类')}</a></td>
            <td>${model.id}</td>
            <td>${model.key}</td>
            <td>${model.name}</td>
            <td><b title='流程版本号'>V: ${model.version}</b></td>
            <td><fmt:formatDate value="${model.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><fmt:formatDate value="${model.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <a href="${pageContext.request.contextPath}/act/rest/service/editor?id=${model.id}"
                   target="_blank">编辑</a>
                <a href="${ctx}/act/model/deploy?id=${model.id}"
                   onclick="return confirmx('确认要部署该模型吗？', this.href)">部署</a>
                <a href="${ctx}/act/model/export?id=${model.id}" target="_blank">导出</a>
                <a href="${ctx}/act/model/delete?id=${model.id}"
                   onclick="return confirmx('确认要删除该模型吗？', this.href)">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
</body>
</html>
