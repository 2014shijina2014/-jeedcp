package com.jeedcp.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public enum OpenContext {
	INSTANCE;
	
	private ThreadLocal<HttpServletRequest> request = new ThreadLocal<HttpServletRequest>();
	private ThreadLocal<HttpServletResponse> response = new ThreadLocal<HttpServletResponse>();
	
	public static OpenContext getInstance() {
		return INSTANCE;
	}
	
	public void setRequest(HttpServletRequest req) {
		request.set(req);
	}
	
	public HttpServletRequest getRequest() {
		return request.get();
	}
	
	public HttpServletResponse getResponse() {
		return response.get();
	}

	public void setResponse(HttpServletResponse resp) {
		response.set(resp);
	}

	public void resetRquest() {
		request.remove();
	}
	
	public void setAttr(String key,Object value){
		this.getSession().setAttribute(key, value);
	}
	
	public Object getAttr(String key){
		return this.getSession().getAttribute(key);
	}
	
	public HttpSession getSession() {
		if(getRequest() != null) {
			return getRequest().getSession();
		}
		return null;
	}
	
}
