/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.service;

import java.util.List;

import com.jeedcp.weixin.dao.WeixinMsgNewsDao;
import com.jeedcp.weixin.entity.WeixinMsgNews;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeedcp.common.model.Page;
import com.jeedcp.service.base.CrudService;


/**
 * 微信图文Service
 * @author jeedcp
 * @version 2016-09-19
 */
@Service
@Transactional(readOnly = true)
public class WeixinMsgNewsService extends CrudService<WeixinMsgNewsDao, WeixinMsgNews> {

	public WeixinMsgNews get(String id) {
		return super.get(id);
	}
	
	public List<WeixinMsgNews> findList(WeixinMsgNews weixinMsgNews) {
		return super.findList(weixinMsgNews);
	}
	
	public Page<WeixinMsgNews> findPage(Page<WeixinMsgNews> page, WeixinMsgNews weixinMsgNews) {
		return super.findPage(page, weixinMsgNews);
	}
	
	@Transactional(readOnly = false)
	public void save(WeixinMsgNews weixinMsgNews) {
		super.save(weixinMsgNews);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeixinMsgNews weixinMsgNews) {
		super.delete(weixinMsgNews);
	}
	
}