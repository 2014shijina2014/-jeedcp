/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.modules.weixin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeedcp.common.config.Global;

import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.common.utils.StringUtils;
import com.jeedcp.common.web.BaseController;
import com.jeedcp.modules.weixin.entity.WeixinAccount;
import com.jeedcp.modules.weixin.service.WeixinAccountService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



/**
 * 公众账号管理Controller
 * @author jeedcp
 * @version 2016-09-19
 */
@Controller
@RequestMapping(value = "${adminPath}/weixin/weixinAccount")
public class WeixinAccountController extends BaseController {

	@Autowired
	private WeixinAccountService weixinAccountService;
	
	@ModelAttribute
	public WeixinAccount get(@RequestParam(required=false) String id) {
		WeixinAccount entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = weixinAccountService.get(id);
		}
		if (entity == null){
			entity = new WeixinAccount();
		}
		return entity;
	}
	
	@RequiresPermissions("weixin:weixinAccount:view")
	@RequestMapping(value = {"list", ""})
	public String list(WeixinAccount weixinAccount, HttpServletRequest request, HttpServletResponse response, Model model) {
		Pagination<WeixinAccount> page = weixinAccountService.findPage(new Pagination<WeixinAccount>(request, response), weixinAccount);
		model.addAttribute("page", page);
		return "modules/weixin/weixinAccountList";
	}

	@RequiresPermissions("weixin:weixinAccount:view")
	@RequestMapping(value = "form")
	public String form(WeixinAccount weixinAccount, Model model) {
		model.addAttribute("weixinAccount", weixinAccount);
		return "modules/weixin/weixinAccountForm";
	}

	@RequiresPermissions("weixin:weixinAccount:edit")
	@RequestMapping(value = "save")
	public String save(WeixinAccount weixinAccount, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, weixinAccount)){
			return form(weixinAccount, model);
		}
		weixinAccountService.save(weixinAccount);
		addMessage(redirectAttributes, "保存公众账号管理成功");
		return "redirect:"+ Global.getAdminPath()+"/weixin/weixinAccount/?repage";
	}
	
	@RequiresPermissions("weixin:weixinAccount:edit")
	@RequestMapping(value = "delete")
	public String delete(WeixinAccount weixinAccount, RedirectAttributes redirectAttributes) {
		weixinAccountService.delete(weixinAccount);
		addMessage(redirectAttributes, "删除公众账号管理成功");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinAccount/?repage";
	}

}