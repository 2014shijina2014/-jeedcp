<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>已办任务</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            location = '${ctx}/act/task/historic/?pageNo=' + n + '&pageSize=' + s;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/act/task/todo/">待办任务</a></li>
    <li class="active"><a href="${ctx}/act/task/historic/">已办任务</a></li>
    <li><a href="${ctx}/act/task/process/">新建任务</a></li>
</ul>
<form:form id="searchForm" modelAttribute="act" action="${ctx}/act/task/historic/" method="get"
           class="row form-horizontal well" role="form">
    <div class="form-group col-sm-5">
        <label class="col-sm-4 control-label">流程类型：</label>
        <div class="col-sm-8">
            <form:select path="procDefKey" class="form-control">
                <form:option value="" label="全部流程"/>
                <form:options items="${fns:getDictList('act_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="form-group col-sm-5">
        <div class="row">
            <div class="col-sm-3">
                <label>完成时间：</label>
            </div>

            <div class="col-sm-4">
                <input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20"
                       class="form-control Wdate"
                       value="<fmt:formatDate value="${act.beginDate}" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
            </div>
            <span class="col-sm-1">-</span>
            <div class="col-sm-4">
                <input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20"
                       class="form-control Wdate"
                       value="<fmt:formatDate value="${act.endDate}" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
            </div>
        </div>
    </div>
    <div class=" col-sm-2">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
    </div>

</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-hover">
    <thead>
    <tr>
        <td>标题</td>
        <td>当前环节</td>
        <%--
                        <th>任务内容</th> --%>
        <td>流程名称</td>
        <td>流程版本</td>
        <td>完成时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="act">
        <c:set var="task" value="${act.histTask}"/>
        <c:set var="vars" value="${act.vars}"/>
        <c:set var="procDef" value="${act.procDef}"/><%--
				<c:set var="procExecUrl" value="${act.procExecUrl}" /> --%>
        <c:set var="status" value="${act.status}"/>
        <tr>
            <td>
                <a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">${fns:abbr(not empty vars.map.title ? vars.map.title : task.id, 60)}</a>
            </td>
            <td>
                <a target="_blank"
                   href="${pageContext.request.contextPath}/act/rest/diagram-viewer?processDefinitionId=${task.processDefinitionId}&processInstanceId=${task.processInstanceId}">${task.name}</a><%--
						<a target="_blank" href="${ctx}/act/task/trace/photo/${task.processDefinitionId}/${task.executionId}">${task.name}</a>
						<a target="_blank" href="${ctx}/act/task/trace/info/${task.processInstanceId}">${task.name}</a> --%>
            </td>
                <%--
                                    <td>${task.description}</td> --%>
            <td>${procDef.name}</td>
            <td><b title='流程版本号'>V: ${procDef.version}</b></td>
            <td><fmt:formatDate value="${task.endTime}" type="both"/></td>
            <td>
                <a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">详情</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="box-tools">${page}</div>
</body>
</html>
