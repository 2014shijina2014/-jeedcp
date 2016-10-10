package com.jeedcp.weixin.web.front.process;


import com.jeedcp.weixin.entity.WeixinAccount;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import java.io.UnsupportedEncodingException;

import java.util.Date;
import java.util.List;

/**
 * 微信 客户端，统一处理微信相关接口
 */

public class WxApiClient {
	
	//获取accessToken
	public static String getAccessToken(WeixinAccount mpAccount){
		//获取唯一的accessToken，如果是多账号，请自行处理
		//AccessToken token = WxMemoryCacheClient.getSingleAccessToken();
		AccessToken token = null;
		if(token != null && !token.isExpires()){//不为空，并且没有过期
			return token.getAccessToken();
		}else{
			token = WxApi.getAccessToken(mpAccount.getAppid(),mpAccount.getAppsecret());
			if(token != null){
				if(token.getErrcode() != null){//获取失败
					System.out.println("## getAccessToken Error = " + token.getErrmsg());
				}else{
					//WxMemoryCacheClient.addAccessToken(mpAccount.getAccount(), token);
					return token.getAccessToken();
				}
			}
			return null;
		}
	}
	
	//获取jsTicket
	public static String getJSTicket(WeixinAccount mpAccount){
		//获取唯一的JSTicket，如果是多账号，请自行处理
		//JSTicket jsTicket = WxMemoryCacheClient.getSingleJSTicket();
		JSTicket jsTicket = null;
		if(jsTicket != null && !jsTicket.isExpires()){//不为空，并且没有过期
			return jsTicket.getTicket();
		}else{
			String token = getAccessToken(mpAccount);
			jsTicket = WxApi.getJSTicket(token);
			if(jsTicket != null){
				if(jsTicket.getErrcode() != null){//获取失败
					System.out.println("## getJSTicket Error = " + jsTicket.getErrmsg());
				}else{
					//WxMemoryCacheClient.addJSTicket(mpAccount.getAccount(), jsTicket);
					return jsTicket.getTicket();
				}
			}
			return null;
		}
	}
	
	//获取OAuthAccessToken
	public static OAuthAccessToken getOAuthAccessToken(WeixinAccount mpAccount,String code){
		//获取唯一的accessToken，如果是多账号，请自行处理
		//OAuthAccessToken token = WxMemoryCacheClient.getSingleOAuthAccessToken();
		OAuthAccessToken token= null;
		if(token != null && !token.isExpires()){//不为空，并且没有过期
			return token;
		}else{
			token = WxApi.getOAuthAccessToken(mpAccount.getAppid(),mpAccount.getAppsecret(),code);
			if(token != null){
				if(token.getErrcode() != null){//获取失败
					System.out.println("## getOAuthAccessToken Error = " + token.getErrmsg());
				}else{
					token.setOpenid(null);//获取OAuthAccessToken的时候设置openid为null；不同用户openid缓存
					//WxMemoryCacheClient.addOAuthAccessToken(mpAccount.getAccount(), token);
					return token;
				}
			}
			return null;
		}
	}
	
	//获取openId
	public static String getOAuthOpenId(WeixinAccount mpAccount,String code){
		OAuthAccessToken token = WxApi.getOAuthAccessToken(mpAccount.getAppid(),mpAccount.getAppsecret(),code);
		if(token != null){
			if(token.getErrcode() != null){//获取失败
				System.out.println("## getOAuthAccessToken Error = " + token.getErrmsg());
			}else{
				return token.getOpenid();
			}
		}
		return null;
	}
	
	//发布菜单
	public static JSONObject publishMenus(String menus,WeixinAccount mpAccount){
		String accessToken = getAccessToken(mpAccount);
		String url = WxApi.getMenuCreateUrl(accessToken);
		return WxApi.httpsRequest(url, HttpMethod.POST, menus);
	}
	
	//创建个性化菜单
	public static JSONObject publishAddconditionalMenus(String menus,WeixinAccount mpAccount){
		String accessToken = getAccessToken(mpAccount);
		String url = WxApi.getMenuAddconditionalUrl(accessToken);
		return WxApi.httpsRequest(url, HttpMethod.POST, menus);
	}
	
	//删除菜单
	public static JSONObject deleteMenu(WeixinAccount mpAccount){
		String accessToken = getAccessToken(mpAccount);
		String url = WxApi.getMenuDeleteUrl(accessToken);
		return WxApi.httpsRequest(url, HttpMethod.POST, null);
	}
	
