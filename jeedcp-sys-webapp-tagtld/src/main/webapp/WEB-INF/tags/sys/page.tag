<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<%@ attribute name="httptype" type="java.lang.String" required="true" description="http的提交方式，post or get"%>
<%@ attribute name="formId" type="java.lang.String" required="false" description="post时需填写，分页的表单的id"%>
<%@ attribute name="pageurl" type="java.lang.String" required="false" description="get时需填写，分页的url"%>


<div class="pagination">

    <ul>
        <li><a href="javascript:page('1');">首页</a></li>
        <c:forEach items="${page.navigatepageNums}" var="item">
            <%--[${page.pageNum}  --  ${item}]--%>
            <c:choose>
                <c:when test="${page.pageNum == item}">
                    <li class="active"><a href="javascript:">${item }</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="javascript:page('${item}');" >${item }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <li><a href="javascript:page(${page.pages});">末页</a></li>

        <li class="disabled controls">
            <a href="javascript:">当前 <input id="inputPageNum" value="${page.pageNum}" onkeypress="onPageNumPress(event,this)" onclick="this.select();" type="text">
                / ${page.pages} 页，共 ${page.total} 条</a></li>
    </ul>
</div>

<script type="text/javascript">
    var pageSize = ${page.pageSize};

    function page(pageNumber,pageSize){
//        alert("pageNumber:"+pageNumber);
//        alert("pageSize:"+pageSize);
        if('${httptype}' == 'post')
        {
            document.getElementById('pageNum').value = pageNumber;
            document.getElementById('pageSize').value = pageSize;
            document.getElementById('${formId}').submit();
        }
        else if('${httptype}' == 'get')
        {
            location="${pageurl}?pageNum="+pageNumber;
        }
    }

    function onPageSizeSelect(){
        document.getElementById('${formId}').submit();
    }

    function onPageNumPress(evt,input){
        var e=window.event||evt;
        var c=e.keyCode||e.which;
        if(c==13)page(input.value);
    }

</script>