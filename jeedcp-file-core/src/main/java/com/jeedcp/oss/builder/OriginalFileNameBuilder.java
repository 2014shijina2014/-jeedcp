package com.jeedcp.oss.builder;

/**
 * @author Jeedcp
 *
 * 保持原文件名
 */
public class OriginalFileNameBuilder implements FileNameBuilder {

	/* (non-Javadoc)
	 * @see com.belerweb.oss4springmvc.builder.FileNameBuilder#build(java.lang.String)
	 */
	@Override
	public String build(String fileName) {
		return fileName;
	}

}
