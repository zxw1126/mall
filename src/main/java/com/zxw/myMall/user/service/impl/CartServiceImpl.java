package com.zxw.myMall.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zxw.myMall.user.bean.CartBean;
import com.zxw.myMall.user.mapper.CartIMapper;
import com.zxw.myMall.user.service.CartIService;

@Service
public class CartServiceImpl implements CartIService {

	@Autowired
	private CartIMapper cartMapper;

	@Override
	public List<CartBean> testCode(CartBean cart) {
		return cartMapper.selectModel(cart);
	}

	@Override
	public int getCount(CartBean cart) {
		return cartMapper.selectCount(cart);
	}

	@Override
	public List<CartBean> showData(CartBean cart) {
		return cartMapper.selectModel(cart);
	}

	@Override
	public int delete(CartBean cart) {
		return cartMapper.delete(cart.getId());
	}

	@Override
	public int addCart(CartBean cart) {
		return cartMapper.insert(cart);
	}

	@Override
	public int updateCart(CartBean cart) {
		return cartMapper.update(cart);
	}

	@Override
	public int updateNum(CartBean cart) {
		return cartMapper.updateActive(cart);
	}

}
