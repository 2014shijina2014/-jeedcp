/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.dao;

import com.jeedcp.persistence.CrudDao;
import com.jeedcp.persistence.annotation.MyBatisDao;
import com.jeedcp.weixin.entity.WeixinMsgText;
import org.apache.ibatis.annotations.Param;

/**
 * 微信文本消息DAO接口
 * @author jeedcp
 * @version 2016-09-19
 */
@MyBatisDao
public interface WeixinMsgTextDao extends CrudDao<WeixinMsgText> {
    public WeixinMsgText getMsgTextByInputCode(@Param("accountid") String accountid, @Param("inputcode") String inputcode);
}