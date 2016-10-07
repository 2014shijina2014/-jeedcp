/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.jeedcp.core.act.service.api;

import java.util.List;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.cxf.jaxrs.model.wadl.Description;

import com.thinkgem.jeesite.modules.act.entity.Act;

/**
 * 流程任务处理相关接口
 * 
 * @author Jeffen
 * @version 2015-12-24
 */
@Path(value = "/taskservice")
public interface ActTaskServiceApi {
	/**
	 * 获取流转历史列表
	 * 
	 * @param procInsId
	 */
	@GET
	@Path("/doGetHistoicFlowListInfo/{procInsId}")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	public List<Act> histoicFlowList(@PathParam("procInsId") String procInsId);

	/**
	 * 获取流转历史列表
	 * 
	 * @param procInsId
	 *            流程实例
	 * @param startAct
	 *            开始活动节点名称
	 * @param endAct
	 *            结束活动节点名称
	 */
	@GET
	@Path("/doGetHistoicFlowListInfo/{procInsId}/{startAct}/{endAct}")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	public List<Act> histoicFlowList(@PathParam("procInsId") String procInsId,
									 @PathParam("startAct") String startAct,
									 @PathParam("endAct") String endAct);

	/**
	 * 签收任务
	 * 
	 * @param taskId
	 *            任务ID
	 * @param userId
	 *            签收用户ID（用户登录名）
	 */
	@GET
	@Path("/doClaimTask/{taskId}/{userId}")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	@Description("签收任务")
	public void claim(@PathParam("taskId") String taskId, @PathParam("userId") String userId);
	
	/**
	 * 取消签收任务
	 * 
	 * @param taskId
	 *            任务ID
	 */
	@GET
	@Path("/doUnClaimTask/{taskId}")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	@Description("取消签收任务")
	public void unclaim(@PathParam("taskId") String taskId);

	/**
	 * 流程跟踪图信息（轻量信息）
	 * 
	 * @param processInstanceId
	 *            流程实例ID
	 * @return 封装了各种节点信息
	 */
	@GET
	@Path("/doGetTraceProcessInfoLight/{processInstanceId}")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	@Description("流程跟踪图信息（轻量信息）")
	public List<Map<String, Object>> traceProcessLight(@PathParam("processInstanceId") String processInstanceId)
			throws Exception;
	
	/**
	 * 流程跟踪图信息（全量信息）
	 * 
	 * @param processInstanceId
	 *            流程实例ID
	 * @return 封装了各种节点信息
	 */
	@GET
	@Path("/doGetTraceProcessInfo/{processInstanceId}")
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	@Description("流程跟踪图信息（全量信息）")
	public List<Map<String, Object>> traceProcess(@PathParam("processInstanceId") String processInstanceId)
			throws Exception;
}
