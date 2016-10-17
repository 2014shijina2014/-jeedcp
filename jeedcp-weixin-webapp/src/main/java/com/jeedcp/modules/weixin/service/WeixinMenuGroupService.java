/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.modules.weixin.service;

import java.util.List;


import com.jeedcp.common.persistence.Page;
import com.jeedcp.common.service.CrudService;
import com.jeedcp.modules.weixin.dao.WeixinMenuGroupDao;
import com.jeedcp.modules.weixin.entity.WeixinMenu;
import com.jeedcp.modules.weixin.entity.WeixinMenuGroup;
import com.jeedcp.modules.weixin.dao.WeixinMenuDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 菜单组Service
 * @author jeedcp
 * @version 2016-09-19
 */
@Service
@Transactional(readOnly = true)
public class WeixinMenuGroupService extends CrudService<WeixinMenuGroupDao, WeixinMenuGroup> {

	@Autowired
	public WeixinMenuDao menuDao;

	public WeixinMenuGroup get(String id) {
		return super.get(id);
	}
	
	public List<WeixinMenuGroup> findList(WeixinMenuGroup weixinMenuGroup) {
		return super.findList(weixinMenuGroup);
	}
	
	public Page<WeixinMenuGroup> findPage(Page<WeixinMenuGroup> page, WeixinMenuGroup weixinMenuGroup) {
		return super.findPage(page, weixinMenuGroup);
	}
	
	@Transactional(readOnly = false)
	public void save(WeixinMenuGroup weixinMenuGroup) {
		super.save(weixinMenuGroup);
	}
	
	@Transactional(readOnly = false)
	public void delete(WeixinMenuGroup weixinMenuGroup) {
		//删除组的同时也删除组下的所有的菜单
		WeixinMenu parmas = new WeixinMenu();
		parmas.setGroupId(weixinMenuGroup.getId());
		List<WeixinMenu> menus = menuDao.findList(parmas);
		for(WeixinMenu po :menus){
			menuDao.delete(po);
		}

		super.delete(weixinMenuGroup);
	}
	
}