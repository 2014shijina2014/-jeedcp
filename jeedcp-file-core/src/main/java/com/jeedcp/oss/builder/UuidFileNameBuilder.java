package com.jeedcp.oss.builder;

import com.jeedcp.oss.Constant;

import java.util.UUID;


/**
 * @author Jeedcp
 *
 * 保持原文件名
 */
public class UuidFileNameBuilder implements FileNameBuilder {

	/* (non-Javadoc)
	 * @see com.belerweb.oss4springmvc.builder.FileNameBuilder#build(java.lang.String)
	 */
	@Override
	public String build(String fileName) {
		String suffix = Constant.EMPTY;
		if (fileName.contains(Constant.DOT)) {
			suffix = fileName.substring(fileName.lastIndexOf(Constant.DOT));
		}
		return UUID.randomUUID().toString() + suffix;
	}

}