	//根据openId获取粉丝信息
	public static WeixinFans syncAccountFans(String openId, WeixinAccount mpAccount){
		String accessToken = getAccessToken(mpAccount);
		String url = WxApi.getFansInfoUrl(accessToken, openId);
		JSONObject jsonObj = WxApi.httpsRequest(url, "GET", null);
		if (null != jsonObj) {
			if(jsonObj.containsKey("errcode")){
				int errorCode = jsonObj.getInt("errcode");
				System.out.println(String.format("获取用户信息失败 errcode:{} errmsg:{}", errorCode, ErrCode.errMsg(errorCode)));
				return null;
			}else{
				WeixinFans fans = new WeixinFans();
				fans.setOpenid(jsonObj.getString("openid"));// 用户的标识
				fans.setSubscribestatus(String.valueOf(jsonObj.getInt("subscribe")));// 关注状态（1是关注，0是未关注），未关注时获取不到其余信息
				if(jsonObj.containsKey("subscribe_time")){
					fans.setSubscribetime(jsonObj.getString("subscribe_time"));// 用户关注时间
				}
				if(jsonObj.containsKey("nickname")){// 昵称
					try {
						String nickname = jsonObj.getString("nickname");
						fans.setNickname(nickname.getBytes("UTF-8"));
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
				if(jsonObj.containsKey("sex")){// 用户的性别（1是男性，2是女性，0是未知）
					fans.setGender(String.valueOf(jsonObj.getInt("sex")));
				}
				if(jsonObj.containsKey("language")){// 用户的语言，简体中文为zh_CN
					fans.setLanguage(jsonObj.getString("language"));
				}
				if(jsonObj.containsKey("country")){// 用户所在国家
					fans.setCountry(jsonObj.getString("country"));
				}
				if(jsonObj.containsKey("province")){// 用户所在省份
					fans.setProvince(jsonObj.getString("province"));
				}
				if(jsonObj.containsKey("city")){// 用户所在城市
					fans.setCity(jsonObj.getString("city"));
				}
				if(jsonObj.containsKey("headimgurl")){// 用户头像
					fans.setHeadimgurl(jsonObj.getString("headimgurl"));
				}
				if(jsonObj.containsKey("remark")){
					fans.setRemarks(jsonObj.getString("remark"));
				}
				/*fans.setStatus(1);
				fans.setCreatetime(new Date());*/
				return fans;
			}
		}
		return null;
	}
	

	
	//上传图文消息
	public static JSONObject uploadNews(List<WeixinMsgNews> msgNewsList, WeixinAccount mpAccount){
		JSONObject rstObj = new JSONObject();
		String accessToken = getAccessToken(mpAccount);
		try{
			JSONArray jsonArr = new JSONArray();
			for(WeixinMsgNews news : msgNewsList){
				JSONObject jsonObj = new JSONObject();
				//上传图片素材
				String mediaId = WxApi.uploadMedia(accessToken,MediaType.Image.toString(),news.getPicpath());
				jsonObj.put("thumb_media_id", mediaId);
				if(news.getAuthor() != null){
					jsonObj.put("author", news.getAuthor());
				}else{
					jsonObj.put("author", "");
				}
				if(news.getTitle() != null){
					jsonObj.put("title", news.getTitle());
				}else{
					jsonObj.put("title", "");
				}
				if(news.getFromurl() != null){
					jsonObj.put("content_source_url", news.getFromurl());
				}else{
					jsonObj.put("content_source_url", "");
				}
				if(news.getBrief() != null){
					jsonObj.put("digest", news.getBrief());
				}else{
					jsonObj.put("digest", "");
				}
				if(news.getShowpic() != null){
					jsonObj.put("show_cover_pic", news.getShowpic());
				}else{
					jsonObj.put("show_cover_pic", "1");
				}
				jsonObj.put("content", news.getDescription());
				jsonArr.add(jsonObj);
			}
			JSONObject postObj = new JSONObject();
			postObj.put("articles", jsonArr);
			rstObj = WxApi.httpsRequest(WxApi.getUploadNewsUrl(accessToken), HttpMethod.POST, postObj.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return rstObj;
	}
	
	/**
	 * 根据openid群发接口
	 * @param mediaId：素材的id；通过素材管理,或者上传素材获取
	 * @param msgType
	 * @param mpAccount
	 * @return
	 */
	public static JSONObject massSendByOpenIds(List<String> openids,String mediaId,MsgType msgType,WeixinAccount mpAccount){
		if(openids != null && openids.size() > 0){
			JSONObject postObj = new JSONObject();
			JSONObject media = new JSONObject();
			postObj.put("touser", openids);
			media.put("media_id", mediaId);
			postObj.put(msgType.toString(), media);
			postObj.put("msgtype", msgType.toString());
			String accessToken = getAccessToken(mpAccount);
			return WxApi.httpsRequest(WxApi.getMassSendUrl(accessToken), HttpMethod.POST, postObj.toString());
		}
		return null;
	}
	
	/**
	 * 根据openid群发文本消息
	 * @param openids
	 * @param content
	 * @param mpAccount
	 * @return
	 */
	public static JSONObject massSendTextByOpenIds(List<String> openids,String content, WeixinAccount mpAccount){
		if(openids != null && openids.size() > 0){
			if(openids.size() == 1){//根据openId群发，size至少为2
				openids.add("1");
			}
			String[] arr = (String[])openids.toArray(new String[openids.size()]);
			JSONObject postObj = new JSONObject();
			JSONObject text = new JSONObject();
			postObj.put("touser", arr);
			text.put("content", content);
			postObj.put("text", text);
			postObj.put("msgtype", MsgType.Text.toString());
			String accessToken = getAccessToken(mpAccount);
			return WxApi.httpsRequest(WxApi.getMassSendUrl(accessToken), HttpMethod.POST, postObj.toString());
		}
		return null;
	}
	
	/**
	 * 发送客服消息
	 * @param openid
	 * @param content 消息内容
	 * @return
	 */
	public static JSONObject sendCustomTextMessage(String openid,String content,WeixinAccount mpAccount){
		if(!StringUtils.isBlank(openid) && !StringUtils.isBlank(content)){
			String accessToken = getAccessToken(mpAccount);
			content = WxMessageBuilder.prepareCustomText(openid, content);
			return WxApi.httpsRequest(WxApi.getSendCustomMessageUrl(accessToken), HttpMethod.POST, content);
		}
		return null;
	}
	
	/**
	 * 发送模板消息
	 * @param
	 * @param
	 * @return
	 */
	public static JSONObject sendTemplateMessage(TemplateMessage tplMsg, WeixinAccount mpAccount){
		if(tplMsg != null){
			String accessToken = getAccessToken(mpAccount);
			return WxApi.httpsRequest(WxApi.getSendTemplateMessageUrl(accessToken), HttpMethod.POST, tplMsg.toString());
		}
		return null;
	}
	
	/**
	 * 创建临时二维码
	 * @param expireSecodes 该二维码有效时间，以秒为单位。 最大不超过2592000（即30天），此字段如果不填，则默认有效期为30秒。
	 * @param scene 临时二维码时为32位非0整型，永久二维码时最大值为100000（目前参数只支持1--100000)
	 * @return
	 */
	public static byte[] createQRCode(Integer expireSecodes, Integer scene, WeixinAccount mpAccount){
		if(scene != null){
			String accessToken = getAccessToken(mpAccount);
			String postBody = WxApi.getQrcodeJson(expireSecodes, scene);
			JSONObject jsObj = WxApi.httpsRequest(WxApi.getCreateQrcodeUrl(accessToken),HttpMethod.POST, postBody);
			if(jsObj != null){
				String ticket = jsObj.getString("ticket");
				if(!StringUtils.isBlank(ticket)){
					return WxApi.httpsRequestByte(WxApi.getShowQrcodeUrl(ticket), HttpMethod.GET);
				}
				return null;
			}
		}
		return null;
	}
	
	//创建永久字符串二维码
	public static byte[] createQRCodeLimit(String qrcodeStr, WeixinAccount mpAccount){
		if(!StringUtils.isBlank(qrcodeStr)){
			String accessToken = getAccessToken(mpAccount);
			String postBody = WxApi.getQrcodeLimitJson(qrcodeStr);
			JSONObject jsObj = WxApi.httpsRequest(WxApi.getCreateQrcodeUrl(accessToken),HttpMethod.POST, postBody);
			if(jsObj != null){
				String ticket = jsObj.getString("ticket");
				if(!StringUtils.isBlank(ticket)){
					jsObj = WxApi.httpsRequest(WxApi.getShowQrcodeUrl(ticket), HttpMethod.GET);
					
				}
				return null;
			}
		}
		return null;
	}
	
	
}



