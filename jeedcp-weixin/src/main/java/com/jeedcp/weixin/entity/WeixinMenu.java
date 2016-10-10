/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.entity;

import com.jeedcp.common.persistence.TreeEntity;
import org.hibernate.validator.constraints.Length;
import com.fasterxml.jackson.annotation.JsonBackReference;


/**
 * 微信菜单Entity
 * @author jeedcp
 * @version 2016-09-20
 */
public class WeixinMenu extends TreeEntity<WeixinMenu> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String mtype;		// 菜单类型
	private String eventtype;		// 事件类型
	private String inputcode;		// 关键字
	private String url;		// URL
	private String picpath;		// 图片地址
	private Integer sort;		// 排序
	private WeixinMenu parent;		// 父ID
	private String parentIds;		// 父集合
	private String msgId;		// msgId
	private String groupId;		// 所属组
	private String groupName;

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public WeixinMenu() {
		super();
	}

	public WeixinMenu(String id){
		super(id);
	}

	@Length(min=1, max=255, message="名称长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="菜单类型长度必须介于 0 和 64 之间")
	public String getMtype() {
		return mtype;
	}

	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	
	@Length(min=0, max=255, message="事件类型长度必须介于 0 和 255 之间")
	public String getEventtype() {
		return eventtype;
	}

	public void setEventtype(String eventtype) {
		this.eventtype = eventtype;
	}
	
	@Length(min=0, max=255, message="关键字长度必须介于 0 和 255 之间")
	public String getInputcode() {
		return inputcode;
	}

	public void setInputcode(String inputcode) {
		this.inputcode = inputcode;
	}
	
	@Length(min=0, max=255, message="URL长度必须介于 0 和 255 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=255, message="图片地址长度必须介于 0 和 255 之间")
	public String getPicpath() {
		return picpath;
	}

	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}
	
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	@JsonBackReference
	public WeixinMenu getParent() {
		return parent;
	}

	public void setParent(WeixinMenu parent) {
		this.parent = parent;
	}
	
	@Length(min=1, max=255, message="父集合长度必须介于 1 和 255 之间")
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@Length(min=0, max=255, message="msgId长度必须介于 0 和 255 之间")
	public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	
	@Length(min=0, max=255, message="所属组长度必须介于 0 和 255 之间")
	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	
	public String getParentId() {
		return parent != null && parent.getId() != null ? parent.getId() : "0";
	}
}