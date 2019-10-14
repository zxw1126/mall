package com.zxw.myMall.admin.mapper;

import java.util.List;

import com.zxw.myMall.admin.bean.OrderBean;

public interface OrderIMapper {
	int insert(OrderBean order);

	int delete(Object id);

	int deleteModel(OrderBean order);

	int update(OrderBean order);

	int updateActive(OrderBean order);

	OrderBean selectCode(OrderBean order);

	List<OrderBean> selectAll(OrderBean order);

	List<OrderBean> selectModel(OrderBean order);

	int selectCount(OrderBean order);
}
