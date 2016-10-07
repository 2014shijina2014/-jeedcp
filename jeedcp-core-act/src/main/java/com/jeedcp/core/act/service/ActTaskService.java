/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.core.act.service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.jeedcp.common.model.Page;
import com.jeedcp.core.act.dao.ActDao;
import com.jeedcp.core.act.service.api.ActTaskServiceApi;
import com.jeedcp.entity.sys.Office;
import com.jeedcp.entity.sys.Role;
import com.jeedcp.entity.sys.User;
import com.jeedcp.service.base.BaseService;
import com.jeedcp.service.sys.OfficeService;
import com.jeedcp.service.sys.SystemService;
import com.jeedcp.service.util.UserUtils;
import com.jeedcp.util.StringUtils;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.Expression;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricTaskInstanceQuery;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.activiti.engine.impl.bpmn.diagram.ProcessDiagramGenerator;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.delegate.ActivityBehavior;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.impl.task.TaskDefinition;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * 流程定义相关Service
 * @author ThinkGem
 * @version 2013-11-03
 */
@Service
@Transactional(readOnly = true)
@Component("actTaskApplication")
public class ActTaskService extends BaseService implements ActTaskServiceApi {

	@Autowired
	private ActDao actDao;
	
	@Autowired
	private ProcessEngineFactoryBean processEngine;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private FormService formService;
	@Autowired
	private HistoryService historyService;
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private IdentityService identityService;
	
	@Autowired
	private SystemService systemService;
	@Autowired
	private OfficeService officeService;
	
	/**
	 * 获取待办列表
	 * @param procDefKey 流程定义标识
	 * @return
	 * @throws Exception 
	 */
	public List<Act> todoList(Act act) throws Exception{
		String userId = UserUtils.getUser().getLoginName();//ObjectUtils.toString(UserUtils.getUser().getId());
		
		List<Act> result = new ArrayList<Act>();
		
		// =============== 已经签收的任务  ===============
		TaskQuery todoTaskQuery = taskService.createTaskQuery().taskAssignee(userId).active()
				.includeProcessVariables().orderByTaskCreateTime().desc();
		
		// 设置查询条件
		if (StringUtils.isNotBlank(act.getProcDefKey())){
			todoTaskQuery.processDefinitionKey(act.getProcDefKey());
		}
		if (act.getBeginDate() != null){
			todoTaskQuery.taskCreatedAfter(act.getBeginDate());
		}
		if (act.getEndDate() != null){
			todoTaskQuery.taskCreatedBefore(act.getEndDate());
		}
		
		// 查询列表
		List<Task> todoList = todoTaskQuery.list();
		for (Task task : todoList) {
			Act e = new Act();
			e.setTask(task);
			e.setVars(task.getProcessVariables());
//			e.setTaskVars(task.getTaskLocalVariables());
//			System.out.println(task.getId()+"  =  "+task.getProcessVariables() + "  ========== " + task.getTaskLocalVariables());
			e.setProcDef(ProcessDefCache.get(task.getProcessDefinitionId()));
//			e.setProcIns(runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult());
//			e.setProcExecUrl(ActUtils.getProcExeUrl(task.getProcessDefinitionId()));
			e.setStatus("todo");
			result.add(e);
		}
		
		// =============== 等待签收的任务  ===============
		TaskQuery toClaimQuery = taskService.createTaskQuery().taskCandidateUser(userId)
				.includeProcessVariables().active().orderByTaskCreateTime().desc();
		
		// 设置查询条件
		if (StringUtils.isNotBlank(act.getProcDefKey())){
			toClaimQuery.processDefinitionKey(act.getProcDefKey());
		}
		if (act.getBeginDate() != null){
			toClaimQuery.taskCreatedAfter(act.getBeginDate());
		}
		if (act.getEndDate() != null){
			toClaimQuery.taskCreatedBefore(act.getEndDate());
		}
		
		// 查询列表
		List<Task> toClaimList = toClaimQuery.list();
		for (Task task : toClaimList) {
			Act e = new Act();
			e.setTask(task);
			e.setVars(task.getProcessVariables());
//			e.setTaskVars(task.getTaskLocalVariables());
			System.out.println(task.getId()+"  =  "+task.getProcessVariables() + "  ========== " + task.getTaskLocalVariables());
			e.setProcDef(ProcessDefCache.get(task.getProcessDefinitionId()));
			e.setProcIns(runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult());
//			e.setProcExecUrl(ActUtils.getProcExeUrl(task.getProcessDefinitionId()));
			e.setStatus("claim");

			if (!Global // 待办签收是否关闭角色数据过滤
					.getConfigBoolean("activiti.todolist.claim.role.closeDataScope")
					&& isDataScope(task)) {// 角色数据过滤判定
				result.add(e);
			}
		}
		return result;
	}

