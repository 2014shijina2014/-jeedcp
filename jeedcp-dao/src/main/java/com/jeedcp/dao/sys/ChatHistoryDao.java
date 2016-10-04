/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeedcp.dao.sys;


import com.jeedcp.dao.base.CrudDao;
import com.jeedcp.persistence.annotation.MyBatisDao;
import com.jeedcp.entity.iim.ChatHistory;
import java.util.List;

/**
 * 聊天记录DAO接口
 * @author jeeplus
 * @version 2015-12-29
 */
@MyBatisDao
public interface ChatHistoryDao extends CrudDao<ChatHistory> {
	
	
	/**
	 * 查询列表数据
	 * @param entity
	 * @return
	 */
	public List<ChatHistory> findLogList(ChatHistory entity);
	
	
	public int findUnReadCount(ChatHistory chatHistory);
	
}