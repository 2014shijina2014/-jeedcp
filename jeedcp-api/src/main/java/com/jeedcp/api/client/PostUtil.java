package com.jeedcp.api.client;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

public class PostUtil {
	
	private static final String UTF8 = "UTF-8";
	public static final String JSON = "json";
	public static final String XML = "xml";
	private static final String HEADER_ACCEPT = "Accept";
	private static List<String> dataTypes = Arrays.asList(JSON,XML);
	
	private static Map<String, String> accepterMap = new HashMap<String, String>(2);
	static {
		accepterMap.put(JSON, "application/json, text/javascript, */*; q=0.01");
		accepterMap.put(XML, "application/xml, text/xml, */*; q=0.01");
	}
	
	public static String postJSON(String url, Map<String, String> params)throws Exception {
		return post(url, params, UTF8, JSON);
	}
	
	public static String postXML(String url, Map<String, String> params)throws Exception {
		return post(url, params, UTF8, XML);
	}
	
	public static String post(String url, Map<String, String> params) throws Exception {
		return post(url, params, UTF8,JSON);
	}
	
	
	/**
	 * @param url 请求的url
	 * @param params 参数Map
	 * @param dateType 请求类型"json"或"xml"
	 * @return 返回响应内容
	 * @throws Exception
	 */
	public static String post(String url, Map<String, String> params,String dateType) throws Exception {
		return post(url, params, UTF8, dateType);
	}
	
	/**
	 * post请求接口
	 * 
	 * @param url
	 *            请求的url
	 * @param params
	 *            参数Map
	 * @param encode
	 *            编码 UTF-8
	 * @return
	 * @throws Exception
	 */
	public static String post(String url, Map<String, String> params,
			String encode,String dateType) throws Exception {
		if(encode == null) {
			encode = UTF8;
		}
		if(!dataTypes.contains(dateType)) {
			dateType = JSON;
		}
		 // 使用 POST 方式提交数据
		PostMethod method = new PostMethod(url);
		try {
			Set<String> keys = params.keySet();
			NameValuePair[] values = new NameValuePair[keys.size()];
			int i = 0;
			for (String key : keys) {
				NameValuePair v = new NameValuePair();
				v.setName(key);
				v.setValue(params.get(key));
				values[i++] = v;
			}
			
			method.setRequestBody(values);
			method.setRequestHeader(HEADER_ACCEPT, accepterMap.get(dateType));
			
			HttpClient client = new HttpClient();
			client.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, encode);
			
			int state = client.executeMethod(method); // 返回的状态
			
			if (state != HttpStatus.SC_OK) {
				throw new Exception("HttpStatus is " + state);
			}
			
			String response = method.getResponseBodyAsString();

			response = new String(response.getBytes(encode), encode);
			
			return response; // response就是最后得到的结果
		} catch (Exception e) {
			throw e;
		} finally {
			method.releaseConnection();
		}
	}
	
}