	/**
	 * 【角色数据过滤权限判定】
	 * <p>
	 * 判定流程发起人所在部门跟当前部门审批人是否在同一个组织， 通过角色数据授权进行判定过滤
	 * <li>所在部门及以下数据
	 * <li>所在部门数据
	 * 
	 * @param task
	 * @return true: 合法数据范围<br>
	 *         false: 非法数据范围
	 * 
	 * @author Jeffen@pactera
	 * @since 1.2.10
	 * @date 2016/3/23
	 */
	public boolean isDataScope(Task task) {
		List<String> candidateGroups = getCandidateGroups(task);
		logger.debug("candidateGroups: {}", candidateGroups);
		if (candidateGroups != null && candidateGroups.size() > 0) {
			for (String enname : candidateGroups) {
				Role role = systemService.getRoleByEnname(enname);
				String dataScope = role.getDataScope();
				if (Role.DATA_SCOPE_OFFICE_AND_CHILD // 所在部门及以下数据
						.equals(dataScope) || Role.DATA_SCOPE_OFFICE // 所在部门数据
						.equals(dataScope)) {

					List<Act> histoicFlowList = histoicFlowList(task
							.getProcessInstanceId());
					if (histoicFlowList != null && histoicFlowList.size() > 0) {
						String proposerUser = histoicFlowList.get(0)
								.getAssignee();
						Office proposerOffice = systemService
								.getUserByLoginName(proposerUser).getOffice();
						Office assigneeOffice = UserUtils.getUser().getOffice();

						if (Role.DATA_SCOPE_OFFICE_AND_CHILD // 所在部门及以下数据
								.equals(dataScope)
								&& !officeService.isExistChild(assigneeOffice,
										proposerOffice)) {
							return false;
						}
						if (Role.DATA_SCOPE_OFFICE // 所在部门数据
								.equals(dataScope)
								&& !assigneeOffice.getId().equals(
										proposerOffice.getId())) {
							return false;
						}
					}
				}
			}
		}
		return true;
	}

