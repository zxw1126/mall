package com.zxw.myMall.admin.mapper;

import java.util.List;

import com.zxw.myMall.admin.bean.ItemDetailBean;

public interface ItemDetailIMapper {
	int insert(ItemDetailBean itemDetail);

	int delete(Object id);

	int deleteModel(ItemDetailBean itemDetail);

	int update(ItemDetailBean itemDetail);

	int updateActive(ItemDetailBean itemDetail);

	ItemDetailBean selectCode(ItemDetailBean itemDetail);

	List<ItemDetailBean> selectAll(ItemDetailBean itemDetail);

	List<ItemDetailBean> selectModel(ItemDetailBean itemDetail);

	int selectCount(ItemDetailBean itemDetail);
}
