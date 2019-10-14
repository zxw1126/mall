package com.zxw.myMall.user.mapper;

import java.util.List;

import com.zxw.myMall.user.bean.CartBean;

public interface CartIMapper {

	int insert(CartBean cart);

	int delete(Object id);

	int deleteModel(CartBean cart);

	int update(CartBean cart);

	int updateActive(CartBean cart);

	CartBean selectCode(String code);

	List<CartBean> selectLogin(CartBean cart);

	List<CartBean> selectModel(CartBean cart);

	int selectCount(CartBean cart);
}
