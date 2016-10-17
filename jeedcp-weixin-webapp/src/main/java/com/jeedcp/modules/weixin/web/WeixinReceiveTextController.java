/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.modules.weixin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeedcp.common.persistence.Page;
import com.jeedcp.common.utils.StringUtils;
import com.jeedcp.common.web.BaseController;
import com.jeedcp.modules.weixin.entity.WeixinReceiveText;
import com.jeedcp.modules.weixin.service.WeixinReceiveTextService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jeedcp.common.config.Global;


/**
 * 微信接收信息Controller
 * @author jeedcp
 * @version 2016-09-21
 */
@Controller
@RequestMapping(value = "${adminPath}/weixin/weixinReceiveText")
public class WeixinReceiveTextController extends BaseController {

	@Autowired
	private WeixinReceiveTextService weixinReceiveTextService;
	
	@ModelAttribute
	public WeixinReceiveText get(@RequestParam(required=false) String id) {
		WeixinReceiveText entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = weixinReceiveTextService.get(id);
		}
		if (entity == null){
			entity = new WeixinReceiveText();
		}
		return entity;
	}
	
	@RequiresPermissions("weixin:weixinReceiveText:view")
	@RequestMapping(value = {"list", ""})
	public String list(WeixinReceiveText weixinReceiveText, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<WeixinReceiveText> page = weixinReceiveTextService.findPage(new Page<WeixinReceiveText>(request, response), weixinReceiveText);
		model.addAttribute("page", page);
		return "modules/weixin/weixinReceiveTextList";
	}

	@RequiresPermissions("weixin:weixinReceiveText:view")
	@RequestMapping(value = "form")
	public String form(WeixinReceiveText weixinReceiveText, Model model) {
		model.addAttribute("weixinReceiveText", weixinReceiveText);
		return "modules/weixin/weixinReceiveTextForm";
	}

	@RequiresPermissions("weixin:weixinReceiveText:edit")
	@RequestMapping(value = "save")
	public String save(WeixinReceiveText weixinReceiveText, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, weixinReceiveText)){
			return form(weixinReceiveText, model);
		}
		weixinReceiveTextService.save(weixinReceiveText);
		addMessage(redirectAttributes, "保存微信接收信息成功");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinReceiveText/?repage";
	}
	
	@RequiresPermissions("weixin:weixinReceiveText:edit")
	@RequestMapping(value = "delete")
	public String delete(WeixinReceiveText weixinReceiveText, RedirectAttributes redirectAttributes) {
		weixinReceiveTextService.delete(weixinReceiveText);
		addMessage(redirectAttributes, "删除微信接收信息成功");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinReceiveText/?repage";
	}

}