package com.jeedcp.entity.test.onetomany;


import javax.validation.constraints.NotNull;

import com.jeedcp.entity.excel.annotation.ExcelField;
import org.hibernate.validator.constraints.Length;

import com.jeedcp.entity.base.DataEntity;
import com.jeedcp.entity.sys.Area;


/**
 * 票务代理Entity
 * @author andy
 * @version 2016-01-15
 */
public class TestDataChild3 extends DataEntity<TestDataChild3> {
	
	private static final long serialVersionUID = 1L;
	private Area start;		// 出发地
	private Area end;		// 目的地
	private Double price;		// 价格
	private TestDataMain testDataMain;		// 外键 父类
	
	public TestDataChild3() {
		super();
	}

	public TestDataChild3(String id){
		super(id);
	}

	public TestDataChild3(TestDataMain testDataMain){
		this.testDataMain = testDataMain;
	}

	@NotNull(message="出发地不能为空")
	@ExcelField(title="出发地", fieldType=Area.class, value="start.name", align=2, sort=1)
	public Area getStart() {
		return start;
	}

	public void setStart(Area start) {
		this.start = start;
	}
	
	@NotNull(message="目的地不能为空")
	@ExcelField(title="目的地", fieldType=Area.class, value="end.name", align=2, sort=2)
	public Area getEnd() {
		return end;
	}

	public void setEnd(Area end) {
		this.end = end;
	}
	
	@ExcelField(title="价格", align=2, sort=3)
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
	
	@Length(min=1, max=64, message="外键长度必须介于 1 和 64 之间")
	public TestDataMain getTestDataMain() {
		return testDataMain;
	}

	public void setTestDataMain(TestDataMain testDataMain) {
		this.testDataMain = testDataMain;
	}
	
}