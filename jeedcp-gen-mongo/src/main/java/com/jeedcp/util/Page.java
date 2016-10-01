package com.jeedcp.util;

import java.util.ArrayList;
import java.util.List;

public class Page {

	/** 默认每页记录数 **/
	public static final int DEFAULT_PAGE_SIZE = 10;

	/** 记录总数 **/
	private int totalRecord;

	/** 当前页页数 **/
	private int pageIndex;

	/** 每页记录数 **/
	private int pageSize;

	/** 当前页数据集 **/
	private List<?> result = new ArrayList<Object>();

	/**
	 * 获取总页数
	 * 
	 * @return
	 */
	public int getTotalPage() {
		if (totalRecord % pageSize == 0)
			return totalRecord / pageSize;
		else
			return totalRecord / pageSize + 1;
	}

	/**
	 * 获取当前页数
	 * 
	 * @return
	 */
	public int getPageIndex() {
		return pageIndex;
	}

	/**
	 * 获取每页记录数
	 * 
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 获取总记录数
	 * 
	 * @return
	 */
	public int getTotalRecord() {
		return totalRecord;
	}

	/**
	 * 当前页首条在数据库里的位置
	 * 
	 * @return
	 */
	public int getRecordIndex() {
		return (pageIndex - 1) * pageSize;
	}

	/**
	 * 获取分页结果集
	 * 
	 * @return
	 */
	public List<?> getResult() {
		return result;
	}

	/**
	 * 构造函数
	 * 
	 * @param recordCount
	 *            总记录数
	 * @param pageIndex
	 *            当前页数
	 * @param pageSize
	 *            每页记录数
	 * @param result
	 *            当前页数据集
	 */
	public Page(int totalRecord, int pageIndex, int pageSize, List<?> result) {
		super();
		this.totalRecord = totalRecord;
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.result = result;
	}

	public Page() {
		super();
	}

	/**
	 * 设置当前页数
	 * 
	 * @param pageIndex
	 * @author MQQ
	 */
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	/**
	 * 设置每页记录数
	 * 
	 * @param pageSize
	 * @author MQQ
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 设置总记录数
	 * 
	 * @param recordCount
	 * @author MQQ
	 */
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	/**
	 * 设置记录集
	 * 
	 * @param result
	 * @author MQQ
	 */
	public void setResult(List<?> result) {
		this.result = result;
	}

}
