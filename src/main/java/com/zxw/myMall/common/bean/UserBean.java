package com.zxw.myMall.common.bean;

public class UserBean extends Pager {
	private Integer id;
	private String code;
	private String password;
	private String username;
	private String admin;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public UserBean(Integer id, String code, String password, String username, String admin) {
		super();
		this.id = id;
		this.code = code;
		this.password = password;
		this.username = username;
		this.admin = admin;
	}
	public UserBean() {
		super();
	}
	@Override
	public String toString() {
		return "UserBean [id=" + id + ", code=" + code + ", password=" + password + ", username=" + username
				+ ", admin=" + admin + ", getPageIndex()=" + getPageIndex() + ", getPageLimit()=" + getPageLimit()
				+ ", getRowStart()=" + getRowStart() + "]";
	}
	
}