	/**
	 * get candidate groups info by task.
	 * retrieve CandidateGroup for a task
	 * 
	 * @param task
	 * @return
	 * 
	 * @author Jeffen@pactera
	 * @since 1.2.10
	 * @date 2016/3/23
	 */
	public List<String> getCandidateGroups(Task task) {

		// fetch process from BPMN model.
		BpmnModel bpmnModel = repositoryService.getBpmnModel(task
				.getProcessDefinitionId());
		List<String> candidateGroups = bpmnModel.getMainProcess()
				.getCandidateStarterGroups();

		logger.debug("candidateGroups by BpmnModel: {}", candidateGroups);
		if (candidateGroups!=null && candidateGroups.size()>0) {
			return candidateGroups;
		}

		// trace activity info from process.
		List<Map<String, Object>> activityInfos = null;
		try {
			activityInfos = traceProcess(task.getProcessInstanceId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (Map<String, Object> activityInfo : activityInfos) {
			if ((Boolean)activityInfo.get("currentActiviti")) {
				Map<?, ?> vars = (Map<?, ?>) activityInfo.get("vars");
				if ("userTask".equals(vars.get("type"))) {
					return StringUtil.splitToList(null,
							(String) vars.get("candidateGroups"));
				}
			}
		}
		return null;
	}

	/**
	 * 获取已办任务
	 * @param page
	 * @param procDefKey 流程定义标识
	 * @return
	 */
	public Page<Act> historicList(Page<Act> page, Act act){
		String userId = UserUtils.getUser().getLoginName();//ObjectUtils.toString(UserUtils.getUser().getId());

		HistoricTaskInstanceQuery histTaskQuery = historyService.createHistoricTaskInstanceQuery().taskAssignee(userId).finished()
				.includeProcessVariables().orderByHistoricTaskInstanceEndTime().desc();
		
		// 设置查询条件
		if (StringUtils.isNotBlank(act.getProcDefKey())){
			histTaskQuery.processDefinitionKey(act.getProcDefKey());
		}
		if (act.getBeginDate() != null){
			histTaskQuery.taskCompletedAfter(act.getBeginDate());
		}
		if (act.getEndDate() != null){
			histTaskQuery.taskCompletedBefore(act.getEndDate());
		}
		
		// 查询总数
		page.setCount(histTaskQuery.count());
		
		// 查询列表
		List<HistoricTaskInstance> histList = histTaskQuery.listPage(page.getFirstResult(), page.getMaxResults());
		//处理分页问题
		List<Act> actList=Lists.newArrayList();
		for (HistoricTaskInstance histTask : histList) {
			Act e = new Act();
			e.setHistTask(histTask);
			e.setVars(histTask.getProcessVariables());
//			e.setTaskVars(histTask.getTaskLocalVariables());
//			System.out.println(histTask.getId()+"  =  "+histTask.getProcessVariables() + "  ========== " + histTask.getTaskLocalVariables());
			e.setProcDef(ProcessDefCache.get(histTask.getProcessDefinitionId()));
//			e.setProcIns(runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult());
//			e.setProcExecUrl(ActUtils.getProcExeUrl(task.getProcessDefinitionId()));
			e.setStatus("finish");
			actList.add(e);
			//page.getList().add(e);
		}
		page.setList(actList);
		return page;
	}

	/**
	 * 获取流转历史列表
	 * 
	 * @param procInsId
	 *            流程实例
	 */
	@Override
	public List<Act> histoicFlowList(String procInsId) {
		return histoicFlowList(procInsId, null, null);
	}
	/**
	 * 获取流转历史列表
	 * @param procInsId 流程实例
	 * @param startAct 开始活动节点名称
	 * @param endAct 结束活动节点名称
	 */
	@Override
	public List<Act> histoicFlowList(String procInsId, String startAct, String endAct){
		List<Act> actList = Lists.newArrayList();
		List<HistoricActivityInstance> list = historyService.createHistoricActivityInstanceQuery().processInstanceId(procInsId)
				.orderByHistoricActivityInstanceStartTime().asc().orderByHistoricActivityInstanceEndTime().asc().list();
		
		boolean start = false;
		Map<String, Integer> actMap = Maps.newHashMap();
		
		for (int i=0; i<list.size(); i++){
			
			HistoricActivityInstance histIns = list.get(i);
			
			// 过滤开始节点前的节点
			if (StringUtils.isNotBlank(startAct) && startAct.equals(histIns.getActivityId())){
				start = true;
			}
			if (StringUtils.isNotBlank(startAct) && !start){
				continue;
			}
			
			// 只显示开始节点和结束节点，并且执行人不为空的任务
			// modify for claiming task info by jeffen@pactera 2015/12/21			
			if (//StringUtils.isNotBlank(histIns.getAssignee()) 
					 "userTask".equals(histIns.getActivityType())
					 || "startEvent".equals(histIns.getActivityType())
					 || "endEvent".equals(histIns.getActivityType())){
				
				// 给节点增加一个序号
				Integer actNum = actMap.get(histIns.getActivityId());
				if (actNum == null){
					actMap.put(histIns.getActivityId(), actMap.size());
				}
				
				Act e = new Act();
				e.setHistIns(histIns);
				// 获取流程发起人名称
				if ("startEvent".equals(histIns.getActivityType())){
					List<HistoricProcessInstance> il = historyService.createHistoricProcessInstanceQuery().processInstanceId(procInsId).orderByProcessInstanceStartTime().asc().list();
//					List<HistoricIdentityLink> il = historyService.getHistoricIdentityLinksForProcessInstance(procInsId);
					if (il.size() > 0){
						if (StringUtils.isNotBlank(il.get(0).getStartUserId())){
							User user = UserUtils.getByLoginName(il.get(0).getStartUserId());
							if (user != null){
								e.setAssignee(histIns.getAssignee());
								e.setAssignee(user.getLoginName());
								e.setAssigneeName(user.getName());
							}
						}
					}
				}
				// 获取任务执行人名称
				if (StringUtils.isNotEmpty(histIns.getAssignee())){
					User user = UserUtils.getByLoginName(histIns.getAssignee());
					if (user != null){
						e.setAssignee(histIns.getAssignee());
						e.setAssignee(user.getLoginName());
						e.setAssigneeName(user.getName());
					}
				}
				
				// 获取意见评论内容 
				if (StringUtils.isNotBlank(histIns.getTaskId())){
					List<Comment> commentList = taskService.getTaskComments(histIns.getTaskId());
					if (commentList.size()>0){
						e.setComment(commentList.get(0).getFullMessage());
					}
				}
				
				// 执行人签收状态提醒 add by jeffen@pactera 2015/12/21	
				if (!"endEvent".equals(histIns.getActivityType())
						&& StringUtils.isEmpty(e.getAssigneeName())) {
					e.setAssigneeName("<i>等待任务签收...</i>");
				}
				
				actList.add(e);
			}
			
			// 过滤结束节点后的节点
			if (StringUtils.isNotBlank(endAct) && endAct.equals(histIns.getActivityId())){
				boolean bl = false;
				Integer actNum = actMap.get(histIns.getActivityId());
				// 该活动节点，后续节点是否在结束节点之前，在后续节点中是否存在
				for (int j=i+1; j<list.size(); j++){
					HistoricActivityInstance hi = list.get(j);
					Integer actNumA = actMap.get(hi.getActivityId());
					if ((actNumA != null && actNumA < actNum) || StringUtils.equals(hi.getActivityId(), histIns.getActivityId())){
						bl = true;
					}
				}
				if (!bl){
					break;
				}
			}
		}
		return actList;
	}

	/**
	 * 获取流程列表
	 * @param category 流程分类
	 */
	public Page<Object[]> processList(Page<Object[]> page, String category) {
		/*
		 * 保存两个对象，一个是ProcessDefinition（流程定义），一个是Deployment（流程部署）
		 */
	    ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery()
	    		.latestVersion().active().orderByProcessDefinitionKey().asc();
	    
	    if (StringUtils.isNotEmpty(category)){
	    	processDefinitionQuery.processDefinitionCategory(category);
		}
	    
	    page.setCount(processDefinitionQuery.count());
	    
	    List<ProcessDefinition> processDefinitionList = processDefinitionQuery.listPage(page.getFirstResult(), page.getMaxResults());
	    for (ProcessDefinition processDefinition : processDefinitionList) {
	      String deploymentId = processDefinition.getDeploymentId();
	      Deployment deployment = repositoryService.createDeploymentQuery().deploymentId(deploymentId).singleResult();
	      page.getList().add(new Object[]{processDefinition, deployment});
	    }
		return page;
	}
	
	/**
	 * 获取流程表单（首先获取任务节点表单KEY，如果没有则取流程开始节点表单KEY）
	 * @return
	 */
	public String getFormKey(String procDefId, String taskDefKey){
		String formKey = "";
		if (StringUtils.isNotBlank(procDefId)){
			if (StringUtils.isNotBlank(taskDefKey)){
				try{
					formKey = formService.getTaskFormKey(procDefId, taskDefKey);
				}catch (Exception e) {
					formKey = "";
				}
			}
			if (StringUtils.isBlank(formKey)){
				formKey = formService.getStartFormKey(procDefId);
			}
			if (StringUtils.isBlank(formKey)){
				formKey = "/404";
			}
		}
		logger.debug("getFormKey: {}", formKey);
		return formKey;
	}
	
	/**
	 * 获取流程实例对象
	 * @param procInsId
	 * @return
	 */
	@Transactional(readOnly = false)
	public ProcessInstance getProcIns(String procInsId) {
		return runtimeService.createProcessInstanceQuery().processInstanceId(procInsId).singleResult();
	}

	/**
	 * 启动流程
	 * @param procDefKey 流程定义KEY
	 * @param businessTable 业务表表名
	 * @param businessId	业务表编号
	 * @return 流程实例ID
	 */
	@Transactional(readOnly = false)
	public String startProcess(String procDefKey, String businessTable, String businessId) {
		return startProcess(procDefKey, businessTable, businessId, "");
	}
	
	/**
	 * 启动流程
	 * @param procDefKey 流程定义KEY
	 * @param businessTable 业务表表名
	 * @param businessId	业务表编号
	 * @param title			流程标题，显示在待办任务标题
	 * @return 流程实例ID
	 */
	@Transactional(readOnly = false)
	public String startProcess(String procDefKey, String businessTable, String businessId, String title) {
		Map<String, Object> vars = Maps.newHashMap();
		return startProcess(procDefKey, businessTable, businessId, title, vars);
	}
	
	/**
	 * 启动流程
	 * @param procDefKey 流程定义KEY
	 * @param businessTable 业务表表名
	 * @param businessId	业务表编号
	 * @param title			流程标题，显示在待办任务标题
	 * @param vars			流程变量
	 * @return 流程实例ID
	 */
	@Transactional(readOnly = false)
	public String startProcess(String procDefKey, String businessTable, String businessId, String title, Map<String, Object> vars) {
		String userId = UserUtils.getUser().getLoginName();//ObjectUtils.toString(UserUtils.getUser().getId())
		
		// 用来设置启动流程的人员ID，引擎会自动把用户ID保存到activiti:initiator中
		identityService.setAuthenticatedUserId(userId);
		
		// 设置流程变量
		if (vars == null){
			vars = Maps.newHashMap();
		}
		
		// 设置流程标题
		if (StringUtils.isNotBlank(title)){
			vars.put("title", title);
		}
		
		// 启动流程
		ProcessInstance procIns = runtimeService.startProcessInstanceByKey(procDefKey, businessTable+":"+businessId, vars);
		
		// 更新业务表流程实例ID
		Act act = new Act();
		act.setBusinessTable(businessTable);// 业务表名
		act.setBusinessId(businessId);	// 业务表ID
		act.setProcInsId(procIns.getId());
		actDao.updateProcInsIdByBusinessId(act);
		return act.getProcInsId();
	}

	/**
	 * 获取任务
	 * @param taskId 任务ID
	 */
	public Task getTask(String taskId){
		return taskService.createTaskQuery().taskId(taskId).singleResult();
	}
	
	/**
	 * 删除任务
	 * @param taskId 任务ID
	 * @param deleteReason 删除原因
	 */
	@Transactional(readOnly = false)
	public void deleteTask(String taskId, String deleteReason){
		taskService.deleteTask(taskId, deleteReason);
	}
	
	/**
	 * 签收任务
	 * @param taskId 任务ID
	 * @param userId 签收用户ID（用户登录名）
	 */
	@Transactional(readOnly = false)
	@Override
	public void claim(String taskId, String userId){
		taskService.claim(taskId, userId);
	}
	
	/**
	 * 取消签收任务
	 * @param taskId 任务ID
	 * 
	 * @author jeffen@pactera
	 * @date 2015/12/31
	 * @since v1.2.10
	 */
	@Transactional(readOnly = false)
	@Override
	public void unclaim(String taskId){
		taskService.unclaim(taskId);
	}
	
	/**
	 * 提交任务, 并保存意见
	 * @param taskId 任务ID
	 * @param procInsId 流程实例ID，如果为空，则不保存任务提交意见
	 * @param comment 任务提交意见的内容
	 * @param vars 任务变量
	 */
	@Transactional(readOnly = false)
	public void complete(String taskId, String procInsId, String comment, Map<String, Object> vars){
		complete(taskId, procInsId, comment, "", vars);
	}
	
	/**
	 * 提交任务, 并保存意见
	 * @param taskId 任务ID
	 * @param procInsId 流程实例ID，如果为空，则不保存任务提交意见
	 * @param comment 任务提交意见的内容
	 * @param title			流程标题，显示在待办任务标题
	 * @param vars 任务变量
	 */
	@Transactional(readOnly = false)
	public void complete(String taskId, String procInsId, String comment, String title, Map<String, Object> vars){
		// 添加意见
		if (StringUtils.isNotBlank(procInsId) && StringUtils.isNotBlank(comment)){
			taskService.addComment(taskId, procInsId, comment);
		}
		
		// 设置流程变量
		if (vars == null){
			vars = Maps.newHashMap();
		}
		
		// 设置流程标题
		if (StringUtils.isNotBlank(title)){
			vars.put("title", title);
		}
		
		// 提交任务
		taskService.complete(taskId, vars);
	}

	/**
	 * 完成第一个任务
	 * @param procInsId
	 */
	@Transactional(readOnly = false)
	public void completeFirstTask(String procInsId){
		completeFirstTask(procInsId, null, null, null);
	}
	
	/**
	 * 完成第一个任务
	 * @param procInsId
	 * @param comment
	 * @param title
	 * @param vars
	 */
	@Transactional(readOnly = false)
	public void completeFirstTask(String procInsId, String comment, String title, Map<String, Object> vars){
		String userId = UserUtils.getUser().getLoginName();
		Task task = taskService.createTaskQuery().taskAssignee(userId).processInstanceId(procInsId).active().singleResult();
		if (task != null){
			complete(task.getId(), procInsId, comment, title, vars);
		}
	}

//	/**
//	 * 委派任务
//	 * @param taskId 任务ID
//	 * @param userId 被委派人
//	 */
//	public void delegateTask(String taskId, String userId){
//		taskService.delegateTask(taskId, userId);
//	}
//	
//	/**
//	 * 被委派人完成任务
//	 * @param taskId 任务ID
//	 */
//	public void resolveTask(String taskId){
//		taskService.resolveTask(taskId);
//	}
//	
//	/**
//	 * 回退任务
//	 * @param taskId
//	 */
//	public void backTask(String taskId){
//		taskService.
//	}
	
	////////////////////////////////////////////////////////////////////
	
	/**
	 * 读取带跟踪的图片
	 * @param executionId	环节ID
	 * @return	封装了各种节点信息
	 */
	public InputStream tracePhoto(String processDefinitionId, String executionId) {
		// ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(executionId).singleResult();
		BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
		
		List<String> activeActivityIds = Lists.newArrayList();
		if (runtimeService.createExecutionQuery().executionId(executionId).count() > 0){
			activeActivityIds = runtimeService.getActiveActivityIds(executionId);
		}
		
		// 不使用spring请使用下面的两行代码
		// ProcessEngineImpl defaultProcessEngine = (ProcessEngineImpl)ProcessEngines.getDefaultProcessEngine();
		// Context.setProcessEngineConfiguration(defaultProcessEngine.getProcessEngineConfiguration());

		// 使用spring注入引擎请使用下面的这行代码
		Context.setProcessEngineConfiguration(processEngine.getProcessEngineConfiguration());

		return ProcessDiagramGenerator.generateDiagram(bpmnModel, "png", activeActivityIds);
	}

	/**
	 * 流程跟踪图信息（轻量信息）
	 * @param processInstanceId		流程实例ID
	 * @return	封装了各种节点信息
	 */
	@Override
	public List<Map<String, Object>> traceProcessLight(String processInstanceId) throws Exception {
		return traceProcess(processInstanceId, true);
	}

	/**
	 * 流程跟踪图信息（全量信息）
	 * @param processInstanceId		流程实例ID
	 * @param isLight		轻量信息
	 * @return	封装了各种节点信息
	 */
	@Override
	public List<Map<String, Object>> traceProcess(String processInstanceId) throws Exception {
		return traceProcess(processInstanceId, false);
	}
	
	/**
	 * 流程跟踪图信息
	 * @param processInstanceId		流程实例ID
	 * @param isLight		是否轻量信息
	 * @return	封装了各种节点信息
	 * 
	 * @author Jeffen@pactera
	 * @update 2016.1.13
	 * @since 1.2.10
	 */
	public List<Map<String, Object>> traceProcess(String processInstanceId, boolean isLight) throws Exception {
		Execution execution = runtimeService.createExecutionQuery().executionId(processInstanceId).singleResult();//执行实例
		Object property = PropertyUtils.getProperty(execution, "activityId");
		String activityId = "";
		if (property != null) {
			activityId = property.toString();
		}
		
		// add histoicFlowList by jeffen@pactera 2016.1.12
		List<Act> actLst = this.histoicFlowList(processInstanceId);
		Map<String, Object> activityImageInfoLightStart = null;
		boolean isHisAct = true;
		
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId)
				.singleResult();
		ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService)
				.getDeployedProcessDefinition(processInstance.getProcessDefinitionId());
		List<ActivityImpl> activitiList = processDefinition.getActivities();//获得当前任务的所有节点

		List<Map<String, Object>> activityInfos = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> activityInfosLight = new ArrayList<Map<String, Object>>();
		for (ActivityImpl activity : activitiList) {

			boolean currentActiviti = false;
			String id = activity.getId();

			// 当前节点
			if (id.equals(activityId)) {
				currentActiviti = true;
				isHisAct = false;
			}

			Map<String, Object> activityImageInfo = packageSingleActivitiInfo(activity, processInstance, currentActiviti, false);

			// set light info by jeffen@pactera 2016.1.12
			if (isLight) {
				Map<String, Object> activityImageInfoLight = packageSingleActivitiInfo(
						activity, processInstance, currentActiviti, true);

				for (Act act : actLst) {
					if (act.getHistIns() != null
							&& id.equals(act.getHistIns().getActivityId())) {
						// 历史活动任务
						activityImageInfoLight.put("actAssignee",
								act.getAssignee());
						activityImageInfoLight.put("actAssigneeName",
								act.getAssigneeName());
						activityImageInfoLight.put("actComment",
								act.getComment());
						activityImageInfoLight.put("actHisInsTime", DateUtil.getDatetime(act
								.getHistIns().getTime()));
					}
				}

				// 判断是否历史节点
				if (isHisAct) {
					activityImageInfoLight.put("isHisAct", true);
				} else {
					activityImageInfoLight.put("isHisAct", false);
				}

				// 优先级（节点顺序）
				Map<String, Object> vars = (Map<String, Object>) activityImageInfoLight
						.get("vars");
				int priority = -1;
				try {
					if (vars.containsKey("priority"))
						priority = Integer.valueOf(vars.get("priority")
								.toString());
				} catch (Exception e) {
					priority = -1;
				}
				if (priority == 0) {
					activityImageInfoLightStart = activityImageInfoLight;
					activityImageInfoLightStart.put("isHisAct", true);
				}
				if (priority > 0) {
					activityInfosLight.add(activityImageInfoLight);
				}

			}

			activityInfos.add(activityImageInfo);
		}
		
		if (isLight && activityImageInfoLightStart != null) {
			// 开始节点置顶
			activityInfosLight.add(0, activityImageInfoLightStart);
		}
		
		return isLight?activityInfosLight:activityInfos;
	}

