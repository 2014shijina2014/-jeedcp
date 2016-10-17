<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/adminlte.jsp" %>
</head>
<body>
<div id="importBox" class="hide">
    <form id="importForm" action="${ctx}/sys/user/import" method="post" enctype="multipart/form-data"
          class="col-md-6" role="form" onsubmit="loading('正在导入，请稍等...');"><br/>
        <input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
        <input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
        <a href="${ctx}/sys/user/import/template">下载模板</a>
    </form>
</div>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/sys/user/list">用户列表</a></li>
    <shiro:hasPermission name="sys:user:edit">
        <li><a href="${ctx}/sys/user/form">用户添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/list" method="post"
           class="row form-horizontal well" role="form">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
    <div class="row">
        <div class="form-group col-sm-3">
            <label class="col-sm-4 control-label">归属公司：</label>
            <div class="col-sm-8">
                <sys:treeselect id="company" name="company.id" value="${user.company.id}"
                                labelName="company.name" labelValue="${user.company.name}"
                                title="公司" url="/sys/office/treeData?type=1" cssClass="form-control"
                                allowClear="true"/></div>
        </div>
        <div class="form-group col-sm-3">
            <label class="col-sm-4 control-label">登录名：</label>
            <div class="col-sm-8">
                <form:input path="loginName" htmlEscape="false" maxlength="50"
                            class="form-control"/>
            </div>
        </div>
        <div class="form-group col-sm-3">
            <label class="col-sm-4 control-label">归属部门：</label>
            <div class="col-sm-8">
                <sys:treeselect id="office" name="office.id"
                                value="${user.office.id}" labelName="office.name"
                                labelValue="${user.office.name}" title="部门" url="/sys/office/treeData?type=2"
                                cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
            </div>
        </div>
        <div class="form-group col-sm-3">
            <label class="col-sm-4 control-label">姓&nbsp;&nbsp;&nbsp;名：</label>
            <div class="col-sm-8">
                <form:input path="name" htmlEscape="false"
                            maxlength="50"
                            class="form-control"/>
            </div>
        </div>
    </div>
    <div class="pull-right">
        <button id="btnSubmit" class="btn btn-success"
               onclick="return page();"><i class="fa fa-search"></i>查询</button>
        <button id="btnExport" class="btn btn-primary"><i class="fa fa-file-excel-o"></i>导出</button>
        <button id="btnImport" class="btn btn-info"><i class="fa fa-folder-open-o"></i>导入</button>

    </div>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-bordered table-hover">
    <thead>
    <tr>
        <th>归属公司</th>
        <th>归属部门</th>
        <th class="sort-column login_name">登录名</th>
        <th class="sort-column name">姓名</th>
        <th>电话</th>
        <th>手机</th>
        <%--<th>角色</th> --%><shiro:hasPermission name="sys:user:edit">
        <th>操作</th>
        </shiro:hasPermission></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="user">
        <tr>
            <td>${user.company.name}</td>
            <td>${user.office.name}</td>
            <td><a href="${ctx}/sys/user/form?id=${user.id}">${user.loginName}</a></td>
            <td>${user.name}</td>
            <td>${user.phone}</td>
            <td>${user.mobile}</td>
                <%--
                                <td>${user.roleNames}</td> --%>
            <shiro:hasPermission name="sys:user:edit">
                <td>
                    <a href="${ctx}/sys/user/form?id=${user.id}" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>修改</a>
                    <a href="${ctx}/sys/user/delete?id=${user.id}"
                       onclick="return confirmx('确认要删除该用户吗？', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btnExport").click(function () {
            var d = top.dialog({
                title: '系统提示',
                content: '确认要导出用户数据吗？',
                okValue: '确定',
                ok: function () {
                    $("#searchForm").attr("action", "${ctx}/sys/user/export");
                    $("#searchForm").submit();
                    return false;
                },
                cancelValue: '取消',
                cancel: function () {
                }
            });
            d.showModal();
        });
        $("#btnImport").click(function () {
            var d = top.dialog({
                title: '导入数据',
                content: $("#importBox").html(),
            });
            d.showModal();
        });
    });
    function page(n, s) {
        if (n) $("#pageNo").val(n);
        if (s) $("#pageSize").val(s);
        $("#searchForm").attr("action", "${ctx}/sys/user/list");
        $("#searchForm").submit();
        return false;
    }
</script>
</body>
</html>