/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.service;

import java.util.List;


import com.jeedcp.common.service.TreeService;
import com.jeedcp.common.utils.StringUtils;
import com.jeedcp.weixin.dao.WeixinMenuDao;
import com.jeedcp.weixin.entity.WeixinMenu;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 微信菜单Service
 * @author jeedcp
 * @version 2016-09-20
 */
@Service
@Transactional(readOnly = true)
public class WeixinMenuService extends TreeService<WeixinMenuDao, WeixinMenu> {

	public WeixinMenu get(String id) {
		return super.get(id);
	}
	
	public List<WeixinMenu> findList(WeixinMenu weixinMenu) {
		if (StringUtils.isNotBlank(weixinMenu.getParentIds())){
			weixinMenu.setParentIds(","+weixinMenu.getParentIds()+",");
		}
		return super.findList(weixinMenu);
	}
	
	@Transactional(readOnly = false)
	public void save(WeixinMenu weixinMenu) {
		super.save(weixinMenu);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeixinMenu weixinMenu) {
		super.delete(weixinMenu);
	}
	
}