/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.modules.weixin.entity;

import org.hibernate.validator.constraints.Length;

import com.jeedcp.common.persistence.DataEntity;

import java.io.UnsupportedEncodingException;

/**
 * 微信粉丝Entity
 * @author jeedcp
 * @version 2016-09-20
 */
public class WeixinFans extends DataEntity<WeixinFans> {
	
	private static final long serialVersionUID = 1L;
	private String accountId;		// 所属公众号
	private String openid;		// openid
	private String subscribestatus;		// 关注状态
	private String subscribetime;		// 关注时间
	private byte[] nickname;//昵称,二进制保存emoji表情
	private String nicknameStr;//昵称显示
	private String picpath;		// 图片地址
	private String gender;		// 性别
	private String language;		// 语言
	private String country;		// 国家
	private String province;		// 省
	private String city;		// 市
	private String headimgurl;		// 头像
	private String wxid;		// 微信ID
	private String accountName;

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public WeixinFans() {
		super();
	}

	public WeixinFans(String id){
		super(id);
	}

	@Length(min=0, max=64, message="所属公众号长度必须介于 0 和 64 之间")
	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	
	@Length(min=0, max=100, message="openid长度必须介于 0 和 100 之间")
	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}
	
	@Length(min=0, max=1, message="关注状态长度必须介于 0 和 1 之间")
	public String getSubscribestatus() {
		return subscribestatus;
	}

	public void setSubscribestatus(String subscribestatus) {
		this.subscribestatus = subscribestatus;
	}
	
	@Length(min=0, max=255, message="关注时间长度必须介于 0 和 255 之间")
	public String getSubscribetime() {
		return subscribetime;
	}

	public void setSubscribetime(String subscribetime) {
		this.subscribetime = subscribetime;
	}

	public byte[] getNickname() {
		return nickname;
	}
	public void setNickname(byte[] nickname) {
		this.nickname = nickname;
	}
	public String getNicknameStr() {
		if(this.getNickname() != null){
			try {
				this.nicknameStr = new String(this.getNickname(),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return nicknameStr;
	}
	public void setNicknameStr(String nicknameStr) {
		this.nicknameStr = nicknameStr;
	}
	
	@Length(min=0, max=255, message="图片地址长度必须介于 0 和 255 之间")
	public String getPicpath() {
		return picpath;
	}

	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}
	
	@Length(min=0, max=4, message="性别长度必须介于 0 和 4 之间")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Length(min=0, max=255, message="语言长度必须介于 0 和 255 之间")
	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}
	
	@Length(min=0, max=255, message="国家长度必须介于 0 和 255 之间")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	@Length(min=0, max=255, message="省长度必须介于 0 和 255 之间")
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	
	@Length(min=0, max=255, message="市长度必须介于 0 和 255 之间")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Length(min=0, max=1000, message="头像长度必须介于 0 和 1000 之间")
	public String getHeadimgurl() {
		return headimgurl;
	}

	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}
	
	@Length(min=0, max=255, message="微信ID长度必须介于 0 和 255 之间")
	public String getWxid() {
		return wxid;
	}

	public void setWxid(String wxid) {
		this.wxid = wxid;
	}
	
}