	/**
	 * 封装输出信息，包括：当前节点的X、Y坐标、变量信息、任务类型、任务描述
	 * @param activity
	 * @param processInstance
	 * @param currentActiviti
	 * @param isLight
	 * @return
	 */
	private Map<String, Object> packageSingleActivitiInfo(ActivityImpl activity, ProcessInstance processInstance,
			boolean currentActiviti, boolean isLight) throws Exception {
		Map<String, Object> vars = new HashMap<String, Object>();
		Map<String, Object> activityInfo = new HashMap<String, Object>();
		activityInfo.put("currentActiviti", currentActiviti);
		
		if (!isLight) {
			setPosition(activity, activityInfo);
			setWidthAndHeight(activity, activityInfo);
		}

		Map<String, Object> properties = activity.getProperties();
		
		// set id,name
		vars.put("id", activity.getId());
		vars.put("name", properties.get("name"));
		
		// set type
		String type = (String) properties.get("type");
		if (!isLight) {
			vars.put("type", type);
			vars.put("任务类型", ActUtils.parseToZhType(type.toString()));
			vars.put("节点名称", properties.get("name"));
		}

		ActivityBehavior activityBehavior = activity.getActivityBehavior();
		logger.debug("activityBehavior={}", activityBehavior);
		if (activityBehavior instanceof UserTaskActivityBehavior) {

			Task currentTask = null;

			// 当前节点的task
			if (!isLight && currentActiviti) {
				currentTask = getCurrentTaskInfo(processInstance);
			}

			// 当前任务的分配角色
			UserTaskActivityBehavior userTaskActivityBehavior = (UserTaskActivityBehavior) activityBehavior;
			TaskDefinition taskDefinition = userTaskActivityBehavior.getTaskDefinition();
			Set<Expression> candidateGroupIdExpressions = taskDefinition.getCandidateGroupIdExpressions();
			if (!isLight && !candidateGroupIdExpressions.isEmpty()) {

				// 任务的处理角色
				setTaskGroup(vars, candidateGroupIdExpressions);

				// 当前处理人
				if (currentTask != null) {
					setCurrentTaskAssignee(vars, currentTask);
				}
			}
			
			// set priority from task definition info by jeffen@pactera 2016.1.13
			vars.put("priority",
					taskDefinition.getPriorityExpression() == null ? -1
							: taskDefinition.getPriorityExpression()
									.getExpressionText());
		}

		if (!isLight) {
			vars.put("节点说明", properties.get("documentation"));
	
			String description = activity.getProcessDefinition().getDescription();
			vars.put("描述", description);
		}
		
		// 优先级（可作为节点顺序）
		if ("startEvent".equals(type)){
			vars.put("priority", 0);
		}
		if ("endEvent".equals(type)){
			vars.put("priority", 999);
		}

		logger.debug("trace variables: {}", vars);
		activityInfo.put("vars", vars);
		return activityInfo;
	}

