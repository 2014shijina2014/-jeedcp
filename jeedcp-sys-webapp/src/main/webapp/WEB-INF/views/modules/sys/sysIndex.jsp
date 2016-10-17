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


                   <c:set var="oaNotifyRemindInterval" value="${fns:getConfig('oa.notify.remind.interval')}"/>
                    <!-- Messages: style can be found in dropdown.less-->
                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label label-success">4</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">你有4个消息</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li><!-- start message -->
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="${ctxStatic}/adminlte/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                运营团队
                                                <small><i class="fa fa-clock-o"></i> 5 分钟</small>
                                            </h4>
                                            <p>为什么要使用龙果模板?</p>
                                        </a>
                                    </li>
                                    <!-- end message -->
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="${ctxStatic}/adminlte/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                设计团队
                                                <small><i class="fa fa-clock-o"></i> 2 小时</small>
                                            </h4>
                                            <p>为什么要使用龙果模板?</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="${ctxStatic}/adminlte/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                开发者
                                                <small><i class="fa fa-clock-o"></i> 今天</small>
                                            </h4>
                                            <p>为什么要使用龙果模板?</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="${ctxStatic}/adminlte/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                销售部
                                                <small><i class="fa fa-clock-o"></i> 昨天</small>
                                            </h4>
                                            <p>为什么要使用龙果模板?</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="${ctxStatic}/adminlte/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                测试员
                                                <small><i class="fa fa-clock-o"></i> 2 天前</small>
                                            </h4>
                                            <p>为什么要使用龙果模板?</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">查看所有消息</a></li>
                        </ul>
                    </li>
                    <!-- Notifications: style can be found in dropdown.less -->
                    <li class="dropdown notifications-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">10</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">你有10个通知</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-aqua"></i> 今天有 5 人加入
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-warning text-yellow"></i> 很长的描述，可能在这里不适合展示
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-red"></i> 5 新用户
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-shopping-cart text-green"></i> 25 销售额
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-user text-red"></i> 你更改了你的用户名
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">显示全部</a></li>
                        </ul>
                    </li>
                    <!-- Tasks: style can be found in dropdown.less -->
                    <li class="dropdown tasks-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-flag-o"></i>
                            <span class="label label-danger">9</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">你有9个任务</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                设计一些按钮
                                                <small class="pull-right">20%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">20% 完成</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                创造一个好的主题
                                                <small class="pull-right">40%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">40% 完成</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                使用龙果模板
                                                <small class="pull-right">60%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">60% 完成</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                活动规则设定
                                                <small class="pull-right">80%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">80% 完成</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">查看所有任务</a>
                            </li>
                        </ul>
                    </li>
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${ctxStatic}/adminlte/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">您好, ${fns:getUser().name}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="${ctxStatic}/adminlte/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                <p>
                                    ${fns:getUser().name}
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
    <div class="content-wrapper" style="min-height: 900px;">
        <section class="content">
            <iframe id="mainFrame" name="mainFrame" src="${firstUrl}" style="overflow:visible;" scrolling="yes"
                    frameborder="no" width="100%" height="850px"></iframe>
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