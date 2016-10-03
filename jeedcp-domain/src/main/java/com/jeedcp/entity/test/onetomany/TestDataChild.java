package com.jeedcp.entity.test.onetomany;


import javax.validation.constraints.NotNull;
import com.jeedcp.entity.annotation.ExcelField;
import com.jeedcp.entity.base.DataEntity;
import com.jeedcp.entity.sys.Area;
import org.hibernate.validator.constraints.Length;
/**
 * 票务代理Entity
 * @author andy
 * @version 2016-01-15
 */
public class TestDataChild extends DataEntity<TestDataChild> {
	
	private static final long serialVersionUID = 1L;
	private Area start;		// 出发地
	private Area end;		// 目的地
	private Double price;		// 代理价格
	private TestDataMain testDataMain;		// 业务主表ID 父类
	
	public TestDataChild() {
		super();
	}

	public TestDataChild(String id){
		super(id);
	}

	public TestDataChild(TestDataMain testDataMain){
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
	
	@NotNull(message="代理价格不能为空")
	@ExcelField(title="代理价格", align=2, sort=3)
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
	
	@Length(min=0, max=64, message="业务主表ID长度必须介于 0 和 64 之间")
	public TestDataMain getTestDataMain() {
		return testDataMain;
	}

	public void setTestDataMain(TestDataMain testDataMain) {
		this.testDataMain = testDataMain;
	}
	
}