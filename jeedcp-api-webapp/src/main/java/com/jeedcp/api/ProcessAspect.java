package com.jeedcp.api;

import java.io.IOException;
import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.jeedcp.api.annotation.ApiMethod;
import com.jeedcp.api.message.ErrorFactory;
import com.jeedcp.api.message.ErrorType;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 接口处理类,采用Spring AOP around
 * @author jeedcp
 *
 */
public class ProcessAspect {
	
	protected static Logger logger = LoggerFactory.getLogger(ProcessAspect.class);
	
	private AppSecretManager appSecretManager;
	private List<Interceptor> processors = new ArrayList<Interceptor>();
	
	public ProcessAspect() {
		ErrorFactory.initMessageSource();
	}
	
	/**
	 * AOP处理方法
	 * @param joinPoint
	 * @return
	 */
	public Object process(ProceedingJoinPoint joinPoint){
		
		RequestContext requestContext = buildApiRequestContext(joinPoint);
		
		if(isApiMethod(joinPoint)){
		
			logger.info("^^^请求URL:{},参数:{}" , requestContext.getRequestURL(),OpenUtil.getRequestParamStr(requestContext.getRequest()));
			
			validate(requestContext);
			
			try {
				execBeforeProcessors(requestContext);
				return joinPoint.proceed();
			} catch (Throwable e) {
				logger.error("服务调用出错",e);
				throw new OpenException(ErrorFactory.getError(ErrorType.BUSINESS_LOGIC_ERROR, requestContext.getLocale(), requestContext.getRequestPath()));
			}finally{
				requestContext.setServerEndTime(System.currentTimeMillis());
				logger.info("^^^执行接口服务结束,耗时:" + requestContext.getApiExecTime() + "毫秒");
				execAfterProcessors(requestContext);
			}
		}
		logger.error("---无效接口请求({})",requestContext.getRequestURL());
		throw new OpenException(ErrorFactory.getError(ErrorType.INVALID_METHOD, requestContext.getLocale(), requestContext.getRequestPath()));
	}

	private boolean isApiMethod(ProceedingJoinPoint joinPoint){
		return this.getMethodAnno(joinPoint) != null;
	}
	
	private Annotation getMethodAnno(JoinPoint joinPoint){
		return ((MethodSignature)joinPoint.getSignature()).getMethod().getAnnotation(ApiMethod.class);
	}
	
	private void execBeforeProcessors(RequestContext requestContext){
		for (Interceptor apiProcessor : processors) {
			if(apiProcessor.isMatch(requestContext)){
				apiProcessor.beforeService(requestContext);
			}
		}
	}
	
	private void execAfterProcessors(RequestContext requestContext){
		for (Interceptor apiProcessor : processors) {
			if(apiProcessor.isMatch(requestContext)){
				apiProcessor.afterService(requestContext);
			}
		}
	}
	
	// 构建接口请求上下文
	private RequestContext buildApiRequestContext(JoinPoint joinPoint){
		RequestContext requestContext = new RequestContext();
		HttpServletRequest request = OpenContext.getInstance().getRequest();
		
		requestContext.setRequest(request);
		requestContext.setMethodName(joinPoint.getSignature().getName());
		
		Annotation apiAnno = this.getMethodAnno(joinPoint);
		if(apiAnno == null) {
			return requestContext;
		}
		ApiMethod apiMethod = (ApiMethod)apiAnno;
		requestContext.setNeedSign(apiMethod.needSign());
		requestContext.setNeedTimeout(apiMethod.needTimeout());
		requestContext.setTimeout(apiMethod.timeout());
		requestContext.setAppIdName(apiMethod.appIdName());
		requestContext.setSignName(apiMethod.signName());
		requestContext.setTimestampName(apiMethod.timestampName());
		
		String appId = requestContext.getParamValue(requestContext.getAppIdName());
		String sign = requestContext.getParamValue(requestContext.getSignName());
		long timestamp = 0;
		
		try{
			String timestampStr = requestContext.getParamValue(requestContext.getTimestampName());
			timestamp = Long.parseLong(timestampStr);
		}catch(Exception e){}
		
		requestContext.setAppId(appId);
		requestContext.setSign(sign);
		requestContext.setTimestamp(timestamp);
		
		requestContext.setMethodArgu(getRequestArgu(joinPoint));
		
		return requestContext;
	}
	
	// 验证参数
	private void validate(RequestContext requestContext) {
		if(requestContext.isNeedTimeout()) {
			this.checkTimeout(requestContext);
		}
		// 验证签名
		this.checkSign(requestContext);
		
		this.validateArgu(requestContext);
	}
	
