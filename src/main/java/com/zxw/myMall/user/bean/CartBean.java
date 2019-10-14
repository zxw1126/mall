package com.zxw.myMall.user.bean;

import java.math.BigDecimal;

import com.zxw.myMall.common.bean.Pager;

public class CartBean extends Pager {
	private Integer id;
	private String userCode;
	private String itemDetailCode;
	private String name;
	private BigDecimal number;
	private BigDecimal price;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getItemDetailCode() {
		return itemDetailCode;
	}
	public void setItemDetailCode(String itemDetailCode) {
		this.itemDetailCode = itemDetailCode;
	}
	public BigDecimal getNumber() {
		return number;
	}
	public void setNumber(BigDecimal number) {
		this.number = number;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CartBean [id=" + id + ", userCode=" + userCode + ", itemDetailCode=" + itemDetailCode + ", number="
				+ number + ", price=" + price + ", getPageIndex()=" + getPageIndex() + ", getPageLimit()="
				+ getPageLimit() + ", getRowStart()=" + getRowStart() + "]";
	}
	public CartBean(Integer id, String userCode, String itemDetailCode, BigDecimal number, BigDecimal price) {
		super();
		this.id = id;
		this.userCode = userCode;
		this.itemDetailCode = itemDetailCode;
		this.number = number;
		this.price = price;
	}
	public CartBean() {
		super();
	}
	
}
