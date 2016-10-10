/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.common.utils.StringUtils;
import com.jeedcp.common.web.BaseController;
import com.jeedcp.weixin.entity.WeixinMsgBase;
import com.jeedcp.weixin.entity.WeixinMsgNews;
import com.jeedcp.weixin.service.WeixinMsgBaseService;
import com.jeedcp.weixin.service.WeixinMsgNewsService;
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
 * 微信图文Controller
 * @author jeedcp
 * @version 2016-09-19
 */
@Controller
@RequestMapping(value = "${adminPath}/weixin/weixinMsgNews")
public class WeixinMsgNewsController extends BaseController {

	@Autowired
	private WeixinMsgNewsService weixinMsgNewsService;
	@Autowired
	private WeixinMsgBaseService weixinMsgBaseService;

	@ModelAttribute
	public WeixinMsgNews get(@RequestParam(required=false) String id) {
		WeixinMsgNews entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = weixinMsgNewsService.get(id);
		}
		if (entity == null){
			entity = new WeixinMsgNews();
		}
		return entity;
	}
	
	@RequiresPermissions("weixin:weixinMsgNews:view")
	@RequestMapping(value = {"list", ""})
	public String list(WeixinMsgNews weixinMsgNews, HttpServletRequest request, HttpServletResponse response, Model model) {
		Pagination<WeixinMsgNews> page = weixinMsgNewsService.findPage(new Pagination<WeixinMsgNews>(request, response), weixinMsgNews);
		model.addAttribute("page", page);
		return "modules/weixin/weixinMsgNewsList";
	}

	@RequiresPermissions("weixin:weixinMsgNews:view")
	@RequestMapping(value = "form")
	public String form(WeixinMsgNews weixinMsgNews, Model model) {
		List<WeixinMsgBase> list = weixinMsgBaseService.findList(new WeixinMsgBase());
		model.addAttribute("baseList", list);

		model.addAttribute("weixinMsgNews", weixinMsgNews);
		return "modules/weixin/weixinMsgNewsForm";
	}

	@RequiresPermissions("weixin:weixinMsgNews:edit")
	@RequestMapping(value = "save")
	public String save(WeixinMsgNews weixinMsgNews, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, weixinMsgNews)){
			return form(weixinMsgNews, model);
		}
		weixinMsgNewsService.save(weixinMsgNews);
		addMessage(redirectAttributes, "保存微信图文成功");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinMsgNews/?repage";
	}
	
	@RequiresPermissions("weixin:weixinMsgNews:edit")
	@RequestMapping(value = "delete")
	public String delete(WeixinMsgNews weixinMsgNews, RedirectAttributes redirectAttributes) {
		weixinMsgNewsService.delete(weixinMsgNews);
		addMessage(redirectAttributes, "删除微信图文成功");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinMsgNews/?repage";
	}

}