<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<%@ include file="/webpage/include/echarts.jsp"%>
<meta name="decorator" content="default"/>

	单轴：
	<div id=line_normal  class="main000"></div>
	<echarts:lineTimeLine
	    id="line_normal"
		title="2011年温度对比曲线" 
		subtitle="主要城市的温度对比曲线"
		xAxisName="预测时间"
		yAxisName="温度(℃)" 
		xAxisData="${xAxisData}" 
		yAxisData="${yAxisData}" 
		timelineData="${timelineData}"
		timelineAxisData="${timelineAxisData}"
		/>
	双轴：
	<div id="line_yAxisIndex"  class="main000"></div>
	<echarts:lineTimeLine
		id="line_yAxisIndex"
		title="2011年温度对比曲线" 
		subtitle="主要城市的温度对比曲线"
		xAxisName="预测时间"
		yAxisName="最高温度(℃),最低温度(℃)" 
		xAxisData="${xAxisData}" 
		yAxisData="${yAxisData}"
		timelineData="${timelineData}"
		timelineAxisData="${timelineAxisData}"
		yAxisIndex="${yAxisIndex}"/>