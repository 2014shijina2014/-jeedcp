/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.modules.sys.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeedcp.common.cache.EhCacheServiceBean;
import com.jeedcp.common.config.Constants;
import com.jeedcp.common.config.Global;
import com.jeedcp.common.security.Principal;
import com.jeedcp.common.security.shiro.session.SessionDAO;
import com.jeedcp.common.servlet.ValidateCodeServlet;
import com.jeedcp.common.utils.*;
import com.jeedcp.common.web.BaseController;
import com.jeedcp.modules.sys.entity.Menu;
import com.jeedcp.modules.sys.service.SystemService;
import com.jeedcp.modules.sys.utils.CurrentUserUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.collect.Maps;


/***
 * 登录Controller
 * @author Zach Xu
 * @version 2013-5-31
 */
@Controller
public class LoginController extends BaseController {


	@Autowired
	private EhCacheServiceBean ehCacheServiceBean;

	@Autowired
	private SystemService systemService;

	@Autowired
	private SessionDAO sessionDAO;

	@Value("${client.logoutUrl}")
	public String logoutUrl;

	@RequestMapping("${adminPath}/cas-failure")
	public String failure() {
		return "error/403";
	}


	/**
	 * 登录成功，进入管理首页
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "${adminPath}")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		Principal principal = CurrentUserUtils.getPrincipal();

		// 登录成功后，验证码计算器清零，改单点登陆后无效
//		isValidateCodeLogin(principal.getLoginName(), false, true);

		if (logger.isDebugEnabled()){
			logger.debug("show index, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}

		// 如果已登录，再次访问主页，则退出原账号。
		if (Constants.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
			String logined = CookieUtils.getCookie(request, "LOGINED");
			if (StringUtils.isBlank(logined) || "false".equals(logined)){
				CookieUtils.setCookie(response, "LOGINED", "true");
			}else if (StringUtils.equals(logined, "true")){
				CurrentUserUtils.getSubject().logout();
				return "redirect:" + adminPath + "/login";
			}
		}

		// 如果是手机登录，则返回JSON字符串
		if (principal.isMobileLogin()){
			if (request.getParameter("login") != null){
				return renderString(response, principal);
			}
			if (request.getParameter("index") != null){
				return "modules/sys/sysIndex";
			}
			return "redirect:" + adminPath + "/login";
		}

		List<Menu> menuList = systemService.getMenuListById(CurrentUserUtils.getUser().getId());
		model.addAttribute("menuList",menuList);

		return "modules/sys/sysIndex";
	}

	/**
	 * 获取主题方案
	 */
	@RequestMapping(value = "/theme/{theme}")
	public String getThemeInCookie(@PathVariable String theme, HttpServletRequest request, HttpServletResponse response){
		if (StringUtils.isNotBlank(theme)){
			CookieUtils.setCookie(response, "theme", theme);
		}else{
			theme = CookieUtils.getCookie(request, "theme");
		}
		return "redirect:"+request.getParameter("url");
	}

}
