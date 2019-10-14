package com.zxw.myMall.admin.bean;

import com.zxw.myMall.common.bean.Pager;

public class ItemDetailBean extends Pager {
	private Integer id;
	private String code;
	private String name;
	private String price;
	private String detail;
	private String inventory;
	private String state;
	private String itemCode;
	private String url;

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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getInventory() {
		return inventory;
	}

	public void setInventory(String inventory) {
		this.inventory = inventory;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public ItemDetailBean(Integer id, String code, String name, String price, String detail, String inventory,
			String state, String itemCode) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.price = price;
		this.detail = detail;
		this.inventory = inventory;
		this.state = state;
		this.itemCode = itemCode;
	}

	public ItemDetailBean() {
		super();
	}

	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "ItemDetailBean [id=" + id + ", code=" + code + ", name=" + name + ", price=" + price + ", detail="
				+ detail + ", inventory=" + inventory + ", state=" + state + ", itemCode=" + itemCode
				+ ", getPageIndex()=" + getPageIndex() + ", getPageLimit()=" + getPageLimit() + ", getRowStart()="
				+ getRowStart() + "]";
	}

}
