/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.entity;

import com.jeedcp.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;


/**
 * 公众账号管理Entity
 * @author jeedcp
 * @version 2016-09-19
 */
public class WeixinAccount extends DataEntity<WeixinAccount> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 公众帐号名称
	private String account;		// 公众帐号
	private String appid;		// appid
	private String appsecret;		// appsecret
	private String url;		// URL
	private String token;		// Token
	private int msgcount;		// msgCount
	
	public WeixinAccount() {
		super();
	}

	public WeixinAccount(String id){
		super(id);
	}

	@Length(min=1, max=64, message="公众帐号名称长度必须介于 1 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=255, message="公众帐号长度必须介于 1 和 255 之间")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	@Length(min=0, max=255, message="appid长度必须介于 0 和 255 之间")
	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}
	
	@Length(min=0, max=255, message="appsecret长度必须介于 0 和 255 之间")
	public String getAppsecret() {
		return appsecret;
	}

	public void setAppsecret(String appsecret) {
		this.appsecret = appsecret;
	}
	
	@Length(min=0, max=255, message="URL长度必须介于 0 和 255 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=1, max=255, message="Token长度必须介于 1 和 255 之间")
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getMsgcount() {
		return msgcount;
	}

	public void setMsgcount(int msgcount) {
		this.msgcount = msgcount;
	}
}