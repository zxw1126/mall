package com.zxw.myMall.admin.bean;

import com.zxw.myMall.common.bean.Pager;

public class ItemBean extends Pager {

	private Integer id;
	private String code;
	private String name;
	private String descr;
	private String parentCode;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public ItemBean(Integer id, String code, String name, String descr, String parentCode) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.descr = descr;
		this.parentCode = parentCode;
	}

	public ItemBean() {
		super();
	}

	@Override
	public String toString() {
		return "ItemBean [id=" + id + ", code=" + code + ", name=" + name + ", descr=" + descr + ", parentCode="
				+ parentCode + ", getPageIndex()=" + getPageIndex() + ", getPageLimit()=" + getPageLimit()
				+ ", getRowStart()=" + getRowStart() + "]";
	}

}