	private void validateArgu(RequestContext requestContext) {
		Object argu = requestContext.getMethodArgu();
		if(argu != null) {
			// 验证字段
			ValidateHolder validateHolder = ValidateUtil.validate(argu);
			if(!validateHolder.isSuccess()){ // 验证字段失败
				String errorMsg = buildErrorMsg(validateHolder);
				logger.error("{}请求({})参数验证失败:{}",new Object[]{requestContext.getAppId(),requestContext.getRequestPath(),errorMsg});
				throw new OpenException(ErrorFactory.getError(ErrorType.INVALID_ARGUMENTS, requestContext.getLocale()));
			}
		}
	}
	
	// 验证超时
	private void checkTimeout(RequestContext requestContext){
		boolean isOvertimeout = (requestContext.getServerStartTime() - requestContext.getTimestamp()) > requestContext.getTimeout();
		if(isOvertimeout){
			throw new OpenException(ErrorFactory.getError(ErrorType.REQEST_TIMEOUT, requestContext.getLocale(),requestContext.getRequestPath(), requestContext.getTimeout()));
		}
	}
	
	private Object getRequestArgu(JoinPoint joinPoint){
		Object[] argus = joinPoint.getArgs();
		
		if(argus.length > 0){
			return argus[0];
		}
		
		return null;
	}
	
	// 构建错误信息
	private String buildErrorMsg(ValidateHolder validateHolder){
		List<String> errorMsgList = validateHolder.buildValidateErrors();
		StringBuilder msg = new StringBuilder();
		for (String errorMsg : errorMsgList) {
			msg.append(";").append(errorMsg);
		}
		return msg.substring(1).toString();
	}
	
	// 是否有效appId
	private void checkAppId(RequestContext requestContext) {
		String appId = requestContext.getAppId();
		if(appId == null) {
			throw new OpenException(ErrorFactory.getError(ErrorType.MISSING_APP_KEY, requestContext.getLocale(),requestContext.getRequestPath(), requestContext.getAppIdName()));
		}
		boolean isTrueAppId = appSecretManager.isValidAppId(appId);
		if(!isTrueAppId) {
			throw new OpenException(ErrorFactory.getError(ErrorType.INVALID_APP_KEY, requestContext.getLocale(),requestContext.getRequestPath(), appId));
		}
	}
	
	// 检查签名
	private void checkSign(RequestContext requestContext){
		if(!requestContext.isNeedSign()) { // 不需要验证签名
			logger.info("请求服务{}不需要验证签名",requestContext.getRequestPath());
			return;
		}
		if(logger.isDebugEnabled()){
			logger.debug("===开始验证签名");
		}
		
		this.checkAppId(requestContext);
		
		String clientSign = requestContext.getSign();
		if(clientSign == null) {
			throw new OpenException(ErrorFactory.getError(ErrorType.MISSING_SIGNATURE, requestContext.getLocale(),requestContext.getRequestPath(), requestContext.getSignName()));
		}
		String secret = appSecretManager.getSecret(requestContext.getAppId());
		Map<String,String> checkSignParam = this.buildCheckSignParam(requestContext);
		
		boolean isTrueSign = false;
		try {
			String serverSign = OpenUtil.buildSign(checkSignParam, secret);
			isTrueSign = serverSign.equals(clientSign);
			logger.info("^^^签名验证结果:" + isTrueSign + ",客户端签名:" + clientSign + ",服务端签名:" + serverSign);
			
		} catch (IOException e) {
			logger.error("---构建签名出错.secret=" + secret,e);
			isTrueSign = false;
		}
		
		if(!isTrueSign) {
			throw new OpenException(ErrorFactory.getError(ErrorType.INVALID_SIGNATURE, requestContext.getLocale(),requestContext.getRequestPath()));
		}
	}
	
	private Map<String,String> buildCheckSignParam(RequestContext requestContext) {
		Map<String, String> checkSignParam = new HashMap<String, String>(2);
		checkSignParam.put(requestContext.getAppIdName(), requestContext.getAppId());
		checkSignParam.put(requestContext.getTimestampName(), String.valueOf(requestContext.getTimestamp()));
		return checkSignParam;
	}
	
	public void setAppSecretManager(AppSecretManager appSecretManager) {
		this.appSecretManager = appSecretManager;
	}

	public void setProcessors(List<Interceptor> processors) {
		this.processors = processors;
	}
	
}
