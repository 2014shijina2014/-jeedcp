/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.weixin.entity.WeixinAccount;
import com.jeedcp.weixin.entity.WeixinMessage;
import com.jeedcp.weixin.service.WeixinAccountService;
import com.jeedcp.weixin.service.WeixinMessageService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeedcp.common.config.Global;
import com.jeedcp.common.web.BaseController;
import com.jeedcp.common.utils.StringUtils;


import java.util.List;

/**
 * 微信推送信息Controller
 * @author jeedcp
 * @version 2016-09-20
 */
@Controller
@RequestMapping(value = "${adminPath}/weixin/weixinMessage")
public class WeixinMessageController extends BaseController {

	@Autowired
	private WeixinMessageService weixinMessageService;
	@Autowired
	private WeixinAccountService weixinAccountService;

	@ModelAttribute
	public WeixinMessage get(@RequestParam(required=false) String id) {
		WeixinMessage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = weixinMessageService.get(id);
		}
		if (entity == null){
			entity = new WeixinMessage();
		}
		return entity;
	}
	
	@RequiresPermissions("weixin:weixinMessage:view")
	@RequestMapping(value = {"list", ""})
	public String list(WeixinMessage weixinMessage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Pagination<WeixinMessage> page = weixinMessageService.findPage(new Pagination<WeixinMessage>(request, response), weixinMessage);
		model.addAttribute("page", page);
		return "modules/weixin/weixinMessageList";
	}

	@RequiresPermissions("weixin:weixinMessage:view")
	@RequestMapping(value = "form")
	public String form(WeixinMessage weixinMessage, Model model) {

		List<WeixinAccount> list = weixinAccountService.findList(new WeixinAccount());
		model.addAttribute("weixinAccountList", list);

		model.addAttribute("weixinMessage", weixinMessage);
		return "modules/weixin/weixinMessageForm";
	}

	@RequiresPermissions("weixin:weixinMessage:edit")
	@RequestMapping(value = "save")
	public String save(WeixinMessage weixinMessage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, weixinMessage)){
			return form(weixinMessage, model);
		}
		weixinMessageService.save(weixinMessage);
		addMessage(redirectAttributes, "保存微信推送信息成功");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinMessage/?repage";
	}
	
	@RequiresPermissions("weixin:weixinMessage:edit")
	@RequestMapping(value = "delete")
	public String delete(WeixinMessage weixinMessage, RedirectAttributes redirectAttributes) {
		weixinMessageService.delete(weixinMessage);
		addMessage(redirectAttributes, "删除微信推送信息成功");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinMessage/?repage";
	}

	@RequiresPermissions("weixin:weixinMessage:push")
	@RequestMapping(value = "push")
	public String push(WeixinMessage weixinMessage, RedirectAttributes redirectAttributes) {
		WeixinAccount weixinAccount = weixinAccountService.get(weixinMessage.getAccountId());
		return "redirect:/"+weixinAccount.getAccount()+"/"+Global.getFrontPath()+"/weixin/massSendTextMsg?message_id="+weixinMessage.getId();
	}

}