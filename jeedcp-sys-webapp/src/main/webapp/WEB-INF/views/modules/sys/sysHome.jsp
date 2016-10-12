<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		     WinMove();
		});
	</script>
</head>
<body class="gray-bg">
   <div class="row  border-bottom white-bg dashboard-header">
        <div class="col-sm-12">
            <blockquote class="text-info" style="font-size:14px">Jeedcp是一款基于代码生成器的智能快速开发平台，引领新开发模式(智能开发\在线开发\插件开发)， 可以帮助解决Java项目80%的重复工作，让开发更多关注业务逻辑。既能快速提高开发效率，帮助公司节省人力成本，同时又不失灵活性。 
    Jeedcp快速开发宗旨是：简单功能由代码生成器生成使用; 复杂业务采用表单自定义，业务流程使用工作流来实现、扩展出任务接口，供开发编写业务逻辑。 实现了流程任务节点和任务接口的灵活配置，既保证了公司流程的保密性，又减少了开发人员的工作量
    			<br/>
               <br>Jeedcp采用了目前极为流行的扁平化响应式的设计风格，可以完美的兼容电脑，pad，手机等多个平台。前端UI采用了<a target="_blank" href="http://wrapbootstrap.com/preview/WB0R5L90S">INSPINIA</a>(点击访问）为原型开发，Jeedcp v2.0发布时作者将bootstrap升级到了最新的3.3.4。
                <br>…………
            </blockquote>

            <hr>
        </div>
    </div>
      
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-4">

                <div class="ibox float-e-margins">
                     <div class="ibox-title">
                        <h5>Jeedcp 技术特点</h5> 
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="index.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="index.html#">选项1</a>
                                </li>
                                <li><a href="index.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <p> Jeedcp开发平台采用 SpringMVC + MyBatis + BootStrap + Apache Shiro + Ehcache 开发组件 的基础架构,采用面向声明的开发模式， 基于泛型编写极少代码即可实现复杂的数据展示、数据编辑、
表单处理等功能，再配合代码生成器的使用,将J2EE的开发效率提高5倍以上，可以将代码减少50%以上。

                        <ol>
						<li>采用主流框架，容易上手; 代码生成器依赖性低,很方便的扩展能力，可完全实现二次开发;</li>
						<li>开发效率很高,采用代码生成器，单表数据模型和一对多(父子表)数据模型，增删改查功能自动生成，菜单配置直接使用；</li>
						<li>页面校验自动生成(必须输入、数字校验、金额校验、时间空间等);</li>
						<li>封装完善的用户基础权限、强大的数据权限、和数据字典等基础功能，直接使用无需修改</li>
						<li>常用共通封装，各种工具类(定时任务,短信接口,邮件发送,Excel导出等),基本满足80%项目需求</li>
						<li>集成简易报表工具，图像报表和数据导出非常方便，可极其方便的生成pdf、excel、word等报表</li>
						<li>集成百度Echarts，实现曲线图，柱状图，数据等报表</li>
						<li>集成工作流activiti，并实现了只需在页面配置流程转向，可极大的简化jbpm工作流的开发；用jbpm的流程设计器画出了流程走向，一个工作流基本就完成了，只需写很少量的java代码；</li>
						<li>UI标签库，针对WEB UI进行标准式封装，页面统一采用自定义标签实现功能：列表数据展现、页面校验等,标签使用简单清晰且便于维护。</li>
						<li>提供常用工具类封装，日志、缓存、验证、字典、组织机构等，常用标签（taglib），获取当前组织机构、字典等数据。</li>
						<li>多数据源：及其简易的使用方式，在线配置数据源配置，便捷的从其他数据抓取数据；</li>
						<li>连接池监视：监视当期系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。</li>
						<li>提供APP接口，可以快速和移动APP整合。</li>
						
						<li>国际化：支持多语言，开发国际化项目非常方便；</li>
						<li>支持多种浏览器: IE, 火狐, Google 等浏览器访问速度都很快</li>
						<li>数据权限（精细化数据权限控制，控制到行级，列表级，表单字段级，实现不同人看不同数据，不同人对同一个页面操作不同字段</li>
						
						<li>要求JDK1.6+</li>
                        </ol>
                    </div>
                </div>
              
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                     <div class="ibox-title">
                        <h5>升级日志</h5> <span class="label label-primary">K+</span>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="index.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="index.html#">选项1</a>
                                </li>
                                <li><a href="index.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="panel-body">
                            <div class="panel-group" id="version">
                            
                            	<div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v1.0">v1.0</a><code class="pull-right"></code>
                                            </h5>
                                    </div>
                                    <div id="v1.0" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ol>
                                            	<li>初始版本。</li>
                                                <li>感谢大家的持续关注，如果你有更好的建议，请直接联系我。</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>

                               
                </div>
            </div>
            </div>
            </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商业授权 </h5>
                    </div>
                    <div class="ibox-content">
                        <p>Jeedcp是一款免费开源的快速开发平台，购买后您将获得以下内容</p>
                        <ol>
                            <li>源码(带注释)；</li>
                            <li>代码生成器；</li>
                            <li>开发者文档；</li>
                            <li>永久的免费升级服务；</li>
                            <li>授权许可；</li>
                            <li>付费二次开发服务；</li>
                            <li>……</li>
                        </ol>
                        <hr>
                    

                    </div>
                </div>
                  <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>联系信息</h5>

                    </div>
                    <div class="ibox-content">
                        <p><i class="fa fa-send-o"></i> 网址：<a href="http://www.Jeedcp.org" target="_blank">http://www.Jeedcp.org</a>
                        </p>
                        <p><i class="fa fa-qq"></i> QQ：<a href="http://wpa.qq.com/msgrd?v=3&uin=631079326&site=qq&menu=yes" target="_blank">631079326</a>
                        </p>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>