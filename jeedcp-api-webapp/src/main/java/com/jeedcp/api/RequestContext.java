package com.jeedcp.api;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 调用接口上下文
 * @author jeedcp
 *
 */
public class RequestContext {
	
	private static final int TWO_MINS = 120 * 1000; // 120秒

	private String appId; // 接入方id
	private String sign; // 数据签名
	private long timestamp; // 时间戳
	private String methodName; // 方法名称
	private HttpServletRequest request;
	private long serverStartTime = System.currentTimeMillis();
	private long serverEndTime;
	private boolean needSign = true; // 是否需要检查签名
	private boolean needTimeout = true; // 是否需要超时检查
	private int timeout = TWO_MINS; // 默认超时时间120秒
	private Object methodArgu;
	
	private String appIdName;
	private String signName;
	private String timestampName;

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public long getApiExecTime() {
		return serverEndTime - serverStartTime;
	}
	
	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	public long getServerStartTime() {
		return serverStartTime;
	}

	public void setServerStartTime(long serverStartTime) {
		this.serverStartTime = serverStartTime;
	}

	public long getServerEndTime() {
		return serverEndTime;
	}

	public void setServerEndTime(long serverEndTime) {
		this.serverEndTime = serverEndTime;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpSession getSession() {
		if(request == null) {
			return null;
		}
		return request.getSession();
	}
	

	public Locale getLocale() {
		return this.request.getLocale();
	}
	
	public String getParamValue(String paramName) {
		return this.request.getParameter(paramName);
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	 * 获取客户端的IP
	 * 
	 * @return
	 */
	public String getIp() {
		return getRealIPAddress(request);
	}
	
	public String getRequestURL(){
		return this.request.getRequestURL().toString();
	}
	
	public boolean isNeedSign() {
		return needSign;
	}

	public void setNeedSign(boolean needSign) {
		this.needSign = needSign;
	}

	public boolean isNeedTimeout() {
		return needTimeout;
	}

	public void setNeedTimeout(boolean needTimeout) {
		this.needTimeout = needTimeout;
	}

	public int getTimeout() {
		return timeout;
	}

	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}
	

	public Object getMethodArgu() {
		return methodArgu;
	}

	public void setMethodArgu(Object methodArgu) {
		this.methodArgu = methodArgu;
	}
	
	public String getAppIdName() {
		return appIdName;
	}

	public void setAppIdName(String appIdName) {
		this.appIdName = appIdName;
	}

	public String getSignName() {
		return signName;
	}

	public void setSignName(String signName) {
		this.signName = signName;
	}

	public String getTimestampName() {
		return timestampName;
	}

	public void setTimestampName(String timestampName) {
		this.timestampName = timestampName;
	}

	/**
	 * 获取客户端的真实地址，支持代理服务器
	 * @author bobdes
	 * @param request
	 * @return
	 */
	private static String getRealIPAddress(HttpServletRequest request){
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if ("0:0:0:0:0:0:0:1".equals(ip)) {
			ip = "127.0.0.1";
		}
		if (ip.split(",").length > 1) {
			ip = ip.split(",")[0];
		}
		return ip;
	}
	
	/**
	 * 获取请求路径,即contextPath后面部分. 如http://www.aaa.com/rms/sys/index.jsp<br>
	 * 返回/sys/index.jsp
	 * 
	 * @param request
	 * @return
	 */
	public String getRequestPath() {
		String result = request.getServletPath();
		String pathInfo = request.getPathInfo();

		if (pathInfo != null) {
			result = result + pathInfo;
		}

		// getServletPath() returns null unless the mapping corresponds to a
		// servlet
		if (result == null) {
			String requestURI = request.getRequestURI();
			if (request.getPathInfo() != null) {
				// strip the pathInfo from the requestURI
				return requestURI.substring(0,
						requestURI.indexOf(request.getPathInfo()));
			} else {
				return requestURI;
			}
		} else if ("".equals(result)) {
			// in servlet 2.4, if a request is mapped to '/*', getServletPath
			// returns null (SIM-130)
			return request.getPathInfo();
		} else {
			return result;
		}
	}



}
