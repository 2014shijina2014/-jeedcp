<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@include file="/WEB-INF/views/include/adminlte.jsp" %>
<html>
<head>
    <title>日志管理</title>
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
<form:form id="searchForm" action="${ctx}/sys/log/" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <div>
        <label>操作菜单：</label>
        <input id="title" name="title" type="text" width="75px" value="${log.title}"/>
        <label>用户ID：</label>
        <input id="createBy.id" name="createBy.id" type="text" width="75px"
               value="${log.createBy.id}"/>
        <label>URI：</label>
        <input id="requestUri" name="requestUri" type="text" width="75px"
               value="${log.requestUri}"/>
    </div>
    <div style="margin-top:8px;">
        <label>日期范围：</label>
        <input id="beginDate" name="beginDate" type="text" readonly="readonly" width="75px"
               class="Wdate"
               value="<fmt:formatDate value="${log.beginDate}" pattern="yyyy-MM-dd"/>"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>

        <label>&nbsp;&nbsp;&nbsp;-----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input id="endDate" name="endDate" type="text"
               readonly="readonly" width="75px"
               class=" Wdate"
               value="<fmt:formatDate value="${log.endDate}" pattern="yyyy-MM-dd"/>"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>&nbsp;&nbsp;
        &nbsp;<label for="exception"><input id="exception" name="exception"
                                            type="checkbox"${log.exception eq '1'?' checked':''}
                                            value="1"/>只查询异常信息</label>
        &nbsp;&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
    </div>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-hover">
    <thead>
    <tr>
        <td style="width: 10%">操作菜单</td>
        <td>操作用户</td>
        <td>所在公司</td>
        <td>所在部门</td>
        <td>URI</td>
        <td>提交方式</td>
        <td>操作者IP</td>
        <td>操作时间</td>
    </thead>
    <tbody><%
        request.setAttribute("strEnter", "\n");
        request.setAttribute("strTab", "\t");
    %>
    <c:forEach items="${page.list}" var="log">
        <tr>
            <td>${log.title}</td>
            <td>${log.createBy.name}</td>
            <td>${log.createBy.company.name}</td>
            <td>${log.createBy.office.name}</td>
            <td><strong>${log.requestUri}</strong></td>
            <td>${log.method}</td>
            <td>${log.remoteAddr}</td>
            <td><fmt:formatDate value="${log.createDate}" type="both"/></td>
        </tr>
        <c:if test="${not empty log.exception}">
            <tr>
                <td colspan="8" style="word-wrap:break-word;word-break:break-all;">
                    <b>用户代理:</b> ${log.userAgent}<br/>
                    <b>提交参数:</b> ${fns:escapeHtml(log.params)} <br/>
                    <b>异常信息:</b> <br/>
                        ${fn:replace(fn:replace(fns:escapeHtml(log.exception), strEnter, '<br/>'), strTab, '&nbsp; &nbsp; ')}
                </td>
            </tr>
        </c:if>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
<div style="margin-top: 10px"></div>
</body>
</html>