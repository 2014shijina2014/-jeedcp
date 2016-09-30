package com.jeedcp.entity.rbac;

import java.io.Serializable;

public class RePermissionButton implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3035643123532630622L;

	private Integer id;

	private Integer permissionid;

	private Integer buttonid;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPermissionid() {
		return permissionid;
	}

	public void setPermissionid(Integer permissionid) {
		this.permissionid = permissionid;
	}

	public Integer getButtonid() {
		return buttonid;
	}

	public void setButtonid(Integer buttonid) {
		this.buttonid = buttonid;
	}

	@Override
	public String toString() {
		return "RePermissionButton [id=" + id + ", permissionid=" + permissionid + ", buttonid=" + buttonid + "]";
	}

}