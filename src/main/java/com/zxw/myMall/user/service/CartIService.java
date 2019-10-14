package com.zxw.myMall.user.service;

import java.util.List;

import com.zxw.myMall.user.bean.CartBean;

public interface CartIService {

	List<CartBean> testCode(CartBean cart);

	int getCount(CartBean cart);

	List<CartBean> showData(CartBean cart);

	int delete(CartBean cart);

	int addCart(CartBean cart);

	int updateCart(CartBean cart);

	int updateNum(CartBean cart);

}
