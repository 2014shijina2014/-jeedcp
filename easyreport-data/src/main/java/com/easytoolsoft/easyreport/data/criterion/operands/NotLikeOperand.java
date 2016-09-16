package com.easytoolsoft.easyreport.data.criterion.operands;

public class NotLikeOperand extends AbstractOperand {

	private String columnName;
	private Object columnValue;

	public NotLikeOperand(String columnName, Object columnValue) {
		this.columnName = columnName;
		this.columnValue = columnValue;
	}

	@Override
	protected String toExpression() {
		return String.format("%1$s NOT LIKE '%2$s' ", this.columnName, this.columnValue);
	}
}
