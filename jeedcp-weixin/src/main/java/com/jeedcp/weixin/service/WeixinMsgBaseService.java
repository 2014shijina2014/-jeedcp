/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.service;

import java.util.List;

import com.jeedcp.common.model.Page;
import com.jeedcp.service.base.CrudService;
import com.jeedcp.weixin.dao.WeixinMsgBaseDao;
import com.jeedcp.weixin.entity.WeixinMsgBase;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



/**
 * 微信关键词生Service
 * @author jeedcp
 * @version 2016-09-19
 */
@Service
@Transactional(readOnly = true)
public class WeixinMsgBaseService extends CrudService<WeixinMsgBaseDao, WeixinMsgBase> {

	public WeixinMsgBase get(String id) {
		return super.get(id);
	}
	
	public List<WeixinMsgBase> findList(WeixinMsgBase weixinMsgBase) {
		return super.findList(weixinMsgBase);
	}
	
	public Page<WeixinMsgBase> findPage(Page<WeixinMsgBase> page, WeixinMsgBase weixinMsgBase) {
		return super.findPage(page, weixinMsgBase);
	}
	
	@Transactional(readOnly = false)
	public void save(WeixinMsgBase weixinMsgBase) {
		super.save(weixinMsgBase);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeixinMsgBase weixinMsgBase) {
		super.delete(weixinMsgBase);
	}
	
}