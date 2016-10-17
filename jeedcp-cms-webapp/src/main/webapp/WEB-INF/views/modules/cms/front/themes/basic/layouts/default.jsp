<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
    <title><sitemesh:title default="欢迎光临"/> - ${site.title} - Powered By JeeSite</title>
    <%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp" %>
    <sitemesh:head/>
</head>
<body>

<div class="mainmenu-wrapper">
    <div class="container">
        <div class="menuextras">
            <div class="extras">
                <ul>
                    <li>
                        <form class="navbar-form pull-right" action="${ctx}/search" method="get">
                            <input type="text" name="q" maxlength="20" style="width:65px;" placeholder="全站搜索..."
                                   value="${q}">
                        </form>
                    </li>
                </ul>
            </div>
        </div>
        <nav id="mainmenu" class="mainmenu">
            <ul>
                <li class="logo-wrapper">
                    <a href="index.html">
                        <c:choose>
                            <c:when test="${not empty site.logo}">
                                <img alt="${site.title}" src="${site.logo}" class="container"
                                     onclick="location='${ctx}/index-${site.id}${fns:getUrlSuffix()}'">
                            </c:when>
                            <c:otherwise><a class="brand"
                                            href="${ctx}/index-${site.id}${fns:getUrlSuffix()}">${site.title}</a></c:otherwise>
                        </c:choose>
                    </a>
                </li>
                <li class="${not empty isIndex && isIndex ? 'active' : ''}"><a
                        href="${ctx}/index-1${fns:getUrlSuffix()}"><span>${site.id eq '1'?'首　 页':'返回主站'}</span></a>
                </li>
                <c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status"><c:if
                        test="${status.index lt 6}">
                    <c:set var="menuCategoryId" value=",${category.id},"/>
                    <li class="${requestScope.category.id eq category.id||fn:indexOf(requestScope.category.parentIds,menuCategoryId) ge 1?'active':''}">
                        <a href="${category.url}" target="${category.target}"><span>${category.name}</span></a></li>
                </c:if>
                </c:forEach>
            </ul>
        </nav>
    </div>
</div>
<sitemesh:body/>


</body>
</html>