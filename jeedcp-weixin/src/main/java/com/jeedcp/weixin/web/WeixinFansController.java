/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.Page;
import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.common.utils.StringUtils;
import com.jeedcp.common.web.BaseController;
import com.jeedcp.weixin.entity.WeixinAccount;
import com.jeedcp.weixin.entity.WeixinFans;
import com.jeedcp.weixin.service.WeixinAccountService;
import com.jeedcp.weixin.service.WeixinFansService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jeedcp.common.config.Global;


import java.util.List;

/**
 * 微信粉丝Controller
 * @author jeedcp
 * @version 2016-09-20
 */
@Controller
@RequestMapping(value = "${adminPath}/weixin/weixinFans")
public class WeixinFansController extends BaseController {

	@Autowired
	private WeixinFansService weixinFansService;
	@Autowired
	private WeixinAccountService weixinAccountService;

	@ModelAttribute
	public WeixinFans get(@RequestParam(required=false) String id) {
		WeixinFans entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = weixinFansService.get(id);
		}
		if (entity == null){
			entity = new WeixinFans();
		}
		return entity;
	}
	
	@RequiresPermissions("weixin:weixinFans:view")
	@RequestMapping(value = {"list", ""})
	public String list(WeixinFans weixinFans, HttpServletRequest request, HttpServletResponse response, Model model) {
		Pagination<WeixinFans> page = weixinFansService.findPage(new Pagination<>(request, response), weixinFans);
		model.addAttribute("page", page);
		return "modules/weixin/weixinFansList";
	}

	@RequiresPermissions("weixin:weixinFans:view")
	@RequestMapping(value = "form")
	public String form(WeixinFans weixinFans, Model model) {
		model.addAttribute("weixinFans", weixinFans);
		return "modules/weixin/weixinFansForm";
	}

	@RequiresPermissions("weixin:weixinFans:edit")
	@RequestMapping(value = "save")
	public String save(WeixinFans weixinFans, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, weixinFans)){
			return form(weixinFans, model);
		}
		weixinFansService.save(weixinFans);
		addMessage(redirectAttributes, "保存微信粉丝成功");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinFans/?repage";
	}
	
	@RequiresPermissions("weixin:weixinFans:edit")
	@RequestMapping(value = "delete")
	public String delete(WeixinFans weixinFans, RedirectAttributes redirectAttributes) {
		weixinFansService.delete(weixinFans);
		addMessage(redirectAttributes, "删除微信粉丝成功");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinFans/?repage";
	}

	@RequiresPermissions("weixin:weixinFans:sync")
	@RequestMapping(value = "sync")
	public String sync(WeixinFans weixinFans, Model model,RedirectAttributes redirectAttributes) {

		if (StringUtils.isBlank(weixinFans.getAccountId())){
			addMessage(redirectAttributes, "请选择微信账号");
			return toSync(model);
		}
		//删除所有的粉丝
		weixinFansService.deleteByAccountID(weixinFans.getAccountId());
		//获取公众账号
		WeixinAccount weixinAccount = weixinAccountService.get(weixinFans.getAccountId());

		return "redirect:/"+weixinAccount.getAccount()+"/"+Global.getFrontPath()+"/weixin/syncAccountFansList";
	}

	@RequiresPermissions("weixin:weixinFans:edit")
	@RequestMapping(value = "toSync")
	public String toSync(Model model) {

		List<WeixinAccount> list = weixinAccountService.findList(new WeixinAccount());
		model.addAttribute("weixinAccountList", list);

		return "modules/weixin/weixinFansSync";
	}

}