/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.service;

import java.util.List;

import com.jeedcp.common.model.Page;
import com.jeedcp.service.base.CrudService;
import com.jeedcp.weixin.dao.WeixinAccountDao;
import com.jeedcp.weixin.entity.WeixinAccount;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



/**
 * 公众账号管理Service
 * @author jeedcp
 * @version 2016-09-19
 */
@Service
@Transactional(readOnly = true)
public class WeixinAccountService extends CrudService<WeixinAccountDao, WeixinAccount> {

	public WeixinAccount get(String id) {
		return super.get(id);
	}
	
	public List<WeixinAccount> findList(WeixinAccount weixinAccount) {
		return super.findList(weixinAccount);
	}
	
	public Page<WeixinAccount> findPage(Page<WeixinAccount> page, WeixinAccount weixinAccount) {
		return super.findPage(page, weixinAccount);
	}
	
	@Transactional(readOnly = false)
	public void save(WeixinAccount weixinAccount) {
		super.save(weixinAccount);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeixinAccount weixinAccount) {
		super.delete(weixinAccount);
	}
	
}