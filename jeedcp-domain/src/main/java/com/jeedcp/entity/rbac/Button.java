package com.jeedcp.entity.rbac;

import java.io.Serializable;
import java.util.Date;

public class Button implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5715317369592064489L;

	private Integer id;

	private String name;

	private String code;

	private Integer dr;

	private Date ts;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code == null ? null : code.trim();
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

	@Override
	public String toString() {
		return "Button [id=" + id + ", name=" + name + ", code=" + code + ", dr=" + dr + ", ts=" + ts + "]";
	}

}