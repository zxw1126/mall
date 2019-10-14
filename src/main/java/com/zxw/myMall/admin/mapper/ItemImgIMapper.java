package com.zxw.myMall.admin.mapper;

import java.util.List;

import com.zxw.myMall.admin.bean.ItemImgBean;

public interface ItemImgIMapper {

	int insert(ItemImgBean img);

	int delete(Object id);

	int deleteModel(ItemImgBean img);

	int update(ItemImgBean img);

	int updateActive(ItemImgBean img);

	List<ItemImgBean> selectId(ItemImgBean img);

	List<ItemImgBean> selectAll(ItemImgBean img);

	List<ItemImgBean> selectModel(ItemImgBean img);

	int selectCount(ItemImgBean img);
}
