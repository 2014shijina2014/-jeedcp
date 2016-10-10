/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.service;

import java.util.List;

import com.jeedcp.common.model.Page;
import com.jeedcp.service.base.CrudService;
import com.jeedcp.weixin.dao.WeixinMessageDao;
import com.jeedcp.weixin.entity.WeixinMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



/**
 * 微信推送信息Service
 * @author jeedcp
 * @version 2016-09-20
 */
@Service
@Transactional(readOnly = true)
public class WeixinMessageService extends CrudService<WeixinMessageDao, WeixinMessage> {

	public WeixinMessage get(String id) {
		return super.get(id);
	}
	
	public List<WeixinMessage> findList(WeixinMessage weixinMessage) {
		return super.findList(weixinMessage);
	}
	
	public Page<WeixinMessage> findPage(Page<WeixinMessage> page, WeixinMessage weixinMessage) {
		return super.findPage(page, weixinMessage);
	}
	
	@Transactional(readOnly = false)
	public void save(WeixinMessage weixinMessage) {
		super.save(weixinMessage);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeixinMessage weixinMessage) {
		super.delete(weixinMessage);
	}
	
}