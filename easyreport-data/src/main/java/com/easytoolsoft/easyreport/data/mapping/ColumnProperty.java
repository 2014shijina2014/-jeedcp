package com.easytoolsoft.easyreport.data.mapping;

public class ColumnProperty {
	public Object value;
	public int sqlType;

	public ColumnProperty(Object value, int sqlType) {
		this.value = value;
		this.sqlType = sqlType;
	}

	public Object getValue() {
		return value;
	}

	public int getSqlType() {
		return sqlType;
	}

}
