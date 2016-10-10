/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.modules.weixin.service;

import java.util.List;

import com.jeedcp.common.service.CrudService;
import com.jeedcp.modules.weixin.entity.WeixinReceiveText;
import com.jeedcp.modules.weixin.dao.WeixinReceiveTextDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




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
	

	@Transactional(readOnly = false)
	public void save(WeixinReceiveText weixinReceiveText) {
		super.save(weixinReceiveText);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeixinReceiveText weixinReceiveText) {
		super.delete(weixinReceiveText);
	}
	
}