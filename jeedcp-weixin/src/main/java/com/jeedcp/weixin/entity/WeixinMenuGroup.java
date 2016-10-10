/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.entity;

import org.hibernate.validator.constraints.Length;

import com.jeedcp.common.persistence.DataEntity;

/**
 * 菜单组Entity
 * @author jeedcp
 * @version 2016-09-19
 */
public class WeixinMenuGroup extends DataEntity<WeixinMenuGroup> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String accountId;		// 所属公众账号
	private String accountName;

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public WeixinMenuGroup() {
		super();
	}

	public WeixinMenuGroup(String id){
		super(id);
	}

	@Length(min=1, max=255, message="名称长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=255, message="所属公众账号长度必须介于 1 和 255 之间")
	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	
}