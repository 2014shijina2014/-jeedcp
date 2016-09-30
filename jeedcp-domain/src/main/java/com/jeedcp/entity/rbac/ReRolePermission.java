package com.jeedcp.entity.rbac;

import java.io.Serializable;

public class ReRolePermission implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3512450786703641989L;

	private Integer id;

	private Integer roleid;

	private Integer permissionid;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleid() {
		return roleid;
	}

	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}

	public Integer getPermissionid() {
		return permissionid;
	}

	public void setPermissionid(Integer permissionid) {
		this.permissionid = permissionid;
	}

	@Override
	public String toString() {
		return "ReRolePermission [id=" + id + ", roleid=" + roleid + ", permissionid=" + permissionid + "]";
	}

}