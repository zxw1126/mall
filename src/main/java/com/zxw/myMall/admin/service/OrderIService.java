package com.zxw.myMall.admin.service;

import java.util.List;

import com.zxw.myMall.admin.bean.OrderBean;

public interface OrderIService {

	List<OrderBean> testCode(OrderBean order);

	int getCount(OrderBean order);

	List<OrderBean> showData(OrderBean order);

	int addOrder(OrderBean order);

	List<OrderBean> echo(OrderBean order);

	int update(OrderBean order);

	int delete(String valueOf);

}
