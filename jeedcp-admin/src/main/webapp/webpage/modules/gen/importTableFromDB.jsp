<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
    <title>业务表管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript" src="${ctxStatic}/jquery-combox/jquery.combox.js"></script>
    <link rel="stylesheet" href="${ctxStatic}/jquery-combox/styles/style.css" type="text/css"/>
    <script type="text/javascript">
        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if( $("#inputForm").valid()){
                $("#inputForm").submit();
                return true;
            }

            return false;
        }
    </script>
</head>
<body>

<div class="wrapper wrapper-content">


    <!-- create table from db -->

    <!-- 业务表导入 -->
    <form:form id="inputForm" modelAttribute="genTable" action="${ctx}/gen/genTable/importTableFromDB" method="post" class="form-horizontal">
        <form:hidden path="id"/>
        <sys:message content="${message}"/>
        <br/>
        <div class="control-group">
            <label class="control-label">表名:</label>
            <div class="controls">
                <form:select path="name" class="form-control ">
                    <form:options items="${tableList}" itemLabel="nameAndComments" itemValue="name" htmlEscape="false"/>
                </form:select>
            </div>
        </div>
    </form:form>

</div>
</body>
</html>