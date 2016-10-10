<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>菜单管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/treetable.jsp" %>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/sys/menu/">菜单列表</a></li>
    <shiro:hasPermission name="sys:menu:edit">
        <li><a href="${ctx}/sys/menu/form">菜单添加</a></li>
    </shiro:hasPermission>
</ul>
<sys:message content="${message}"/>
<form id="listForm" method="post">
    <table id="treeTable" class="table table-hover">
        <thead>
        <tr>
            <td>名称</td>
            <td>链接</td>
            <td style="text-align:center;">排序</td>
            <td>可见</td>
            <td>权限标识</td>
            <shiro:hasPermission name="sys:menu:edit">
                <td>操作</td>
            </shiro:hasPermission></tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="menu">
            <tr id="${menu.id}" pId="${menu.parent.id ne '1'?menu.parent.id:'0'}">
                <td nowrap><i class="icon-${not empty menu.icon?menu.icon:' hide'}"></i><a
                        href="${ctx}/sys/menu/form?id=${menu.id}">${menu.name}</a></td>
                <td title="${menu.href}">${fns:abbr(menu.href,30)}</td>
                <td style="text-align:center;">
                    <shiro:hasPermission name="sys:menu:edit">
                        <input type="hidden" name="ids" value="${menu.id}"/>
                        <input name="sorts" type="text" value="${menu.sort}"
                               style="width:50px;margin:0;padding:0;text-align:center;">
                    </shiro:hasPermission><shiro:lacksPermission name="sys:menu:edit">
                    ${menu.sort}
                </shiro:lacksPermission>
                </td>
                <td>${menu.isShow eq '1'?'显示':'隐藏'}</td>
                <td title="${menu.permission}">${fns:abbr(menu.permission,30)}</td>
                <shiro:hasPermission name="sys:menu:edit">
                    <td nowrap>
                        <a href="${ctx}/sys/menu/form?id=${menu.id}">修改</a>
                        <a href="${ctx}/sys/menu/delete?id=${menu.id}"
                           onclick="return confirmx('要删除该菜单及所有子菜单项吗？', this.href)">删除</a>
                        <a href="${ctx}/sys/menu/form?parent.id=${menu.id}">添加下级菜单</a>
                    </td>
                </shiro:hasPermission>
            </tr>
        </c:forEach></tbody>
    </table>
    <shiro:hasPermission name="sys:menu:edit">
        <div class="pull-right" style="margin-bottom: 20px;margin-right: 10px">
            <input id="btnSubmit" class="btn btn-primary" type="button" value="保存排序" onclick="updateSort();"/>
        </div>
        <div style="margin-top: 10px">
        </div>
    </shiro:hasPermission>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $("#treeTable").treeTable({expandLevel: 3}).show();
    });
    function updateSort() {
        loading('正在提交，请稍等...');
        $("#listForm").attr("action", "${ctx}/sys/menu/updateSort");
        $("#listForm").submit();
    }
</script>
</body>
</html>