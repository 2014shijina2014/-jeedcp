/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.jeedcp.common.config.Global;

import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.common.utils.StringUtils;
import com.jeedcp.common.web.BaseController;
import com.jeedcp.weixin.entity.WeixinAccount;
import com.jeedcp.weixin.entity.WeixinMenuGroup;
import com.jeedcp.weixin.service.WeixinAccountService;
import com.jeedcp.weixin.service.WeixinMenuGroupService;
import com.jeedcp.weixin.service.WeixinMenuService;
import com.jeedcp.weixin.web.front.process.WxApiClient;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.List;

/**
 * 菜单组Controller
 * @author jeedcp
 * @version 2016-09-19
 */
@Controller
@RequestMapping(value = "${adminPath}/weixin/weixinMenuGroup")
public class WeixinMenuGroupController extends BaseController {

	@Autowired
	private WeixinMenuGroupService weixinMenuGroupService;
	@Autowired
	private WeixinMenuService weixinMenuService;
	@Autowired
	private WeixinAccountService weixinAccountService;
	
	@ModelAttribute
	public WeixinMenuGroup get(@RequestParam(required=false) String id) {
		WeixinMenuGroup entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = weixinMenuGroupService.get(id);
		}
		if (entity == null){
			entity = new WeixinMenuGroup();
		}
		return entity;
	}
	
	@RequiresPermissions("weixin:weixinMenuGroup:view")
	@RequestMapping(value = {"list", ""})
	public String list(WeixinMenuGroup weixinMenuGroup, HttpServletRequest request, HttpServletResponse response, Model model) {
		Pagination<WeixinMenuGroup> page = weixinMenuGroupService.findPage(new Pagination<WeixinMenuGroup>(request, response), weixinMenuGroup);
		model.addAttribute("page", page);
		return "modules/weixin/weixinMenuGroupList";
	}

	@RequiresPermissions("weixin:weixinMenuGroup:view")
	@RequestMapping(value = "form")
	public String form(WeixinMenuGroup weixinMenuGroup, Model model) {

		List<WeixinAccount> list = weixinAccountService.findList(new WeixinAccount());
		model.addAttribute("weixinAccountList", list);

		model.addAttribute("weixinMenuGroup", weixinMenuGroup);
		return "modules/weixin/weixinMenuGroupForm";
	}

	@RequiresPermissions("weixin:weixinMenuGroup:edit")
	@RequestMapping(value = "save")
	public String save(WeixinMenuGroup weixinMenuGroup, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, weixinMenuGroup)){
			return form(weixinMenuGroup, model);
		}
		weixinMenuGroupService.save(weixinMenuGroup);
		addMessage(redirectAttributes, "保存菜单组成功");
		return "redirect:"+ Global.getAdminPath()+"/weixin/weixinMenuGroup/?repage";
	}
	
	@RequiresPermissions("weixin:weixinMenuGroup:edit")
	@RequestMapping(value = "delete")
	public String delete(WeixinMenuGroup weixinMenuGroup, RedirectAttributes redirectAttributes) {
		StringBuilder sb = new StringBuilder();
		JSONObject rstObj = WxApiClient.deleteMenu(weixinAccountService.get(weixinMenuGroup.getAccountId()));
		if(rstObj != null && rstObj.getInt("errcode") == 0){//成功，更新菜单组
			sb.append("微信公众账号删除菜单成功,");
		}else{
			sb.append("微信公众账号删除菜单失败,");
		}
		weixinMenuGroupService.delete(weixinMenuGroup);

		addMessage(redirectAttributes,sb.append("删除菜单组成功").toString());
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinMenuGroup/?repage";
	}

	@RequiresPermissions("weixin:weixinMenuGroup:edit")
	@RequestMapping(value = "publish")
	public String publish(WeixinMenuGroup weixinMenuGroup, HttpServletRequest request, HttpServletResponse response, Model model) {
 		//发布菜单前先删除旧菜单
		JSONObject rstObj = WxApiClient.deleteMenu(weixinAccountService.get(weixinMenuGroup.getAccountId()));
		if(rstObj != null && rstObj.getInt("errcode") == 0){//成功，更新菜单组
			logger.info("-------------------- 微信公众账号删除菜单成功 -------------------");
		}else{
			logger.info("-------------------- 微信公众账号删除菜单失败 -------------------");
		}
		String account = weixinAccountService.get(weixinMenuGroup.getAccountId()).getAccount();
		return "redirect:/"+account+"/"+Global.getFrontPath()+"/weixin/"+weixinMenuGroup.getId()+"/publishMenu";
	}

}