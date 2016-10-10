/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.entity;

import org.hibernate.validator.constraints.Length;

import com.jeedcp.entity.base.DataEntity;

/**
 * 微信文本消息Entity
 * @author jeedcp
 * @version 2016-09-19
 */
public class WeixinMsgText  extends DataEntity<WeixinMsgText> {

	private WeixinMsgBase weixinMsgBase;

	private static final long serialVersionUID = 1L;
	private String baseId;		// base_id
	private String baseName;
	private String content;		// 内容
	
	public WeixinMsgText() {
		super();
	}

	public String getBaseName() {
		return baseName;
	}

	public void setBaseName(String baseName) {
		this.baseName = baseName;
	}

	public WeixinMsgText(String id){
		super(id);
	}

	public WeixinMsgBase getWeixinMsgBase() {
		return weixinMsgBase;
	}

	public void setWeixinMsgBase(WeixinMsgBase weixinMsgBase) {
		this.weixinMsgBase = weixinMsgBase;
	}

	@Length(min=1, max=255, message="base_id长度必须介于 1 和 255 之间")
	public String getBaseId() {
		return baseId;
	}

	public void setBaseId(String baseId) {
		this.baseId = baseId;
	}
	
	@Length(min=1, max=255, message="内容长度必须介于 1 和 255 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}