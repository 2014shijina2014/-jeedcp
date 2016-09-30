package com.jeedcp.entity.user;

import java.io.Serializable;
import java.util.Date;

public class UserBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String name;

	private String password;

	private String tel;

	private int age;

	private String sex;

	private String email;

	private String islock;

	private int captcha;

	private int dr;

	private Date ts;

	@Override
	public String toString() {
		return "UserBean [id=" + id + ", name=" + name + ", password=" + password + ", tel=" + tel + ", age=" + age
				+ ", sex=" + sex + ", email=" + email + ", islock=" + islock + ", captcha=" + captcha + ", dr=" + dr
				+ ", ts=" + ts + "]";
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIslock() {
		return islock;
	}

	public void setIslock(String islock) {
		this.islock = islock;
	}

	public int getDr() {
		return dr;
	}

	public void setDr(int dr) {
		this.dr = dr;
	}

	public Date getTs() {
		return ts;
	}

	public void setTs(Date ts) {
		this.ts = ts;
	}

	public int getCaptcha() {
		return captcha;
	}

	public void setCaptcha(int captcha) {
		this.captcha = captcha;
	}

}
