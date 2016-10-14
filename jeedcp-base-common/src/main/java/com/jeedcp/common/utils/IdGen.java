/**
 * Copyright &copy; 2015-2015  Metinform All rights reserved.
 */
package com.jeedcp.common.utils;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionIdGenerator;
import org.springframework.stereotype.Service;
import org.springframework.util.IdGenerator;

import java.io.Serializable;
import java.util.UUID;
import java.security.SecureRandom;
/**
 * 封装各种生成唯一性ID算法的工具类.
 * @author Zach Xu
 * @version 2013-01-15
 */
@Service
//@Lazy(false)
public class IdGen implements IdGenerator, SessionIdGenerator {

	private static SecureRandom random = new SecureRandom();

	/**
	 * 封装JDK自带的UUID, 通过Random数字生成, 中间无-分割.
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**
	 * 使用SecureRandom随机生成Long.
	 */
	public static long randomLong() {
		return Math.abs(random.nextLong());
	}

	/**
	 * 基于Base62编码的SecureRandom随机生成bytes.
	 */
	public static String randomBase62(int length) {
		byte[] randomBytes = new byte[length];
		random.nextBytes(randomBytes);
		return Encodes.encodeBase62(randomBytes);
	}



	@Override
	public Serializable generateId(Session session) {
		return IdGen.uuid();
	}


	@Override
	public UUID generateId() {
		return null;
	}
}
