/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.modules.weixin.service;

import java.util.List;

import com.jeedcp.common.service.CrudService;
import com.jeedcp.modules.weixin.dao.WeixinMsgTextDao;
import com.jeedcp.modules.weixin.entity.WeixinMsgText;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 微信文本消息Service
 * @author jeedcp
 * @version 2016-09-19
 */
@Service
@Transactional(readOnly = true)
public class WeixinMsgTextService extends CrudService<WeixinMsgTextDao, WeixinMsgText> {

	public WeixinMsgText get(String id) {
		return super.get(id);
	}
	
	public List<WeixinMsgText> findList(WeixinMsgText weixinMsgText) {
		return super.findList(weixinMsgText);
	}
	

	
	@Transactional(readOnly = false)
	public void save(WeixinMsgText weixinMsgText) {
		super.save(weixinMsgText);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeixinMsgText weixinMsgText) {
		super.delete(weixinMsgText);
	}
	
}