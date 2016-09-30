package com.jeedcp.entity.user;

import java.io.Serializable;
import java.util.List;

public class Resource implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	private String name;

	private String url;

	private String remark;

	private Integer parentId;

	private Integer sortNo;

	private String moduleName;

	private String createPerson;

	private String createDate;

	private String updatePerson;

	private String updateDate;

	private Integer level;

	private String nextFlag;

	private String icon;

	private List<Resource> children;

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
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getSortNo() {
		return sortNo;
	}

	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
	}

	public String getCreatePerson() {
		return createPerson;
	}

	public void setCreatePerson(String createPerson) {
		this.createPerson = createPerson;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdatePerson() {
		return updatePerson;
	}

	public void setUpdatePerson(String updatePerson) {
		this.updatePerson = updatePerson;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getNextFlag() {
		return nextFlag;
	}

	public void setNextFlag(String nextFlag) {
		this.nextFlag = nextFlag;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public List<Resource> getChildren() {
		return children;
	}

	public void setChildren(List<Resource> children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "Resource [id=" + id + ", name=" + name + ", url=" + url + ", remark=" + remark + ", parentId="
				+ parentId + ",  sortNo=" + sortNo + ", moduleName=" + moduleName + ", createPerson=" + createPerson
				+ ", createDate=" + createDate + ", updatePerson=" + updatePerson + ", updateDate=" + updateDate
				+ ", level=" + level + ", nextFlag=" + nextFlag + ", icon=" + icon + "]";
	}

}