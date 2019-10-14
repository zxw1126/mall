package com.zxw.myMall.admin.bean;

import com.zxw.myMall.common.bean.Pager;

public class OrderBean extends Pager {

	private Integer id;
	private String code;
	private String userCode;
	private String time;
	private String addrCode;
	private String state;

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

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAddrCode() {
		return addrCode;
	}

	public void setAddrCode(String addrCode) {
		this.addrCode = addrCode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public OrderBean(Integer id, String code, String userCode, String time, String addrCode, String state) {
		super();
		this.id = id;
		this.code = code;
		this.userCode = userCode;
		this.time = time;
		this.addrCode = addrCode;
		this.state = state;
	}

	public OrderBean() {
		super();
	}

	@Override
	public String toString() {
		return "OrderBean [id=" + id + ", code=" + code + ", userCode=" + userCode + ", time=" + time + ", addrCode="
				+ addrCode + ", state=" + state + ", getPageIndex()=" + getPageIndex() + ", getPageLimit()="
				+ getPageLimit() + ", getRowStart()=" + getRowStart() + "]";
	}

}
