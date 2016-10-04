package com.jeedcp.web.sys;


import com.google.common.collect.Lists;

import com.jeedcp.common.json.AjaxJson;
import com.jeedcp.dao.sys.UserDao;
import com.jeedcp.entity.sys.Office;
import com.jeedcp.entity.sys.Role;
import com.jeedcp.entity.sys.SystemConfig;
import com.jeedcp.entity.sys.User;

import com.jeedcp.service.sys.OfficeService;
import com.jeedcp.service.sys.SystemConfigService;
import com.jeedcp.service.sys.SystemService;
import com.jeedcp.service.util.UserUtils;
import com.jeedcp.util.StringUtils;
import com.jeedcp.web.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 用户Controller
 * @author jeeplus
 * @version 2013-8-29
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/register")
public class RegisterController extends BaseController {


	@Autowired
	private SystemConfigService systemConfigService;
	
	@Autowired
	private SystemService systemService;
	
	@Autowired
	private OfficeService officeService;
	
	@Autowired
	private UserDao userDao;
	
	@ModelAttribute
	public User get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return systemService.getUser(id);
		}else{
			return new User();
		}
	}
	
	
	
	@RequestMapping(value = {"index",""})
	public String register(User user, Model model) {
		return "modules/sys/register";
	}


	@RequestMapping(value = "registerUser")
	public String registerUser(  HttpServletRequest request,HttpServletResponse response, boolean mobileLogin, String randomCode, String roleName, User user, Model model, RedirectAttributes redirectAttributes) {
		
	
		//验证手机号是否已经注册
		
		if(userDao.findUniqueByProperty("mobile", user.getMobile()) != null){
			// 如果是手机登录，则返回JSON字符串
			if (mobileLogin){
				AjaxJson j = new AjaxJson();
				j.setSuccess(false);
				j.setErrorCode("1");
				j.setMsg("手机号已经被使用！");
		        return renderString(response, j.getJsonStr());
			}else{
				addMessage(model, "手机号已经被使用!");
				return register(user, model);
			}
		}
		
		//验证用户是否已经注册
		
		if(userDao.findUniqueByProperty("login_name", user.getLoginName()) != null){
			// 如果是手机登录，则返回JSON字符串
			if (mobileLogin){
				AjaxJson j = new AjaxJson();
				j.setSuccess(false);
				j.setErrorCode("2");
				j.setMsg("用户名已经被注册！");
		        return renderString(response, j.getJsonStr());
			}else{
				addMessage(model, "用户名已经被注册!");
				return register(user, model);
			}
		}
		
		//验证短信内容
		if(!randomCode.equals(request.getSession().getServletContext().getAttribute(user.getMobile()))){
			// 如果是手机登录，则返回JSON字符串
			if (mobileLogin){
				AjaxJson j = new AjaxJson();
				j.setSuccess(false);
				j.setErrorCode("3");
				j.setMsg("手机验证码不正确!");
		        return renderString(response, j.getJsonStr());
			}else{
				addMessage(model, "手机验证码不正确!");
				return register(user, model);
			}
		}
		
		
		// 修正引用赋值问题，不知道为何，Company和Office引用的一个实例地址，修改了一个，另外一个跟着修改。
		Role role = systemService.getRoleByEnname(roleName);
		String officeCode = "1000";
		if(roleName.equals("patient")){
			officeCode = "1001";
		}
		Office office = officeService.getByCode(officeCode);
		// 密码MD5加密
		user.setPassword(SystemService.entryptPassword(user.getPassword()));
		if (systemService.getUserByLoginName(user.getLoginName()) != null){
			addMessage(model, "注册用户'" + user.getLoginName() + "'失败，用户名已存在");
			return register(user, model);
		}
		// 角色数据有效性验证，过滤不在授权内的角色
		List<Role> roleList = Lists.newArrayList();
		roleList.add(role);
		user.setRoleList(roleList);
		//保存机构
		user.setCompany(office);
		user.setOffice(office);

		// 保存用户信息
		systemService.saveUser(user);
		// 清除当前用户缓存
		if (user.getLoginName().equals(UserUtils.getUser().getLoginName())){
			UserUtils.clearCache();
			//UserUtils.getCacheMap().clear();
		}
		request.getSession().getServletContext().removeAttribute(user.getMobile());//清除验证码
		
		// 如果是手机登录，则返回JSON字符串
		if (mobileLogin){
			AjaxJson j = new AjaxJson();
			j.setSuccess(true);
			j.setMsg("注册用户'" + user.getLoginName() + "'成功");
	        return renderString(response, j);
		}
		
		
		addMessage(redirectAttributes, "注册用户'" + user.getLoginName() + "'成功");
		return "redirect:" + adminPath + "/login";
	}
	
	
	/**
	 * 获取验证码
	 * @param request
	 * @param response
	 * @param mobile
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "getRegisterCode")
	@ResponseBody
	public AjaxJson getRegisterCode(HttpServletRequest request,HttpServletResponse response, String mobile,
			Model model, RedirectAttributes redirectAttributes) {
		
		SystemConfig config = systemConfigService.get("1");
		
		AjaxJson j = new AjaxJson();
		
		//验证手机号是否已经注册
		if(userDao.findUniqueByProperty("mobile", mobile) != null){
			
				j.setSuccess(false);
				j.setErrorCode("1");
				j.setMsg("手机号已经被使用！");
		        return j;
		}
		
		String randomCode = String.valueOf((int) (Math.random() * 9000 + 1000));
		try {
			String result = UserUtils.sendRandomCode(config.getSmsName(),config.getSmsPassword(), mobile, randomCode);
			if (!result.equals("100")) {
				j.setSuccess(false);
				j.setErrorCode("2");
				j.setMsg("短信发送失败，错误代码："+result+"，请联系管理员。");
			}else{
				j.setSuccess(true);
				j.setErrorCode("-1");
				j.setMsg("短信发送成功!");
				request.getSession().getServletContext().setAttribute(mobile, randomCode);
			}
		} catch (IOException e) {
			j.setSuccess(false);
			j.setErrorCode("3");
			j.setMsg("因未知原因导致短信发送失败，请联系管理员。");
		}
		return j;
	}
	
	
	/**
	 * web端ajax验证手机验证码是否正确
	 */
	@ResponseBody
	@RequestMapping(value = "validateMobileCode")
	public boolean validateMobileCode(HttpServletRequest request,
			String mobile, String randomCode) {
		if (randomCode.equals(request.getSession().getServletContext().getAttribute(mobile))) {
			return true;
		} else {
			return false;
		}
	}


}
