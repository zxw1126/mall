package com.zxw.myMall.user.bean;

import com.zxw.myMall.common.bean.Pager;

public class AddressBean extends Pager {

	private Integer id;
	private String userCode;
	private String recipient;
	private String phone;
	private String province;
	private String city;
	private String district;
	private String detail;

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

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public AddressBean(Integer id, String userCode, String recipient, String phone, String province, String city,
			String district, String detail) {
		super();
		this.id = id;
		this.userCode = userCode;
		this.recipient = recipient;
		this.phone = phone;
		this.province = province;
		this.city = city;
		this.district = district;
		this.detail = detail;
	}

	public AddressBean() {
		super();
	}

	@Override
	public String toString() {
		return "AddressBean [id=" + id + ", userCode=" + userCode + ", recipient=" + recipient + ", phone=" + phone
				+ ", province=" + province + ", city=" + city + ", district=" + district + ", detail=" + detail
				+ ", getPageIndex()=" + getPageIndex() + ", getPageLimit()=" + getPageLimit() + ", getRowStart()="
				+ getRowStart() + "]";
	}

}
