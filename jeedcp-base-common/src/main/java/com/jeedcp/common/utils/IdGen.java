/**
 * Copyright &copy; 2015-2015  Metinform All rights reserved.
 */
package com.jeedcp.common.utils;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionIdGenerator;
import org.springframework.stereotype.Service;

import java.io.Serializable;

/**
 * 封装各种生成唯一性ID算法的工具类.
 * @author jeedcp
 * @version 2013-01-15
 */
@Service
//@Lazy(false)
public class IdGen implements SessionIdGenerator {


    @Override
	public Serializable generateId(Session session) {
		return IdUtils.uuid();
	}

	public static String uuid() {
		return IdUtils.uuid();
	}
}
