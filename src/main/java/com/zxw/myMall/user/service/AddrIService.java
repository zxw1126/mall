package com.zxw.myMall.user.service;

import java.util.List;

import com.zxw.myMall.user.bean.AddressBean;

public interface AddrIService {

	List<AddressBean> testNumber(AddressBean addr);

	int getCount(AddressBean addr);

	List<AddressBean> showData(AddressBean addr);

	int addAddr(AddressBean addr);

	int delete(AddressBean addr);

}
