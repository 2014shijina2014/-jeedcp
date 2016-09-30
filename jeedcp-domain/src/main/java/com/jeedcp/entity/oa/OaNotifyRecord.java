package com.jeedcp.entity.oa;

import org.hibernate.validator.constraints.Length;

import com.jeedcp.entity.base.DataEntity;
import com.jeedcp.entity.sys.User;
import java.util.Date;


/**
 * 通知通告记录Entity
 * @author Andy
 * @version 2016-03-19
 */
public class OaNotifyRecord extends DataEntity<OaNotifyRecord> {
	
	private static final long serialVersionUID = 1L;
	private OaNotify oaNotify;		// 通知通告ID
	private User user;		   // 接受人
	private String readFlag;		// 阅读标记（0：未读；1：已读）
	private Date readDate;		// 阅读时间
	
	
	public OaNotifyRecord() {
		super();
	}

	public OaNotifyRecord(String id){
		super(id);
	}
	
	public OaNotifyRecord(OaNotify oaNotify){
		this.oaNotify = oaNotify;
	}

	public OaNotify getOaNotify() {
		return oaNotify;
	}

	public void setOaNotify(OaNotify oaNotify) {
		this.oaNotify = oaNotify;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=1, message="阅读标记（0：未读；1：已读）长度必须介于 0 和 1 之间")
	public String getReadFlag() {
		return readFlag;
	}

	public void setReadFlag(String readFlag) {
		this.readFlag = readFlag;
	}
	
	public Date getReadDate() {
		return readDate;
	}

	public void setReadDate(Date readDate) {
		this.readDate = readDate;
	}
	
}