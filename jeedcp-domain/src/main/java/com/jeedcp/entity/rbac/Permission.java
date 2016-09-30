package com.jeedcp.entity.rbac;

import java.io.Serializable;
import java.util.Date;

public class Permission implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1111531971791658860L;

	private Integer id;

	private Integer dr;

	private Date ts;

	private String name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDr() {
		return dr;
	}

	public void setDr(Integer dr) {
		this.dr = dr;
	}

	public Date getTs() {
		return ts;
	}

	public void setTs(Date ts) {
		this.ts = ts;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	@Override
	public String toString() {
		return "Permission [id=" + id + ", dr=" + dr + ", ts=" + ts + ", name=" + name + "]";
	}

}