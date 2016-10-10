/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.service;

import java.util.List;

import com.jeedcp.weixin.dao.WeixinReceiveTextDao;
import com.jeedcp.weixin.entity.WeixinReceiveText;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeedcp.common.model.Page;
import com.jeedcp.service.base.CrudService;


/**
 * 微信接收信息Service
 * @author jeedcp
 * @version 2016-09-21
 */
@Service
@Transactional(readOnly = true)
public class WeixinReceiveTextService extends CrudService<WeixinReceiveTextDao, WeixinReceiveText> {

	public WeixinReceiveText get(String id) {
		return super.get(id);
	}
	
	public List<WeixinReceiveText> findList(WeixinReceiveText weixinReceiveText) {
		return super.findList(weixinReceiveText);
	}
	
	public Page<WeixinReceiveText> findPage(Page<WeixinReceiveText> page, WeixinReceiveText weixinReceiveText) {
		return super.findPage(page, weixinReceiveText);
	}
	
	@Transactional(readOnly = false)
	public void save(WeixinReceiveText weixinReceiveText) {
		super.save(weixinReceiveText);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeixinReceiveText weixinReceiveText) {
		super.delete(weixinReceiveText);
	}
	
}