package com.zxw.myMall.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zxw.myMall.admin.bean.OrderBean;
import com.zxw.myMall.admin.mapper.OrderIMapper;
import com.zxw.myMall.admin.service.OrderIService;

@Service
public class OrderServiceImpl implements OrderIService {

	@Autowired
	private OrderIMapper orderMapper;
	@Override
	public List<OrderBean> testCode(OrderBean order) {
		return orderMapper.selectModel(order);
	}

	@Override
	public int getCount(OrderBean order) {
		return orderMapper.selectCount(order);
	}

	@Override
	public List<OrderBean> showData(OrderBean order) {
		return orderMapper.selectModel(order);
	}

	@Override
	public int addOrder(OrderBean order) {
		return orderMapper.insert(order);
	}

	@Override
	public List<OrderBean> echo(OrderBean order) {
		return orderMapper.selectModel(order);
	}

	@Override
	public int update(OrderBean order) {
		return orderMapper.update(order);
	}

	@Override
	public int delete(String id) {		
		return orderMapper.delete(id);
	}

}
