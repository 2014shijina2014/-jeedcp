/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.web.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeedcp.common.config.Global;
import com.jeedcp.modules.weixin.entity.WeixinAccount;
import com.jeedcp.modules.weixin.entity.WeixinFans;
import com.jeedcp.modules.weixin.entity.WeixinMessage;
import com.jeedcp.modules.weixin.service.WeixinAccountService;
import com.jeedcp.modules.weixin.service.WeixinFansService;
import com.jeedcp.modules.weixin.service.WeixinMessageService;
import com.jeedcp.modules.weixin.utils.SignUtil;
import com.jeedcp.modules.weixin.web.front.process.ErrCode;
import com.jeedcp.modules.weixin.web.front.process.MsgXmlUtil;
import com.jeedcp.modules.weixin.web.front.process.WxApiClient;
import com.jeedcp.modules.weixin.web.front.service.impl.MyServiceImpl;
import com.jeedcp.modules.weixin.web.front.vo.MsgRequest;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeedcp.common.web.BaseController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * 测试Controller
 * @author ThinkGem
 * @version 2014-02-28
 */
@Controller
@RequestMapping(value = "{account}/${frontPath}/weixin")
public class WeixinController extends BaseController {


	@Autowired
	private MyServiceImpl myService;

	@Autowired
	public WeixinAccountService weixinAccountService;
	@Autowired
	public WeixinFansService weixinFansService;
	@Autowired
	public WeixinMessageService weixinMessageService;
	/**
	 * GET请求：进行URL、Tocken 认证；
	 * 1. 将token、timestamp、nonce三个参数进行字典序排序
	 * 2. 将三个参数字符串拼接成一个字符串进行sha1加密
	 * 3. 开发者获得加密后的字符串可与signature对比，标识该请求来源于微信
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	@ResponseBody
	public String get(HttpServletRequest request,@PathVariable String account) {
		//如果是多账号，根据url中的account参数获取对应的MpAccount处理即可
		WeixinAccount params = new WeixinAccount();
		params.setAccount(account);
		WeixinAccount mpAccount = weixinAccountService.findList(params).get(0);//获取缓存中的唯一账号
		if(mpAccount != null){
			String token = mpAccount.getToken();//获取token，进行验证；
			String signature = request.getParameter("signature");// 微信加密签名
			String timestamp = request.getParameter("timestamp");// 时间戳
			String nonce = request.getParameter("nonce");// 随机数
			String echostr = request.getParameter("echostr");// 随机字符串

			// 校验成功返回  echostr，成功成为开发者；否则返回error，接入失败
			if (SignUtil.validSign(signature, token, timestamp, nonce)) {
				return echostr;
			}
		}
		return "error";

	}

	/**
	 * POST 请求：进行消息处理；
	 * */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public @ResponseBody String doPost(HttpServletRequest request,@PathVariable String account,HttpServletResponse response) {
		//处理用户和微信公众账号交互消息
		WeixinAccount params = new WeixinAccount();
		params.setAccount(account);
		WeixinAccount mpAccount = weixinAccountService.findList(params).get(0);//获取缓存中的唯一账号
		try {
			MsgRequest msgRequest = MsgXmlUtil.parseXml(request);//获取发送的消息
			return myService.processMsg(msgRequest,mpAccount);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	//创建微信公众账号菜单
	@RequestMapping(value = "{groupId}/publishMenu")
	public String publishMenu(@PathVariable String account,@PathVariable String groupId,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		System.out.println("account="+account+"-----------------groupId="+groupId);
		JSONObject rstObj = null;
		//处理用户和微信公众账号交互消息
		WeixinAccount params = new WeixinAccount();
		params.setAccount(account);
		WeixinAccount mpAccount = weixinAccountService.findList(params).get(0);//获取缓存中的唯一账号
		if(mpAccount != null){
			rstObj = myService.publishMenu(groupId,mpAccount);
			if(rstObj != null){//成功，更新菜单组
				if(rstObj.containsKey("menu_id")){
					addMessage(redirectAttributes,"创建菜单成功");
					return "redirect:"+ Global.getAdminPath()+"/weixin/weixinMenuGroup/?repage";
				}else if(rstObj.containsKey("errcode") && rstObj.getInt("errcode") == 0){
					addMessage(redirectAttributes,"创建菜单成功");
					return "redirect:"+ Global.getAdminPath()+"/weixin/weixinMenuGroup/?repage";
				}
			}
		}
		String failureMsg = "创建菜单失败，请检查菜单：可创建最多3个一级菜单，每个一级菜单下可创建最多5个二级菜单。";
		if(rstObj != null){
			failureMsg += ErrCode.errMsg(rstObj.getInt("errcode"));
		}
		addMessage(redirectAttributes,failureMsg);
		return "redirect:"+ Global.getAdminPath()+"/weixin/weixinMenuGroup/?repage";
	}

	//获取用户列表
	@RequestMapping(value = "/syncAccountFansList")
	public String syncAccountFansList(@PathVariable String account,RedirectAttributes redirectAttributes){
		//处理用户和微信公众账号交互消息
		WeixinAccount params = new WeixinAccount();
		params.setAccount(account);
		WeixinAccount mpAccount = weixinAccountService.findList(params).get(0);//获取缓存中的唯一账号
		if(mpAccount != null){
			boolean flag = myService.syncAccountFansList(mpAccount);
			if(flag){
				return "redirect:"+Global.getAdminPath()+"/weixin/weixinFans/?repage";
			}
		}

		addMessage(redirectAttributes, "获取用户列表失败");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinFans/?repage";
	}

	//根据用户的ID更新用户信息
	@RequestMapping(value = "/syncAccountFans")
	public String syncAccountFans(@PathVariable String account,String openId,RedirectAttributes redirectAttributes){
		//处理用户和微信公众账号交互消息
		WeixinAccount params = new WeixinAccount();
		params.setAccount(account);
		WeixinAccount mpAccount = weixinAccountService.findList(params).get(0);//获取缓存中的唯一账号

		if(mpAccount != null){
			WeixinFans fans = myService.syncAccountFans(openId,mpAccount,true);//同时更新数据库
			if(fans != null){
				/*mv.setViewName("wxcms/fansInfo");
				mv.addObject("fans", fans);
				mv.addObject("cur_nav","fans");
				return mv;*/
				return "redirect:"+Global.getAdminPath()+"/weixin/weixinFans/?repage";
			}
		}

		addMessage(redirectAttributes,"获取用户信息失败,公众号信息或openid信息错误");
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinFans/?repage";
	}

	//以根据openid群发文本消息为例
	@RequestMapping(value = "/massSendTextMsg")
	public String massSendTextMsg(@PathVariable String account,String message_id,RedirectAttributes redirectAttributes){

		//处理用户和微信公众账号交互消息
		WeixinAccount params = new WeixinAccount();
		params.setAccount(account);
		WeixinAccount mpAccount = weixinAccountService.findList(params).get(0);//获取缓存中的唯一账号
		String rstMsg = "根据openid群发文本消息失败";
		//查询全部openID
		List<String> openidList = new ArrayList<>();
		WeixinFans paramsWeixinFans = new  WeixinFans();
		paramsWeixinFans.setAccountId(mpAccount.getId());
		List<WeixinFans> listForFans = weixinFansService.findList(paramsWeixinFans);
		//查出要发送的文本
		WeixinMessage weixinMessage = weixinMessageService.get(message_id);

		if(listForFans!=null && listForFans.size()>0){
			for(WeixinFans o:listForFans){
				openidList.add(o.getOpenid());
			}
		}
		if(mpAccount != null && openidList.size()>0){
			//根据openid群发文本消息
			JSONObject result = WxApiClient.massSendTextByOpenIds(openidList, weixinMessage.getDescription(), mpAccount);

			try {
				if(result.getInt("errcode") != 0){
					addMessage(redirectAttributes,"send failure");
				}else{
					addMessage(redirectAttributes,"send success");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		addMessage(redirectAttributes,rstMsg);
		return "redirect:"+Global.getAdminPath()+"/weixin/weixinMessage/?repage";
	}
}
