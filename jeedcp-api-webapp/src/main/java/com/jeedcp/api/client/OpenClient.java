package com.jeedcp.api.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.jeedcp.api.OpenUtil;
import org.apache.log4j.Logger;


/**
 * 请求客户端
 * @author jeedcp
 *
 */
public class OpenClient {
	
	private static Logger logger = Logger.getLogger(OpenClient.class);
	
	private String appId;
	private String secret;

	private String appIdName = "appId";
	private String signName = "sign";
	private String timestampName = "timestamp";

	public OpenClient(String appId, String secret) {
		this.appId = appId;
		this.secret = secret;
	}
	
	/**
	 * 发送请求
	 * @param url
	 * @param params
	 * @return 返回XML数据
	 */
	public String postXML(String url,Map<String, String> params) {
		return this.post(url, params, PostUtil.XML);
	}
	
	/**
	 * 发送请求
	 * @param url
	 * @param entity
	 * @return 返回XML数据
	 */
	public String postXML(String url, Object entity) {
		Map<String, String> paramsMap = OpenUtil.buildParamsMap(entity);
		return this.postXML(url, paramsMap);
	}
	
	
	/**
	 * 发送请求
	 * @param url
	 * @param params
	 * @return 返回JSON数据
	 */
	public String postJSON(String url,Map<String, String> params) {
		return this.post(url, params,PostUtil.JSON);
	}
	
	/**
	 * 发送请求
	 * @param url
	 * @param entity
	 * @return 返回JSON数据
	 */
	public String postJSON(String url, Object entity) {
		Map<String, String> paramsMap = OpenUtil.buildParamsMap(entity);
		return this.postJSON(url, paramsMap);
	}
	
	/**
	 * 发送请求
	 * @param url 请求连接
	 * @param params 请求参数
	 * @return 服务端返回的内容
	 */
	private String post(String url,Map<String, String> params,String dataType) {
		params.put(appIdName, this.appId);
		params.put(timestampName, String.valueOf(System.currentTimeMillis()));
		
		String sign = null;
		Map<String, String> checkSignParam = this.buildCheckSignParam();
		try {
			sign = OpenUtil.buildSign(checkSignParam, this.secret);
		} catch (IOException e1) {
			e1.printStackTrace();
			throw new ClientException("签名构建失败");
		}
		
		params.put(signName, sign);
		
		try {
			return PostUtil.post(url, params, dataType);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new ClientException(e.getMessage());
		}
	}
	
	private Map<String,String> buildCheckSignParam() {
		Map<String, String> checkSignParam = new HashMap<String, String>(2);
		checkSignParam.put(appIdName, appId);
		checkSignParam.put(timestampName, String.valueOf(System.currentTimeMillis()));
		return checkSignParam;
	}
	

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
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

}
