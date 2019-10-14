package com.zxw.myMall.admin.bean;

import com.zxw.myMall.common.bean.Pager;

public class ItemImgBean extends Pager {
	private Integer id;
	private String itemDetailCode;
	private String url;
	private String type;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getItemDetailCode() {
		return itemDetailCode;
	}

	public void setItemDetailCode(String itemDetailCode) {
		this.itemDetailCode = itemDetailCode;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public ItemImgBean(Integer id, String itemDetailCode, String url, String type) {
		super();
		this.id = id;
		this.itemDetailCode = itemDetailCode;
		this.url = url;
		this.type = type;
	}

	public ItemImgBean() {
		super();
	}

	@Override
	public String toString() {
		return "ItemImgBean [id=" + id + ", itemDetailCode=" + itemDetailCode + ", url=" + url + ", type=" + type + "]";
	}

	
}
