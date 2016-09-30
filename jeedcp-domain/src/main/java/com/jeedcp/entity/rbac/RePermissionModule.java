package com.jeedcp.entity.rbac;

import java.io.Serializable;

public class RePermissionModule implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3579190637442093827L;

	private Integer id;

	private Integer permissionid;

	private Integer moduleid;

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

	public Integer getModuleid() {
		return moduleid;
	}

	public void setModuleid(Integer moduleid) {
		this.moduleid = moduleid;
	}

	@Override
	public String toString() {
		return "RePermissionModule [id=" + id + ", permissionid=" + permissionid + ", moduleid=" + moduleid + "]";
	}

}