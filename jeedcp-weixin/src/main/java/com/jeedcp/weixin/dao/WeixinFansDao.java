/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeedcp.weixin.dao;


import com.jeedcp.persistence.CrudDao;
import com.jeedcp.persistence.annotation.MyBatisDao;
import com.jeedcp.weixin.entity.WeixinFans;

/**
 * 微信粉丝DAO接口
 * @author jeedcp
 * @version 2016-09-20
 */
@MyBatisDao
public interface WeixinFansDao extends CrudDao<WeixinFans> {

    public int deleteByAccountID(String accountId);
}