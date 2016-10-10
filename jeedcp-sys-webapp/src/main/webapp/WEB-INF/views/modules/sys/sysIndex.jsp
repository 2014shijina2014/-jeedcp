<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <c:set var="tabmode" value="${empty cookie.tabmode.value ? '1' : cookie.tabmode.value}"/>
    <c:if test="${tabmode eq '1'}">
        <%--<link rel="Stylesheet" href="${ctxStatic}/jerichotab/css/jquery.jerichotab.css"/>--%>
        <%--<script type="text/javascript" src="${ctxStatic}/jerichotab/js/jquery.jerichotab.js"></script>--%>
    </c:if>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=${ctxStatic}edge">
    <title>${fns:getConfig('productName')}</title>
    <%@include file="/WEB-INF/views/include/adminlte.jsp" %>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <a href="#" class="logo">
            <span class="logo-mini">${fns:getConfig('productName')}</span>
            <span class="logo-lg"><b>${fns:getConfig('productName')}</b></span>
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">

            </a>

            <div>
                <ul class="nav navbar-nav">
                    <c:set var="firstMenu" value="true"/>
                    <c:if test="${!empty param.parentId}">
                        <c:set var="firstMenuId" value="${param.parentId}"/>
                        <c:set var="firstMenu" value="false"/>
                    </c:if>

                    <c:forEach items="${fns:getMenuList()}" var="menu" varStatus="idxStatus">
                        <c:if test="${menu.parent.id eq '1'&&menu.isShow eq '1'}">
                            <li class=" ${menu.id eq param.parentId ? ' active' : ''}">
                                <c:if test="${empty menu.href}">
                                    <a href="?parentId=${menu.id}"
                                       data-id="${menu.id}">${menu.name}</a>
                                </c:if>
                                <c:if test="${not empty menu.href}">
                                    <a href="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${menu.href}"
                                       data-id="${menu.id}" target="mainFrame">${menu.name}</a>
                                </c:if>
                            </li>
                            <c:if test="${firstMenu}">
                                <c:set var="firstMenuId" value="${menu.id}"/>
                            </c:if>
                            <c:set var="firstMenu" value="false"/>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <%--<c:set var="oaNotifyRemindInterval" value="${fns:getConfig('oa.notify.remind.interval')}"/>--%>

                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="hidden-xs">您好, ${fns:getUser().name}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <p>
                                    ${fns:getUser().name}
                                    <%--<small>Member since Nov. 2012</small>--%>
                                </p>
                                <div class="text-center col-xs-12">
                                    <img src="${fns:getUser().photo}"/>
                                </div>

                            </li>
                            <!-- Menu Body -->
                            <li class="user-body">
                                <div class="col-xs-6 text-center">
                                    <a href="${ctx}/sys/user/modifyPwd" target="mainFrame">修改密码</a>
                                </div>
                                <div class="col-xs-6 text-center">
                                    <a href="${ctx}/oa/oaNotify/self" target="mainFrame">我的通知</a>
                                </div>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a class="btn btn-default btn-flat" href="${ctx}/sys/user/info" target="mainFrame">个人信息</a>
                                </div>
                                <div class="pull-right">
                                    <a class="btn btn-default btn-flat" href="${ctx}/logout" title="退出登录">退出</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <aside class="main-sidebar">
        <section class="sidebar">
            <ul class="sidebar-menu">
                <c:set var="firstUrl" value=""/>
                <c:forEach items="${fns:getMenuList()}" var="menu" varStatus="idxStatus">
                    <c:if test="${menu.parent.id eq firstMenuId &&menu.isShow eq '1'}">
                        <c:if test="${firstUrl==''}">
                            <li class="treeview active">
                        </c:if>
                        <c:if test="${firstUrl!=''}">
                            <li class="treeview">
                        </c:if>

                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>${menu.name}</span> <i
                                class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <c:forEach var="vo" items="${fns:getMenuList()}">
                                <c:if test="${vo.parent.id eq menu.id &&vo.isShow eq '1'}">
                                    <c:if test="${firstUrl==''}">
                                        <li class="active">
                                    </c:if>
                                    <c:if test="${firstUrl!=''}">
                                        <li>
                                    </c:if>
                                    <a href="${fn:indexOf(vo.href, '://') eq -1 ? ctx : ''}${vo.href}"
                                       data-id="${vo.id}" target="mainFrame"><i
                                            class="fa fa-circle-o"></i> ${vo.name}</a></li>
                                    <c:if test="${firstUrl==''}">
                                        <c:set var="firstUrl"
                                               value="${fn:indexOf(vo.href, '://') eq -1 ? ctx : ''}${vo.href}"></c:set>
                                    </c:if>
                                </c:if>
                            </c:forEach>

                        </ul>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
        <section class="content">
            <iframe id="mainFrame" name="mainFrame" src="${firstUrl}" style="overflow:visible;" scrolling="yes"
                    frameborder="no" width="100%" height="650"></iframe>
        </section>
    </div>

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2016 <a href="#">Jeedcp</a>.</strong> All rights
        reserved.
    </footer>

</div>

</body>
</html>