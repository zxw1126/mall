package com.zxw.myMall.admin.mapper;

import java.util.List;

import com.zxw.myMall.admin.bean.ItemBean;


public interface ItemIMapper {
	int insert(ItemBean item);

	int delete(Object id);

	int deleteModel(ItemBean item);

	int update(ItemBean item);

	int updateActive(ItemBean item);

	ItemBean selectCode(ItemBean item);

	List<ItemBean> selectAll(ItemBean item);

	List<ItemBean> selectModel(ItemBean item);

	int selectCount(ItemBean item);
}
