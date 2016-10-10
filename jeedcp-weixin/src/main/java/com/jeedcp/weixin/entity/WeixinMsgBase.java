/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.entity;

import org.hibernate.validator.constraints.Length;

import com.jeedcp.entity.base.DataEntity;

/**
 * 微信关键词生Entity
 * @author jeedcp
 * @version 2016-09-19
 */
public class WeixinMsgBase extends DataEntity<WeixinMsgBase> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String msgtype;		// 文本类型
	private String inputcode;		// 关键字
	private String rule;		// 规则
	private String enable;		// 状态
	private Integer readcount;		// 发送数量
	private Integer favourcount;		// 关注数量
	private String accountId;		// 微信账号ID
	private String accountName;

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public WeixinMsgBase() {
		super();
	}

	public WeixinMsgBase(String id){
		super(id);
	}

	@Length(min=1, max=255, message="名称长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=64, message="文本类型长度必须介于 1 和 64 之间")
	public String getMsgtype() {
		return msgtype;
	}

	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}
	
	@Length(min=1, max=255, message="关键字长度必须介于 1 和 255 之间")
	public String getInputcode() {
		return inputcode;
	}

	public void setInputcode(String inputcode) {
		this.inputcode = inputcode;
	}
	
	@Length(min=0, max=255, message="规则长度必须介于 0 和 255 之间")
	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}
	
	@Length(min=0, max=255, message="状态长度必须介于 0 和 255 之间")
	public String getEnable() {
		return enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
	}
	
	public Integer getReadcount() {
		return readcount;
	}

	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
	
	public Integer getFavourcount() {
		return favourcount;
	}

	public void setFavourcount(Integer favourcount) {
		this.favourcount = favourcount;
	}
	
	@Length(min=0, max=255, message="微信账号ID长度必须介于 0 和 255 之间")
	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	
}