	/**
	 * 设置任务组
	 * @param vars
	 * @param candidateGroupIdExpressions
	 * 
	 * @author update by Jeffen@pactera
	 * @date 2016/1/2
	 * @sinvce v1.2.10
	 */
	private void setTaskGroup(Map<String, Object> vars, Set<Expression> candidateGroupIdExpressions) {
		List<String> roles = new ArrayList<String>();
		List<String> candidateGroups = new ArrayList<String>();
		List<User> userList = new ArrayList<User>();
		for (Expression expression : candidateGroupIdExpressions) {
			String expressionText = expression.getExpressionText();
			
			// modify by jeffen@pactera 2015/12/25
			//String roleName = identityService.createGroupQuery().groupId(expressionText).singleResult().getName();
			String roleName = identityService.newGroup(expressionText).getName();
			
			roles.add(roleName);
			candidateGroups.add(expressionText);
			userList.addAll(systemService.findUser(new User(systemService
					.getRoleByEnname(expressionText))));
		}
		vars.put("任务所属角色", StringUtil.joinString(roles, ","));
		
		// add candidateGroups var by jeffen@pactera 2016/1/2
		vars.put("candidateGroups", StringUtil.joinString(candidateGroups, ","));
		vars.put("candidateUsers", ActUtils.toActivitiNodeUser(userList));
	}

