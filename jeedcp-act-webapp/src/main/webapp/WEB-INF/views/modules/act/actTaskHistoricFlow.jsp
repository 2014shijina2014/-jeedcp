<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<table class="table table-striped table-bordered table-condensed">
    <tr>
        <td>执行环节</td>
        <td>执行人</td>
        <td>开始时间</td>
        <td>结束时间</td>
        <td>提交意见</td>
        <td>任务历时</td>
    </tr>
    <c:forEach items="${histoicFlowList}" var="act">
        <tr>
            <td>${act.histIns.activityName}</td>
            <td>${act.assigneeName}</td>
            <td><fmt:formatDate value="${act.histIns.startTime}" type="both"/></td>
            <td><fmt:formatDate value="${act.histIns.endTime}" type="both"/></td>
            <td style="word-wrap:break-word;word-break:break-all;">${act.comment}</td>
            <td>${act.durationTime}</td>
        </tr>
    </c:forEach>
</table>