package com.zxw.myMall.common.bean;

public class OrderDetailBean extends Pager {

	private Integer id;
	private String orderCode;
	private String itemDetailCode;
	private String number;
	private String price;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getItemDetailCode() {
		return itemDetailCode;
	}

	public void setItemDetailCode(String itemDetailCode) {
		this.itemDetailCode = itemDetailCode;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public OrderDetailBean(Integer id, String orderCode, String itemDetailCode, String number, String price) {
		super();
		this.id = id;
		this.orderCode = orderCode;
		this.itemDetailCode = itemDetailCode;
		this.number = number;
		this.price = price;
	}

	public OrderDetailBean() {
		super();
	}

	@Override
	public String toString() {
		return "OrderDetailBean [id=" + id + ", orderCode=" + orderCode + ", itemDetailCode=" + itemDetailCode
				+ ", number=" + number + ", price=" + price + ", getPageIndex()=" + getPageIndex() + ", getPageLimit()="
				+ getPageLimit() + ", getRowStart()=" + getRowStart() + "]";
	}

}
