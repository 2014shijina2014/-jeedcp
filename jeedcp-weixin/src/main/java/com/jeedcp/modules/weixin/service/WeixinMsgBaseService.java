/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.modules.weixin.service;

import java.util.List;


import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.common.service.CrudService;
import com.jeedcp.modules.weixin.entity.WeixinMsgBase;
import com.jeedcp.modules.weixin.dao.WeixinMsgBaseDao;
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
	
	public Pagination<WeixinMsgBase> findPage(Pagination<WeixinMsgBase> page, WeixinMsgBase weixinMsgBase) {
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