	/**
	 * 设置当前处理人信息
	 * @param vars
	 * @param currentTask
	 * 
	 * @author update by Jeffen@pactera
	 * @date 2016/1/4
	 * @sinvce v1.2.10
	 */
	private void setCurrentTaskAssignee(Map<String, Object> vars, Task currentTask) {
		String assignee = currentTask.getAssignee();
		List<User> userList = new ArrayList<User>();
		if (assignee != null) {
			
			// modify by jeffen@pactera 2015/12/25
			//org.activiti.engine.identity.User assigneeUser = identityService.createUserQuery().userId(assignee).singleResult();
			org.activiti.engine.identity.User assigneeUser = identityService.newUser(assignee);
			userList.add(systemService.getUserByLoginName(assignee));
			
			String userInfo = assigneeUser.getFirstName() + " " + assigneeUser.getLastName();
			vars.put("当前处理人", userInfo);
			// add candidateUsers var by jeffen@pactera 2016/1/4
			vars.put("candidateUsers", ActUtils.toActivitiNodeUser(userList));
		}
	}

	/**
	 * 获取当前节点信息
	 * @param processInstance
	 * @return
	 */
	private Task getCurrentTaskInfo(ProcessInstance processInstance) {
		Task currentTask = null;
		try {
			String activitiId = (String) PropertyUtils.getProperty(processInstance, "activityId");
			logger.debug("current activity id: {}", activitiId);

			currentTask = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskDefinitionKey(activitiId)
					.singleResult();
			logger.debug("current task for processInstance: {}", ToStringBuilder.reflectionToString(currentTask));

		} catch (Exception e) {
			logger.error("can not get property activityId from processInstance: {}", processInstance);
		}
		return currentTask;
	}

	/**
	 * 设置宽度、高度属性
	 * @param activity
	 * @param activityInfo
	 */
	private void setWidthAndHeight(ActivityImpl activity, Map<String, Object> activityInfo) {
		activityInfo.put("width", activity.getWidth());
		activityInfo.put("height", activity.getHeight());
	}

	/**
	 * 设置坐标位置
	 * @param activity
	 * @param activityInfo
	 */
	private void setPosition(ActivityImpl activity, Map<String, Object> activityInfo) {
		activityInfo.put("x", activity.getX());
		activityInfo.put("y", activity.getY());
	}
	
}
