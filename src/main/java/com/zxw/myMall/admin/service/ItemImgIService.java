package com.zxw.myMall.admin.service;

import java.util.List;

import com.zxw.myMall.admin.bean.ItemImgBean;

public interface ItemImgIService {

	List<ItemImgBean> showData(ItemImgBean img);

	int getCount(ItemImgBean img);

	int insert(ItemImgBean img);

	int setMain(ItemImgBean img);

	int setMainTwo(ItemImgBean img);

	int delete(ItemImgBean img);

	List<ItemImgBean> showDataTwo(ItemImgBean img);

	List<ItemImgBean> userImgView(ItemImgBean img);

	ItemImgBean findImg(ItemImgBean img);

	List<ItemImgBean> showItemDetailImg(ItemImgBean img);

}
