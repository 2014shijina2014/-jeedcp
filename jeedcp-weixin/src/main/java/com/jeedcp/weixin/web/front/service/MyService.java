package com.jeedcp.weixin.web.front.service;

import com.jeedcp.modules.weixin.entity.WeixinAccount;
import com.jeedcp.modules.weixin.web.front.vo.MsgRequest;
import net.sf.json.JSONObject;

/**
 * 我的微信服务接口，主要用于结合自己的业务和微信接口
 */
public interface MyService {

    //消息处理
    public String processMsg(MsgRequest msgRequest, WeixinAccount mpAccount);

    //发布菜单
    /*public JSONObject publishMenu(String gid, WeixinAccount mpAccount);

    //删除菜单
    public JSONObject deleteMenu(WeixinAccount mpAccount);

    //获取用户列表
    public boolean syncAccountFansList(WeixinAccount mpAccount);*/

    //获取单个用户信息
    //public AccountFans syncAccountFans(String openId, WeixinAccount mpAccount, boolean merge);

    //根据openid 获取粉丝，如果没有，同步粉丝
    //public AccountFans getFansByOpenId(String openid,WeixinAccount mpAccount);

}
