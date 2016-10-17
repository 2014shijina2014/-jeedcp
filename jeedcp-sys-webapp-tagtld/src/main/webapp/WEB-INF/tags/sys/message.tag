<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ attribute name="content" type="java.lang.String" required="true" description="消息内容" %>
<%@ attribute name="type" type="java.lang.String" description="消息类型：info、success、warning、error、loading" %>
<c:if test="${not empty content}">
    <c:if test="${not empty type}"><c:set var="ctype" value="${type}"/></c:if><c:if test="${empty type}"><c:set
        var="ctype" value="${fn:indexOf(content,'失败') eq -1?'success':'error'}"/></c:if>
    <div class="header" style="margin-bottom: 10px">
        <div id="messageBox"
             class="alert ${fn:indexOf(content,'失败') eq -1?'alert-success':'alert-error'} ${empty message ? 'hide' : ''}">
            <button data-dismiss="alert" class="close">×</button>
            <label>${content}</label>
        </div>
    </div>
</c:if>