/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.modules.weixin.entity;

import org.hibernate.validator.constraints.Length;

import com.jeedcp.common.persistence.DataEntity;

/**
 * 微信接收信息Entity
 * @author jeedcp
 * @version 2016-09-21
 */
public class WeixinReceiveText extends DataEntity<WeixinReceiveText> {
	
	private static final long serialVersionUID = 1L;
	private String content;		// 内容
	private String fromusername;		// fromusername
	private String msgid;		// msgid
	private String msgtype;		// msgtype
	private String rescontent;		// 回复内容
	private String response;		// response
	private String tousername;		// tousername
	private String accountId;		// 公众账号
	private String nickname;		// nickname
	private String accountName;

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public WeixinReceiveText() {
		super();
	}

	public WeixinReceiveText(String id){
		super(id);
	}

	@Length(min=1, max=64, message="内容长度必须介于 1 和 64 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=1, max=255, message="fromusername长度必须介于 1 和 255 之间")
	public String getFromusername() {
		return fromusername;
	}

	public void setFromusername(String fromusername) {
		this.fromusername = fromusername;
	}
	
	@Length(min=0, max=255, message="msgid长度必须介于 0 和 255 之间")
	public String getMsgid() {
		return msgid;
	}

	public void setMsgid(String msgid) {
		this.msgid = msgid;
	}
	
	@Length(min=0, max=255, message="msgtype长度必须介于 0 和 255 之间")
	public String getMsgtype() {
		return msgtype;
	}

	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}
	
	@Length(min=0, max=255, message="回复内容长度必须介于 0 和 255 之间")
	public String getRescontent() {
		return rescontent;
	}

	public void setRescontent(String rescontent) {
		this.rescontent = rescontent;
	}
	
	@Length(min=0, max=255, message="response长度必须介于 0 和 255 之间")
	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}
	
	@Length(min=0, max=255, message="tousername长度必须介于 0 和 255 之间")
	public String getTousername() {
		return tousername;
	}

	public void setTousername(String tousername) {
		this.tousername = tousername;
	}
	
	@Length(min=0, max=255, message="公众账号长度必须介于 0 和 255 之间")
	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	
	@Length(min=0, max=64, message="nickname长度必须介于 0 和 64 之间")
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}