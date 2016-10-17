<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${category.name}</title>
    <meta name="decorator" content="cms_default_${site.theme}"/>
    <meta name="description" content="${category.description}"/>
    <meta name="keywords" content="${category.keywords}"/>
</head>
<body>
<div class="">
    <ul class="breadcrumb">
        <cms:frontCurrentPosition category="${category}"/>
    </ul>
</div>

<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <div class="blog-post blog-single-post">
                    <c:set var="index" value="1"/>
                    <c:forEach items="${categoryList}" var="tpl">
                        <c:if test="${tpl.inList eq '1' && tpl.module ne ''}">
                            <c:set var="index" value="${index+1}"/>
                            ${index % 2 eq 0 ? '<div class="row">':''}
                            <div class="span5">
                                <h4>
                                    <small><a href="${ctx}/list-${tpl.id}${urlSuffix}" class="pull-right">更多&gt;&gt;</a>
                                    </small>
                                        ${tpl.name}</h4>
                                <c:if test="${tpl.module eq 'article'}">
                                    <ul><c:forEach items="${fnc:getArticleList(site.id, tpl.id, 5, '')}" var="article">
                                        <li><span class="pull-right"><fmt:formatDate value="${article.updateDate}"
                                                                                     pattern="yyyy.MM.dd"/></span><a
                                                href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}"
                                                style="color:${article.color}">${fns:abbr(article.title,40)}</a></li>
                                    </c:forEach></ul>
                                </c:if>
                                <c:if test="${tpl.module eq 'link'}">
                                    <ul><c:forEach items="${fnc:getLinkList(site.id, tpl.id, 5, '')}" var="link">
                                        <li><span class="pull-right"><fmt:formatDate value="${link.updateDate}"
                                                                                     pattern="yyyy.MM.dd"/></span><a
                                                target="_blank"
                                                href="${link.href}"
                                                style="color:${link.color}">${fns:abbr(link.title,40)}</a>
                                        </li>
                                    </c:forEach></ul>
                                </c:if>
                            </div>
                            ${index % 2 ne 0 ? '</div>':''}
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-sm-4 blog-sidebar">
            <h4>栏目列表</h4>
            <ul class="recent-posts">
                <cms:frontCategoryList categoryList="${categoryList}"/>
            </ul>
            <h4>推荐阅读</h4>
            <ul class="recent-posts">
                <cms:frontArticleHitsTop category="${category}"/>
            </ul>
        </div>
    </div>
</div>
</body>
</html>