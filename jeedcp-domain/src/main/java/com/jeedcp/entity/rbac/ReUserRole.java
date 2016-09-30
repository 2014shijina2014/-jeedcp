package com.jeedcp.entity.rbac;

import java.io.Serializable;

public class ReUserRole implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2424046431773245328L;

	private Integer id;

	private Integer userid;

	private Integer roleid;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getRoleid() {
		return roleid;
	}

	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}

	@Override
	public String toString() {
		return "ReUserRole [id=" + id + ", userid=" + userid + ", roleid=" + roleid + "]";
	}

}