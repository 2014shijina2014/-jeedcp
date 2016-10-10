/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.service;

import java.util.List;

import com.jeedcp.common.model.Page;
import com.jeedcp.service.base.CrudService;
import com.jeedcp.weixin.dao.WeixinFansDao;
import com.jeedcp.weixin.entity.WeixinFans;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



/**
 * 微信粉丝Service
 * @author jeedcp
 * @version 2016-09-20
 */
@Service
@Transactional(readOnly = true)
public class WeixinFansService extends CrudService<WeixinFansDao, WeixinFans> {

	public WeixinFans get(String id) {
		return super.get(id);
	}
	
	public List<WeixinFans> findList(WeixinFans weixinFans) {
		return super.findList(weixinFans);
	}
	
	public Page<WeixinFans> findPage(Page<WeixinFans> page, WeixinFans weixinFans) {
		return super.findPage(page, weixinFans);
	}
	
	@Transactional(readOnly = false)
	public void save(WeixinFans weixinFans) {
		super.save(weixinFans);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeixinFans weixinFans) {
		super.delete(weixinFans);
	}

	@Transactional(readOnly = false)
	public int deleteByAccountID(String accountId){
		return dao.deleteByAccountID(accountId);
	}
}