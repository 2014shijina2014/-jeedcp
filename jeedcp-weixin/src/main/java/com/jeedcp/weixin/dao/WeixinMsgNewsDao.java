/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.dao;


import com.jeedcp.common.persistence.CrudDao;
import com.jeedcp.common.persistence.annotation.MyBatisDao;
import com.jeedcp.weixin.entity.WeixinMsgNews;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 微信图文DAO接口
 * @author jeedcp
 * @version 2016-09-19
 */
@MyBatisDao
public interface WeixinMsgNewsDao extends CrudDao<WeixinMsgNews> {
    public List<WeixinMsgNews> getRandomMsgByContent(@Param("accountid") String accountid, @Param("inputcode") String inputcode, @Param("num") Integer num);
}